# MySQL Practice — Topic 1: WHERE Clause

Part of my topic-by-topic MySQL practice series. Each topic has 10–15 practice questions on a sample `employees` table, and later topics mix in concepts from earlier ones.

## File Location

```
Data-Engineering/
├── Day-1/
├── Day-2/
├── ...
└── Practice-Set/
    ├── Topic-1-WHERE/              ← you are here
    │   ├── README.md
    │   └── where_practice.sql
    ├── Topic-2-ORDER-BY-LIMIT/
    └── ...
```

| File        | Path                                                                                                            |
| ----------- | --------------------------------------------------------------------------------------------------------------- |
| This README | `Data-Engineering/Practice-Set/Topic-1-WHERE/README.md`                                                         |
| SQL file    | [`where_practice.sql`](./where_practice.sql) → `Data-Engineering/Practice-Set/Topic-1-WHERE/where_practice.sql` |

## Roadmap

| #   | Topic                        | Folder                                 | Status  |
| --- | ---------------------------- | -------------------------------------- | ------- |
| 1   | **WHERE clause**             | `Practice-Set/Topic-1-WHERE/`          | ✅ Done |
| 2   | ORDER BY / LIMIT / DISTINCT  | `Practice-Set/Topic-2-ORDER-BY-LIMIT/` | ⏳ Next |
| 3   | Aggregate functions          | `Practice-Set/Topic-3-AGGREGATE/`      | —       |
| 4   | GROUP BY                     | `Practice-Set/Topic-4-GROUP-BY/`       | —       |
| 5   | HAVING                       | `Practice-Set/Topic-5-HAVING/`         | —       |
| 6   | JOINs                        | `Practice-Set/Topic-6-JOINS/`          | —       |
| 7   | Subqueries                   | `Practice-Set/Topic-7-SUBQUERIES/`     | —       |
| 8   | CASE + string/date functions | `Practice-Set/Topic-8-FUNCTIONS/`      | —       |
| 9   | Window functions             | `Practice-Set/Topic-9-WINDOW/`         | —       |

## Concepts Covered

- **Basic filtering** with `SELECT ... FROM ... WHERE`
- **Comparison operators:** `=`, `!=` / `<>`, `>`, `<`, `>=`, `<=`
- **Logical operators:** `AND`, `OR`, `NOT`
- **Operator precedence:** `NOT` → `AND` → `OR`, and using brackets `()` when mixing `AND` with `OR`
- **`IN`**: matching any value from a list (and `NOT IN`)
- **`BETWEEN ... AND ...`**: inclusive ranges
- **`LIKE` pattern matching:**
  - `%` matches zero or more characters (`'A%'`, `'%@gmail.com'`)
  - `_` matches exactly one character (`'_a%'` means the second letter is "a")
- **NULL handling:** `IS NULL` / `IS NOT NULL` (`= NULL` does not work)
- **Date comparison** using the `'YYYY-MM-DD'` format

## Dataset

Database: `practice_1`. Table: `employees` (12 rows).

| Column     | Type        | Notes                                |
| ---------- | ----------- | ------------------------------------ |
| emp_id     | INT         | Primary key                          |
| name       | VARCHAR(50) |                                      |
| department | VARCHAR(30) | IT, HR, Finance, Sales, Marketing    |
| city       | VARCHAR(30) | Karachi, Lahore, Islamabad, Peshawar |
| salary     | INT         |                                      |
| age        | INT         |                                      |
| join_date  | DATE        |                                      |
| email      | VARCHAR(50) | Some values are NULL                 |

## Questions

| Q   | Question                                                            | Concept                          |
| --- | ------------------------------------------------------------------- | -------------------------------- |
| 1   | Retrieve all details of employees who live in Karachi               | `=`                              |
| 2   | Show name and salary of employees earning more than 80,000          | `>`                              |
| 3   | Show names of IT employees who live in Karachi                      | `AND`                            |
| 4   | Show name and department of employees in HR or Finance              | `OR`                             |
| 5   | Using IN, show names of employees in Sales or Marketing             | `IN`                             |
| 6   | Show name and salary of employees earning 50,000–70,000 (inclusive) | `BETWEEN`                        |
| 7   | Find employees whose name starts with 'A'                           | `LIKE 'A%'`                      |
| 8   | Show names of employees who have no email                           | `IS NULL`                        |
| 9   | Show name and email of employees who use Gmail                      | `LIKE '%@gmail.com'`             |
| 10  | Find employees who do not live in Karachi                           | `!=`, `NOT IN`                   |
| 11  | Find employees who joined on or after Jan 1, 2022                   | Date comparison                  |
| 12  | Find employees younger than 30 who earn more than 50,000            | `<`, `>`, `AND`                  |
| 13  | Find employees whose name has 'a' as the second letter              | `LIKE '_a%'`                     |
| 14  | Find employees in IT or Finance earning more than 90,000            | Brackets / `IN` + `AND`          |
| 15  | Find employees with an email, in Lahore or Islamabad, aged 25–35    | `IS NOT NULL` + `IN` + `BETWEEN` |

## Key Takeaways

- Wildcards (`%`, `_`) only work with `LIKE`, not with `=`.
- Put `%` where the unknown part is: `'A%'` (starts with), `'%n'` (ends with), `'%ar%'` (contains).
- Without brackets, `a OR b AND c` runs as `a OR (b AND c)`. Group the `OR` part in brackets, or use `IN`.
- "More than" means `>`, while "at least" means `>=`.
- Use single quotes for strings (`'Karachi'`). Double quotes are a MySQL extension and fail in standard SQL.
- MySQL string comparison is case-insensitive by default, but other databases may not be.

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `where_practice.sql`. It creates the database and table, inserts the data, then runs all 15 queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Topic-1-WHERE/where_practice.sql
```
