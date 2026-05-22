# Team Workspace

Централізований робочий простір команди таргетологів, які ведуть Facebook/Meta рекламу через AI-агента (`scripts/agent`). Тут зберігаються профілі команди, конфіги проєктів, шаблони та щоденні зведені звіти.

## Структура

```
projects/         — по одній папці на кожен рекламний проєкт
targetologists/   — профілі учасників команди
daily/            — щоденні зведені звіти по всіх проєктах
templates/        — шаблони для нових проєктів та профілів
```

Конфіги рекламних кабінетів і брифи окремих клієнтів лежать у `config/` (як було раніше) — workspace-папки їх не замінюють, а доповнюють.

## Правила нейминга

- Усі назви проєктів і файлів — **kebab-case**: `project-alpha`, `school-kevin`, `daily-2026-05-22.md`.
- Без пробілів, без CamelCase, без транслітерації з великих літер.
- Дати у назвах файлів — у форматі `YYYY-MM-DD`.

## Як додати новий проєкт

1. Скопіюй шаблон:
   ```
   cp -r templates/project-template projects/<project-name>
   ```
2. Заповни `projects/<project-name>/README.md` (назва, клієнт, бюджет, цілі, KPI).
3. Заповни `projects/<project-name>/config.json` (ad_account_id, owner, currency, goals, status).
4. Закомить:
   ```
   git add projects/<project-name>
   git commit -m "[<targetologist>/<project-name>] init project"
   git push
   ```

## Як додати нового таргетолога

1. Скопіюй шаблон:
   ```
   cp templates/targetologist-template.md targetologists/<name>.md
   ```
2. Заповни ім'я, GitHub username, Telegram, перелік проєктів, контакти.
3. Закомить:
   ```
   git add targetologists/<name>.md
   git commit -m "[<name>/team] add targetologist profile"
   git push
   ```

## Формат коміта

```
[<targetologist>/<project>] <action> <description>
```

Приклади:
- `[valeria/makashovskiy] update daily budget for site-leads adset`
- `[valeria/kevin] init project`
- `[valeria/team] add daily report 2026-05-22`

Якщо коміт стосується команди в цілому, а не конкретного проєкту — використовуй `team` як проєкт.
