# Claude Code + meta-ads MCP, 24/7 in browser via code-server
# Base: official code-server (Debian, runs as user `coder` UID 1000)

FROM codercom/code-server:latest

USER root

# ---------- System dependencies ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    ca-certificates \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    jq \
    && rm -rf /var/lib/apt/lists/*

# ---------- Node.js 22 (for Claude Code CLI) ----------
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

# ---------- uv (Python package manager used by meta-ads-mcp) ----------
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/uv \
    && mv /root/.local/bin/uvx /usr/local/bin/uvx

# ---------- Claude Code CLI ----------
RUN npm install -g @anthropic-ai/claude-code

# ---------- meta-ads-mcp (cloned and pre-synced inside the image) ----------
RUN git clone --depth 1 https://github.com/pipeboard-co/meta-ads-mcp.git /opt/meta-ads-mcp \
    && cd /opt/meta-ads-mcp \
    && uv sync \
    && chown -R coder:coder /opt/meta-ads-mcp

# ---------- Entrypoint ----------
COPY docker-entrypoint.sh /usr/local/bin/agent-entrypoint.sh
RUN chmod +x /usr/local/bin/agent-entrypoint.sh

# Workspace lives in /home/coder/workspace (mount Railway volume here)
RUN mkdir -p /home/coder/workspace && chown -R coder:coder /home/coder/workspace

USER coder
WORKDIR /home/coder/workspace

EXPOSE 8080

# Wrapper does git/mcp prep, then execs the original code-server entrypoint
ENTRYPOINT ["/usr/local/bin/agent-entrypoint.sh"]
