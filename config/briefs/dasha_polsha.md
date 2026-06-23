# Даша Польша (Daryna Shevchenko / Shark Beauty) — Бриф

Польський інфопродукт для beauty-індустрії. Tripwire-воронка: дешевий вхід (39 PLN, ~$10) → upsell на флагман. Реклама через Facebook/Instagram → Sales optimization на покупку tripwire.

> Створено 2026-05-28 через `/account-onboarding`. Кабінет `Sharky`, PLN, Europe/Warsaw. Існуюча історія: 234 дні, $14K spend.

---

## Бизнес

- **Ниша**: Освіта / Інфобізнес / Beauty B2B
- **Бренд**: Shark Beauty / fridayshark (Вроцлав, Польща)
- **Спікер/експерт**: Daryna Shevchenko (Дарина Шевченко)
- **Продукт (tripwire)**: «**Insta Level Up**» — 39 PLN
  - 4 записаних лекції
  - 3 дні практики з фідбеком
  - Фінальний live-вебінар
  - Бонуси: готові сценарії, схеми постів, біо-шаблони, ідеї для каруселей
  - Двох CTA-кнопки на лендингу: для фізосіб і ФОП (Stripe платіж)
- **Регіон**: тільки Польща (PL)
- **Мова**: польська (pl_PL)
- **Целевая аудитория**:
  - Beauty-фахівці: стилісти, майстри манікюру, лешмейкери, інструктори
  - Які тільки почали або розвивають Instagram-акаунт
- **Болі клієнтів**:
  - «Маю мало клієнтів, не вмію продавати через Instagram»
  - «Профіль виглядає аматорськи / не привертає ідеальних клієнтів»
  - «Не знаю про що писати, як упакувати біо, які пости»
- **Конкурентні переваги (УТП)**:
  - Trafiona aесtetyka — професійний візуал бренду
  - Готові сценарії / шаблони (швидкий результат)
  - Live-вебінар як фінальний апсейл
  - Бренд експерта-практика (Shark Beauty)

---

## Цели рекламы

- **Основна ціль**: Tripwire-Sales (одразу платний фронт-енд)
- **Campaign Objective**: `OUTCOME_SALES` (НЕ LEADS!)
- **Optimization Goal**: `OFFSITE_CONVERSIONS` на `Purchase` event Pixel (39 PLN)
- **Destination Type**: WEBSITE
- **Billing Event**: IMPRESSIONS
- **Цільовий CPL** (покупка tripwire): **до $9** (~36 PLN)
- **Цільовий ROAS прямо з tripwire**: **≥ 150%** — амбітно, бо це front-end, а не back-end (зазвичай тут окуп виходить за рахунок upsell)
- **Як ROAS досягається**: tripwire 39 PLN + upsell на live-вебінарі + продаж флагмана = сукупна виручка по ID користувача за період кампанії

---

## Бюджет

- **Дневной бюджет на adset (історичний)**: 45-193 PLN (≈ $11-48). Не фіксована планка — гнучко
- **Минимальный бюджет на AdSet**: 30 PLN (~$8)
- **Валюта рекламной отчётности**: **PLN**
- **CPL у звітах клієнта**: у **USD** (з конвертацією зі spreadsheet) — це треба пам'ятати при моніторингу через MCP (повертає PLN)

---

## Технические ID (для API)

- **Account ID**: `act_1121666772739643` (назва в BM: «Sharky»)
- **Facebook Page ID**: `108577370882966` (Shark Beauty)
- **Instagram Account ID**: `17841429826304157`
- **Facebook Pixel ID**: `1515697820256834`
- **Pixel optimization event**: `Purchase` (стандартний) — оптимізація через `OUTCOME_SALES`
- **URL tripwire**: https://fridayshark.site/level_up

---

## Лендинг та воронка

```
Cold ads → /level_up tripwire (39 PLN) → 3 дн контент + live-вебінар → upsell флагман
```

| Етап | URL | Метрика |
|------|-----|---------|
| Tripwire purchase | `fridayshark.site/level_up` | Purchase event у Pixel |
| Webinar live | (інший URL — TBD) | реєстрація через email |
| Upsell флагман | (на live-вебінарі або в листі) | високий тікет |

---

## Гео-локации

- **Geo**: `countries: ["PL"]` — тільки Польща
- **Locales**: ❓ — треба знайти польський (pl_PL) код. Можливо, не потрібен, якщо гео PL вже звужує
- **Age**: 18-55 (beauty-fashionable аудиторія)
- **Gender**: переважно жінки (90%+ ЦА в beauty)

---

## Правила оптимизации

### Пороговые значения
- **Минимум impressions для решений**: 1000
- **Минимум конверсій для решень**: 3 (purchase)
- **Минимум дней до агрессивних дій**: 2
- **Ad-eater порог**: CPL > target × 3 = **$27** ≈ 110 PLN

