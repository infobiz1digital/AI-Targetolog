# Ad Accounts

Список рекламных аккаунтов, которыми управляет агент.

---

## Как добавить аккаунт

1. Скопируй блок-шаблон ниже и заполни его данными своего аккаунта
2. Создай бриф в `briefs/{account_name}.md` (используй `briefs/_template.md`)
3. Убедись, что System User Token имеет доступ к этому аккаунту

---

## Аккаунт 1: Makashovskiy — основной (исторический, UAH)

- **Account ID**: act_488224776520787
- **Page ID**: 425357857333676
- **Instagram ID**: 17841467641821461 (@makashovskiy_school)
- **Название в FB**: «Макашовский - основной»
- **Business Manager**: БМ 98 TLC + Upgrade Community (id 2166727283541631)
- **Сайт**: https://m.makashovski.com/12weeks_summer
- **Бриф**: [briefs/makashovskiy.md](briefs/makashovskiy.md)
- **Статус**: активен (валидный кабинет, не ошибка) — основной исторический, накоплено $24M+ трат, возраст 1315 дней
- **Валюта**: UAH
- **Часовой пояс**: UTC+2 (Europe/Kiev)
- **Тип конверсии**: Lead-формы (исторически)
- **Заметки**: Старый «основной» кабинет в гривне. Используется не для новых запусков в USD — для них кабинет infobiz digital 1 (см. ниже). Здесь — для истории/легаси. Активные кампании пока не трогаем.

---

## Аккаунт 2: Makashovskiy — кабинет infobiz digital 1 (активный для USD-запусков)

- **Account ID**: act_1238835628442693
- **Page ID**: 425357857333676
- **Instagram ID**: 17841467641821461 (@makashovskiy_school) ✓ подтверждено через креатив 973698025060019
- **Pixel ID**: 1865528830653308 (название: «Makashov new») ✓ активен, фиксирует offsite_conversion
- **Pixel-событие для оптимизации**: кастомное `anketa_predzapysu` (пред-запись на лендинге 12weeks_summer) — НЕ стандартное `Lead`. Кастомные конверсии: `anketa_predzapysu`, `CompleteRegistrationHabit`, `mktimefree`, `mkchasi`, `bibliotekaregistration`. Custom Conversion ID для anketa_predzapysu: `9297139860298560`.
- **Название**: infobiz digital 1
- **Business Manager**: infobiz digital 1
- **Сайт**: https://m.makashovski.com/12weeks_summer
- **Бриф**: [briefs/makashovskiy.md](briefs/makashovskiy.md)
- **Статус**: активен (готовится к запуску кампании 12weeks_summer, потрачено $17,139.11, баланс $125.43)
- **Валюта**: USD
- **Часовой пояс**: UTC+2 (Europe/Kiev)
- **Тип конверсии**: OFFSITE_CONVERSIONS на кастомный pixel event `anketa_predzapysu`
- **Целевой CPL**: $10 (фактический CPL похожих кампаний — $2.7–$8.0)
- **Дневной бюджет**: $50
- **Метка кампаний в кабинете**: `Makashov`
- **DSA**: beneficiary/payor — Dmytro Frolov
- **Заметки**: На 13.05.2026 в кабинете уже работают 3 активных OUTCOME_LEADS кампании с этим же лендингом (см. бриф). Новая кампания дополняет существующий пул на $50/день.

---

## Где найти ID

### Account ID
1. Facebook Ads Manager → Настройки аккаунта
2. Или в URL: `https://adsmanager.facebook.com/adsmanager/manage/accounts?act=XXXXXXXXX`
3. Или через MCP: `get_ad_accounts()`

### Page ID
1. Facebook Page → О странице → Прозрачность страницы
2. Или: https://findmyfbid.in/

### Instagram ID
1. Через MCP: `get_account_pages(account_id)` вернёт `instagram_accounts`
2. Или в Business Suite: Instagram → Настройки

---

## Статусы аккаунтов

| Статус | Описание |
|---|---|
| **активен** | Аккаунт в работе, можно оптимизировать |
| **приостановлен** | Временно не работаем, не трогать |
| **архив** | Не используется, только для истории |
