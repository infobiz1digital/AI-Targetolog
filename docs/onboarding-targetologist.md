# 🚀 Онбординг таргетолога — швидкий старт

> Цей документ — для другого/третього таргетолога в команді, який приєднується до проєкту вже з готовою інфраструктурою.
>
> **Не плутати з [00-full-setup-guide.md](00-full-setup-guide.md)** — там повне розгортання з нуля (для адміна).

---

## 📦 Що ти отримаєш в результаті

- ✅ Доступ до 6+ рекламних кабінетів клієнтів через Claude Code
- ✅ AI-агент, який допомагає створювати/оптимізувати кампанії
- ✅ Telegram-звіти по проєктах
- ✅ Спільні брифи/правила/історію дій усієї команди

**Час на налаштування:** 30-60 хв (одноразово)

---

## 🔑 Що адмін повинен зробити ДО твого старту

Перевір, що адмін зробив (інакше нічого не запрацює):

- [ ] Додав твій Facebook-акаунт у Business Manager усіх клієнтів з роллю **Advertiser** (або Employee)
- [ ] Призначив тобі доступ до Ad Accounts, Pages, Pixels, Instagram
- [ ] Запросив тебе в GitHub-репозиторій `infobiz1digital/AI-Targetolog` (роль **Write**)
- [ ] Сказав твій суфікс у неймінгу кампаній (наприклад `MT`, `MR`)

Якщо чогось немає — пиши адміну, без цього кроку далі не йде сенсу.

---

## ⚙️ Крок 1. Встанови Claude Code

### Mac
```bash
curl -fsSL https://claude.ai/install.sh | sh
```
Або через сайт: https://claude.ai/download

### Windows
Завантаж з https://claude.ai/download

### Підписка
- Зайди в https://claude.ai → **Settings** → **Subscription**
- План **Pro** ($20/міс) — мінімум; **Max** ($100/міс) — для активної роботи

---

## ⚙️ Крок 2. Встанови Python + uv

Це потрібно для роботи meta-ads MCP сервера.

### Mac
```bash
# Якщо ще немає Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Python + uv:
brew install python@3.11 uv
```

### Windows
1. Завантаж Python 3.11+ з https://python.org/downloads
2. При встановленні **постав галку "Add Python to PATH"**
3. У терміналі (PowerShell):
```powershell
pip install uv
```

---

## ⚙️ Крок 3. Склонуй два репозиторії

```bash
# 1. Основний робочий репозиторій з конфігами агента:
cd ~
git clone https://github.com/infobiz1digital/AI-Targetolog.git ai-ads-agent

# 2. MCP-сервер для Meta API:
git clone https://github.com/lkm1developer/meta-ads-mcp.git
cd meta-ads-mcp
uv sync
```

---

## ⚙️ Крок 4. Підключи meta-ads MCP до Claude Code

**Важливо:** scope `user` — щоб MCP працював з БУДЬ-ЯКОЇ папки, не тільки з `ai-ads-agent`.

```bash
claude mcp add -s user meta-ads "uv run --directory ~/meta-ads-mcp meta-ads-mcp"
```

Перевір що додалось:
```bash
claude mcp list
```

Має показати:
```
meta-ads: uv run --directory ~/meta-ads-mcp meta-ads-mcp - ✓ Connected
```

---

## ⚙️ Крок 5. Авторизуйся в Meta API

1. Відкрий Claude Code (`cd ~/ai-ads-agent && claude`)
2. У чаті напиши:
   ```
   Дай мені посилання для авторизації в meta-ads
   ```
3. Claude поверне OAuth-посилання
4. Перейди по ньому → залогінься своїм FB-акаунтом (тим, який адмін додав у BM)
5. Підтверди доступ до Marketing API
6. Повернись в Claude і напиши:
   ```
   Покажи список доступних рекламних кабінетів
   ```

Якщо побачив список 6+ кабінетів (Makashov, Kevin, Kuzhel, Dasha Polsha, NastiaSMM, Suzanna) — **готово**.

---

## 📚 Крок 6. Прочитай ключові документи

Це обовʼязково перед першими дiями в кабінетах:

1. **[CLAUDE.md](../CLAUDE.md)** — головні правила (5 хв)
2. **[config/AGENT.md](../config/AGENT.md)** — повна інструкція агента (15 хв)
3. **[config/ad_accounts.md](../config/ad_accounts.md)** — список усіх клієнтів та кабінетів
4. **Брифи проєктів** у [`config/briefs/`](../config/briefs/) — деталі кожного клієнта:
   - `makashovskiy.md`
   - `kevin.md`
   - `kuzhel.md`
   - `dasha_polsha.md`
   - `nastia_smm.md`
5. **Memory-файли в `~/.claude/memory/`** — командна памʼять (якщо адмін поділиться)

---

## 🏷️ Крок 7. Твій суфікс у неймінгу

Кожна кампанія закінчується на 2-літерний код менеджера:

| Менеджер | Код | Приклад |
|---|---|---|
| Frolov | `VM` | `1906_NastiaSMM_UA_site_5_web_freelance_VM` |
| **Ти (Марта)** | **`MT`** ← (узгодити з адміном) | `2306_NastiaSMM_UA_site_3_web_smm_MT` |

Це ВАЖЛИВО — за суфіксом потім фільтруємо хто що запускав.

---

## ✅ Перші 3 безпечні дії на старті

Не починай з створення кампаній. Спочатку «розвідка»:

### День 1
```
/ads-agent
Покажи мені огляд усіх активних кампаній по всіх проєктах за вчора
```

### День 2
```
/ads-reporter
Дай мені звіт по проєкту Makashov за останні 7 днів — топ-5 кращих/гірших кампаній
```

### День 3
```
/ads-optimizer
Знайди мені ad-eater кампанії в проєкті NastiaSMM (CPL вище таргету × 3)
і запропонуй що з ними робити. НЕ роби нічого без мого підтвердження.
```

---

## 🚫 Заборонені дії без узгодження з адміном

- ❌ Збільшувати бюджет кампанії > 30% за раз
- ❌ Зупиняти/видаляти кампанії з ROAS вище цільового
- ❌ Створювати нові продукти/лендинги без брифу
- ❌ Видаляти Custom Audiences
- ❌ Змінювати Pixel-події
- ❌ Запускати кампанії на нові гео без узгодження локалей
- ❌ Скидати чи редагувати файли в `config/` без обговорення

---

## 📝 Обовʼязкове логування

Після КОЖНОЇ зміни в кабінеті — занеси запис у `history/YYYY-MM/YYYY-MM-DD.md`:

```markdown
## 2026-06-24 14:30 — Марта (MT)
- Проєкт: NastiaSMM
- Дія: створено кампанію `2406_NastiaSMM_UA_site_3_web_smm_MT`
- Бюджет: $50/день, старт 00:01 наступного дня
- Аудиторії: 2 адсета (interests + LAL_1%)
- Причина: тестуємо новий лендинг site_3
```

Це робить агент автоматично — просто перевіряй що запис є.

---

## 📞 Хто за що відповідає

| Проєкт | Менеджер | Контакт |
|---|---|---|
| Makashov | Frolov + Марта | TBD |
| Kevin | Frolov + Марта | TBD |
| Kuzhel | Frolov + Марта | TBD |
| Dasha Polsha | Frolov + Марта | TBD |
| NastiaSMM | Frolov + Марта | TBD |
| Suzanna | Frolov + Марта | TBD |

---

## ❓ Якщо щось пішло не так

1. **MCP не підключається** → перевір `claude mcp list`, перезапусти `uv sync` у папці meta-ads-mcp
2. **Не бачу кабінет клієнта** → адмін має додати тебе в BM з потрібними активами
3. **Помилка "Page advertiser permissions"** → попроси клієнта/адміна надати тобі роль на FB-сторінку
4. **Не розумію бриф проєкту** → читай [`config/briefs/{project}.md`](../config/briefs/) повністю + спитай адміна
5. **Будь-яка інша помилка** → читай [`config/knowledge/troubleshooting.md`](../config/knowledge/troubleshooting.md)

---

## 🎯 Підсумок

Готова, коли:
- [ ] Claude Code встановлено + є підписка
- [ ] Python + uv встановлено
- [ ] Обидва репо клоновано
- [ ] `claude mcp list` показує `meta-ads ✓ Connected`
- [ ] OAuth пройдено, бачу список 6+ кабінетів
- [ ] Прочитала CLAUDE.md, AGENT.md, всі брифи
- [ ] Узгоджено суфікс у неймінгу (`MT`?)
- [ ] Тестовий запит `/ads-reporter` повернув звіт

**Welcome to the team! 🎉**
