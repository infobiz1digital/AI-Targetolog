# Деплой AI Ads Agent на Railway (24/7 в браузере)

Эта инструкция разворачивает Claude Code + meta-ads MCP в облачном контейнере на Railway.
После деплоя ты заходишь на `https://your-service.up.railway.app`, вводишь пароль и
получаешь VS Code в браузере. В терминале набираешь `claude` — и работаешь с агентом 24/7.

---

## 0. Что должно быть готово до старта

- [ ] GitHub аккаунт с доступом к репо `infobiz1digital/AI-Targetolog`
- [ ] Meta System User Token (permanent) — у тебя уже есть
- [ ] Anthropic API key — получить на https://console.anthropic.com/settings/keys
- [ ] Аккаунт Railway — https://railway.app/login (через GitHub)
- [ ] GitHub Personal Access Token (PAT) — см. шаг 2

---

## 1. Создать GitHub Personal Access Token

Этот токен будет использовать агент, чтобы пушить коммиты обратно в репо.

1. https://github.com/settings/personal-access-tokens → **Generate new token (Fine-grained)**
2. Имя: `ai-ads-agent-railway`
3. Expiration: 90 дней или дольше (выставь напоминание в календарь обновить)
4. Repository access: **Only select repositories** → `infobiz1digital/AI-Targetolog`
5. Repository permissions:
   - **Contents**: Read and write
   - **Metadata**: Read-only (выставляется автоматически)
6. **Generate token** → СКОПИРУЙ его сразу (показывается один раз, начинается с `github_pat_...`)

---

## 2. Задеплоить сервис на Railway

1. https://railway.app/new → **Deploy from GitHub repo**
2. Дай Railway разрешение на чтение репозиториев → выбери `infobiz1digital/AI-Targetolog`
3. Railway автоматически найдёт `Dockerfile` и `railway.json` → начнёт билд (10–15 минут на первый раз)

### Пока билдится — настроить переменные окружения

В Railway-проекте: **Variables** → **New Variable** → ввести каждую из списка ниже:

| Variable                  | Где взять / что вводить                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------|
| `META_APP_ID`             | Из текущего локального `.mcp.json` (`989316343845593`)                                      |
| `META_APP_SECRET`         | Из текущего `.mcp.json`                                                                     |
| `META_ACCESS_TOKEN`       | Permanent System User token                                                                 |
| `ANTHROPIC_API_KEY`       | https://console.anthropic.com/settings/keys → Create Key                                    |
| `CODE_SERVER_PASSWORD`    | Любой надёжный пароль — будешь вводить при входе в VS Code в браузере                       |
| `GITHUB_TOKEN`            | PAT из шага 1                                                                               |
| `GITHUB_REPO_URL`         | `https://github.com/infobiz1digital/AI-Targetolog.git`                                      |
| `GITHUB_BRANCH`           | `main`                                                                                      |
| `GIT_USER_NAME`           | `AI Ads Agent` (или своё)                                                                   |
| `GIT_USER_EMAIL`          | `agent@infobiz1digital.local` (или свой email)                                              |

После добавления всех переменных Railway пересоберёт сервис автоматически.

---

## 3. Подключить persistent volume

Чтобы файлы в `/home/coder/workspace` (включая клон репо и историю Claude) переживали рестарты:

1. В сервисе на Railway: **Settings** → **Volumes** → **Add Volume**
2. **Mount path**: `/home/coder/workspace`
3. **Size**: 1 GB (хватит надолго)
4. Railway перезапустит сервис

---

## 4. Открыть публичный домен

1. В сервисе: **Settings** → **Networking** → **Generate Domain**
2. Получишь URL вида `https://ai-ads-agent-production.up.railway.app`
3. Открой его в браузере → откроется страница входа code-server
4. Введи `CODE_SERVER_PASSWORD` из шага 2

---

## 5. Первая сессия с Claude

После входа в VS Code:

1. **Terminal** → **New Terminal** (Ctrl+\` или ⌘+\`)
2. Проверь, что репо склонировался:
   ```bash
   pwd                      # должно быть /home/coder/workspace/ai-ads-agent
   ls config/briefs/        # должен быть makashovskiy.md
   cat .mcp.json            # должен показать структуру с meta-ads (токены из env)
   ```
3. Запусти Claude Code:
   ```bash
   claude
   ```
4. На первом запуске Claude спросит про OAuth/API key — он автоматически подхватит `ANTHROPIC_API_KEY` из окружения и стартанёт
5. Проверь MCP:
   ```
   /mcp
   ```
   Должен показать `meta-ads` со статусом `connected`. Если `failed` — посмотри логи в Railway.

---

## 6. Первая тестовая команда

В Claude напиши что-то лёгкое, чтобы убедиться, что MCP работает:

```
Покажи список рекламных кампаний с меткой Makashov в кабинете act_1238835628442693
```

Если получишь список — всё работает. ✅

---

## 7. Как делать коммиты обратно в GitHub

Просто скажи Claude:
```
закоммить и пушни изменения в брифе
```

Он использует уже настроенный git с твоим PAT и запушит.

---

## Cтоимость

- **Railway**: ~$5/мес за Hobby plan (always-on container с 512 MB RAM)
- **Anthropic API**: pay-as-you-go, ~$5–30/мес зависит от использования
- **GitHub PAT**: бесплатно

---

## Troubleshooting

| Симптом                                          | Решение                                                                             |
|--------------------------------------------------|-------------------------------------------------------------------------------------|
| 502 Bad Gateway на Railway URL                   | Подожди билд (10–15 мин на первый раз). Смотри **Deployments** → **View Logs**.    |
| code-server не пускает по паролю                 | Проверь `CODE_SERVER_PASSWORD` в Variables, без лишних пробелов. Сервис рестартни.  |
| `/mcp` показывает `failed` для meta-ads          | Проверь `META_ACCESS_TOKEN` — не истёк ли, есть ли права `ads_management`.          |
| Claude говорит "No API key found"                | `ANTHROPIC_API_KEY` не задан или с опечаткой. Проверь Variables.                    |
| `git push` падает с auth error                   | `GITHUB_TOKEN` истёк или без прав Contents:write. Перевыпусти, обнови переменную.   |
| После рестарта пропали файлы из workspace        | Volume не подключён. Settings → Volumes → проверь mount path `/home/coder/workspace`. |

---

## Локально продолжаем работать как раньше

Локальная папка `/Users/valeriiahoncharova/ai-ads-agent` и облачная — независимые копии,
обе синхронизируются через GitHub. Удобно: правки → `git pull` в другом месте.