### CPL диапазоны
- **Normal**: $2.5-6 (10-25 PLN)
- **Healthy**: $6-9 (25-36 PLN)
- **Watch**: $9-15 (36-60 PLN)
- **Ad-eater**: $15+ (60+ PLN)

### Бюджетные лимити
- **Максимальне збільшення за раз**: 30%
- **Максимальне зменшення за раз**: 50%

### Часові обмеження
- **Часовий пояс**: UTC+1/+2 (Europe/Warsaw — НЕ Kiev!)
- **Не створювати adsets після**: 18:00 Warsaw
- **Старт нових кампаній**: 00:01 наступного дня Europe/Warsaw

---

## Конвенція нейминга кампаній

```
{ddmm}_DashaPoland_{audience_type}_{product}_{manager}
```

| Поле | Значення |
|------|----------|
| `ddmm` | дата запуску (`2605`) |
| `audience_type` | `PL` (broad) · `PL_interests` · `PL_ll` (lookalike) · `rt` · `rt_standart` |
| `product` | `level_up` (поточний tripwire) · раніше `web_insta2026` (вебінар) |
| `manager` | `VM` (Frolov) · `Marta` (другий таргетолог) |

Приклади з реальних кампаній:
- `2605_DashaPoland_PL_level_up_VM` (PL broad)
- `2605_DashaPoland_PL_interests_level_up_VM` (PL + interests)
- `2605_DashaPoland_PL_ll_level_up_VM` (PL Lookalike)
- `2704_DashaPoland_rt_standart_web_insta2026` (retarget на вебінар — старий продукт)

---

## Історичні показники (з spreadsheet, переможні періоди)

**Квітень 2026 (7-15.04):**
- Spend/day: 56-193 PLN (~$14-48)
- CPM: 6.65-9.66 PLN
- CPL (tripwire): **$2.5-5.2**
- Конверт лендингу: **3-13%**
- Сума продажу/день: 198-542 PLN
- ROAS: **211-415%**

**Травень 2026 (12-15.05):**
- Spend/day: 45-164 PLN
- CPL: **$2.6-5.7**
- Конверт лендингу: **11-20%**
- ROAS: **184-394%**

**Висновок:** історично KPI цільових показників CPL ≤ $9 і ROAS ≥ 150% **перевиконуються** — клієнт хоче утримати цей рівень постійно.

---

## Активні кампанії (на 28.05.2026)

**ACTIVE (1):**
- `2605_DashaPoland_PL_interests_level_up_VM` (id `120243745545560259`) — Sales, PL+interests

**PAUSED (recent):**
- `2605_DashaPoland_PL_ll_level_up_VM` (Lookalike)
- `2605_DashaPoland_PL_level_up_VM` (broad PL)
- `1205_level_up_VM` (×2 — травневі тести)

**Старий продукт (paused, web_insta2026 — це інша воронка через webinar):**
- `2804_DashaPoland_PL_interest_web_insta2026`
- `2704_DashaPoland_*_web_insta2026` (5 варіантів)

---

## Креативи

- **Drive**: https://drive.google.com/drive/folders/1X-Z_N9r6j9nbqYWigIMpwZsqOJL4iohQ
- **Стиль**: TBD (проаналізувати при першому ad-аналізі)
- **Мова**: польська
- **Болі в текстах**: «mało klientów», «profil amatorski», «nie wiem o czym pisać»
- **УТП**: gotowe scenariusze, szablony bio, schematy postów, live webinar

---

## Заметки

- **Tripwire-воронка** = одразу гроші назад (відрізняється від Кужель/Кевін, де cold → lead → продаж)
- **Прямий ROAS 150%+** з front-end — амбітна мета, рідко досяжна на cold. Історично виходило через високий конверт лендингу (3-20%) + upsell на live-вебінарі
- **Pixel `1515697820256834`** — використовує стандартний `Purchase` event (39 PLN), не custom
- **Status 3 акаунту (UNSETTLED)** — billing issue, але кампанії ще запускаються. Якщо буде ескалація → потрібно сплатити рахунок інакше можливо обмеження доставки
- **Двочасові пояси для проєктів** — пам'ятати що тут Warsaw (UTC+1/+2), не Kiev. При плануванні запусків — конвертувати

---

## История изменений

| Дата | Изменение |
|------|-----------|
| 2026-05-28 | Створено бриф через `/account-onboarding`. Витягнуто: 15+ існуючих кампаній (1 ACTIVE), конвенція нейминга `{ddmm}_DashaPoland_{audience}_level_up_VM`, продукт «Insta Level Up» (39 PLN), pixel `1515697820256834`, цільові CPL $9 + ROAS 150%. Account status=3 (UNSETTLED billing). Історичні переможні періоди: квітень 7-15 + травень 12-15 з ROAS 184-415%. |
