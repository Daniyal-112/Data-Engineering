# MySQL Practice — Topic 3: Aggregate Functions

Part of my topic-by-topic MySQL practice series. Each topic has practice questions on a sample `employees` table, and later topics mix in concepts from earlier ones. This topic also uses `WHERE`, `BETWEEN`, `LIKE` and `DISTINCT` from Topics 1 and 2.

## File Location

```
Data-Engineering/
├── Day-1/
├── Day-2/
├── ...
└── Practice-Set/
    ├── Topic-1-WHERE/
    ├── Topic-2-ORDER-BY-LIMIT/
    ├── Topic-3-AGGREGATE/           ← you are here
    │   ├── README.md
    │   └── aggregate_practice.sql
    └── ...
```

| File        | Path                                                                                                                            |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------- |
| This README | `Data-Engineering/Practice-Set/Topic-3-AGGREGATE/README.md`                                                                     |
| SQL file    | [`aggregate_practice.sql`](./aggregate_practice.sql) → `Data-Engineering/Practice-Set/Topic-3-AGGREGATE/aggregate_practice.sql` |

## Roadmap

| #   | Topic                        | Folder                                 | Status  |
| --- | ---------------------------- | -------------------------------------- | ------- |
| 1   | WHERE clause                 | `Practice-Set/Topic-1-WHERE/`          | ✅ Done |
| 2   | ORDER BY / LIMIT / DISTINCT  | `Practice-Set/Topic-2-ORDER-BY-LIMIT/` | ✅ Done |
| 3   | **Aggregate functions**      | `Practice-Set/Topic-3-AGGREGATE/`      | ✅ Done |
| 4   | GROUP BY                     | `Practice-Set/Topic-4-GROUP-BY/`       | ⏳ Next |
| 5   | HAVING                       | `Practice-Set/Topic-5-HAVING/`         | —       |
| 6   | JOINs                        | `Practice-Set/Topic-6-JOINS/`          | —       |
| 7   | Subqueries                   | `Practice-Set/Topic-7-SUBQUERIES/`     | —       |
| 8   | CASE + string/date functions | `Practice-Set/Topic-8-FUNCTIONS/`      | —       |
| 9   | Window functions             | `Practice-Set/Topic-9-WINDOW/`         | —       |

## Concepts Covered

- **Aggregate functions** combine many rows into a single value:
  - `COUNT()`: number of rows
  - `SUM()`: total
  - `AVG()`: average
  - `MIN()` / `MAX()`: smallest / largest value (works on numbers **and dates**)
- **Three forms of COUNT:**
  - `COUNT(*)`: all rows, including NULLs
  - `COUNT(column)`: only rows where that column is not NULL
  - `COUNT(DISTINCT column)`: number of unique values
- **NULL handling:** every aggregate except `COUNT(*)` ignores NULLs
- **Aliases** with `AS` for readable column names (`AS avg_salary`)
- **`ROUND(value, n)`** to limit decimal places
- **Math on aggregates:** `MAX(salary) - MIN(salary)`, `COUNT(*) - COUNT(email)`
- **Aggregates with `WHERE`:** rows are filtered first, then aggregated

## Dataset

Database: `practice_3`. Table: `employees` (12 rows), same structure as the earlier topics.

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

| Q   | Question                                                                     | Concept                       |
| --- | ---------------------------------------------------------------------------- | ----------------------------- |
| 1   | Find the total number of employees                                           | `COUNT(*)`                    |
| 2   | In one query, show how many employees have an email and how many do not      | `COUNT(column)` vs `COUNT(*)` |
| 3   | Find the total salary paid to all employees                                  | `SUM`                         |
| 4   | Find the average salary, named `avg_salary`                                  | `AVG` + `AS`                  |
| 5   | Show the highest and lowest salary in one query                              | `MAX` + `MIN`                 |
| 6   | Count how many employees live in Karachi                                     | `WHERE` + `COUNT`             |
| 7   | Find the average salary of the IT department                                 | `WHERE` + `AVG`               |
| 8   | Find the total salary of the Finance department                              | `WHERE` + `SUM`               |
| 9   | Count how many unique departments there are                                  | `COUNT(DISTINCT ...)`         |
| 10  | Find the average age, rounded to 1 decimal place                             | `ROUND(AVG(...), 1)`          |
| 11  | Show the earliest and the latest join date                                   | `MIN` / `MAX` on dates        |
| 12  | Count employees earning between 50,000 and 90,000                            | `BETWEEN` + `COUNT`           |
| 13  | For Gmail users, show their count and average age                            | `LIKE` + `COUNT` + `AVG`      |
| 14  | Find the gap between the highest and lowest IT salary, named `salary_gap`    | Math on aggregates            |
| 15  | For employees who joined in 2022 or later, show their count and total salary | Date filter + `COUNT` + `SUM` |

## Key Takeaways

- Without `GROUP BY`, an aggregate query returns **exactly one row**.
- `COUNT(*)` counts rows. Use `COUNT(column)` only when you want to skip NULLs in that column.
- Don't mix plain columns with aggregates: `SELECT name, MAX(salary)` is an error or gives a wrong name. GROUP BY and subqueries solve this.
- Aggregates cannot be used inside `WHERE` (`WHERE salary > AVG(salary)` fails), because `WHERE` runs before aggregates are calculated. HAVING and subqueries solve this.
- `AVG()` returns decimals (e.g. `75500.0000`). Use `ROUND()` to clean it up.
- Give every aggregate an alias in `snake_case` so the output is readable.

## Clause Order

**Writing order:**

```sql
SELECT DISTINCT columns / aggregates
FROM table
WHERE condition
GROUP BY column        -- Topic 4
HAVING condition       -- Topic 5
ORDER BY column
LIMIT n;
```

**Execution order:** `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `aggregate_practice.sql`. It creates the database and table, inserts the data, then runs all 15 queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Topic-3-AGGREGATE/aggregate_practice.sql
```
