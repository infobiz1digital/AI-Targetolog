#!/usr/bin/env bash
# Container start-up:
# 1. Clone repo into /home/coder/workspace/ai-ads-agent if missing (first run)
# 2. Configure git author + credential helper with $GITHUB_TOKEN
# 3. Write .mcp.json from env vars (so secrets stay out of git)
# 4. exec code-server on the port Railway assigns (or 8080 locally)

set -euo pipefail

WORKSPACE=/home/coder/workspace
REPO_DIR=$WORKSPACE/ai-ads-agent
REPO_URL=${GITHUB_REPO_URL:-https://github.com/infobiz1digital/AI-Targetolog.git}
BRANCH=${GITHUB_BRANCH:-main}

log() { echo "[entrypoint] $*"; }

# ---------- 1. Clone repo on first run ----------
if [ ! -d "$REPO_DIR/.git" ]; then
    log "Cloning $REPO_URL into $REPO_DIR (first run)"
    if [ -n "${GITHUB_TOKEN:-}" ]; then
        AUTH_URL=$(echo "$REPO_URL" | sed "s|https://|https://oauth2:${GITHUB_TOKEN}@|")
        git clone --branch "$BRANCH" "$AUTH_URL" "$REPO_DIR"
    else
        git clone --branch "$BRANCH" "$REPO_URL" "$REPO_DIR"
    fi
else
    log "Repo already present at $REPO_DIR — skipping clone"
fi

# ---------- 2. Git config ----------
git config --global user.name "${GIT_USER_NAME:-AI Ads Agent}"
git config --global user.email "${GIT_USER_EMAIL:-agent@infobiz1digital.local}"
git config --global init.defaultBranch main
git config --global pull.rebase false

# Credential helper so git push works without prompts
if [ -n "${GITHUB_TOKEN:-}" ]; then
    git config --global credential.helper store
    echo "https://oauth2:${GITHUB_TOKEN}@github.com" > /home/coder/.git-credentials
    chmod 600 /home/coder/.git-credentials
fi

# Tell git the workspace is safe (volumes can have weird ownership)
git config --global --add safe.directory "$REPO_DIR"

# ---------- 3. Generate .mcp.json from env vars ----------
MCP_FILE=$REPO_DIR/.mcp.json
if [ -n "${META_APP_ID:-}" ] && [ -n "${META_ACCESS_TOKEN:-}" ]; then
    log "Writing $MCP_FILE from environment"
    cat > "$MCP_FILE" <<EOF
{
  "mcpServers": {
    "meta-ads": {
      "command": "uv",
      "args": [
        "run",
        "--directory",
        "/opt/meta-ads-mcp",
        "meta-ads-mcp"
      ],
      "env": {
        "META_APP_ID": "${META_APP_ID}",
        "META_APP_SECRET": "${META_APP_SECRET:-}",
        "META_ACCESS_TOKEN": "${META_ACCESS_TOKEN}"
      }
    }
  }
}
EOF
    chmod 600 "$MCP_FILE"
else
    log "WARN: META_APP_ID or META_ACCESS_TOKEN not set — .mcp.json was NOT written"
    log "      Set these env vars on Railway, then restart the service"
fi

# ---------- 4. Hand off to code-server ----------
PORT=${PORT:-8080}
log "Starting code-server on 0.0.0.0:${PORT}, workspace=$REPO_DIR"

# PASSWORD env var → code-server uses it for browser auth
# HASHED_PASSWORD also supported if you prefer
export PASSWORD=${CODE_SERVER_PASSWORD:-${PASSWORD:-}}
if [ -z "$PASSWORD" ]; then
    log "WARN: no CODE_SERVER_PASSWORD set — code-server will use a random one (check Railway logs)"
fi

exec /usr/bin/entrypoint.sh \
    --bind-addr "0.0.0.0:${PORT}" \
    --auth password \
    "$REPO_DIR"
