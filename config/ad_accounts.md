# Ad Accounts

Список рекламных аккаунтов, которыми управляет агент.

---

## Как добавить аккаунт

1. Скопируй блок-шаблон ниже и заполни его данными своего аккаунта
2. Создай бриф в `briefs/{account_name}.md` (используй `briefs/_template.md`)
3. Убедись, что System User Token имеет доступ к этому аккаунту

---

## Аккаунт 1: Makashovskiy — Школа английского

- **Account ID**: act_488224776520787
- **Page ID**: 425357857333676
- **Instagram ID**: нет (не привязан к странице)
- **Название**: Makashovskiy - Школа англійської мови
- **Business Manager**: БМ 98 TLC + Upgrade Community (id 2166727283541631)
- **Сайт**: TBD (уточнить у клиента)
- **Бриф**: [briefs/makashovskiy.md](briefs/makashovskiy.md)
- **Статус**: активен
- **Валюта**: UAH
- **Часовой пояс**: UTC+2 (Europe/Kiev)
- **Тип конверсии**: Lead-формы (уточнить — может быть Site Leads через Pixel)
- **Заметки**: Языковая школа. Курсы английского, мини-курсы, бесплатные уроки. Аудитория RU/UA-говорящая, гео Украина + Европа.

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
