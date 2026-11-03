# MySQL Practice — Topic 4: GROUP BY

Part of my topic-by-topic MySQL practice series. Each topic has practice questions on a sample `employees` table, and later topics mix in concepts from earlier ones. This topic combines `GROUP BY` with aggregates (Topic 3), `WHERE` / `LIKE` (Topic 1) and `ORDER BY` / `LIMIT` (Topic 2).

## File Location

```
Data-Engineering/
├── Day-1/
├── Day-2/
├── ...
└── Practice-Set/
    ├── Topic-1-WHERE/
    ├── Topic-2-ORDER-BY-LIMIT/
    ├── Topic-3-AGGREGATE/
    ├── Topic-4-GROUP-BY/            ← you are here
    │   ├── README.md
    │   └── groupby_practice.sql
    └── ...
```

| File        | Path                                                                                                                     |
| ----------- | ------------------------------------------------------------------------------------------------------------------------ |
| This README | `Data-Engineering/Practice-Set/Topic-4-GROUP-BY/README.md`                                                               |
| SQL file    | [`groupby_practice.sql`](./groupby_practice.sql) → `Data-Engineering/Practice-Set/Topic-4-GROUP-BY/groupby_practice.sql` |

## Roadmap

| #   | Topic                        | Folder                                 | Status  |
| --- | ---------------------------- | -------------------------------------- | ------- |
| 1   | WHERE clause                 | `Practice-Set/Topic-1-WHERE/`          | ✅ Done |
| 2   | ORDER BY / LIMIT / DISTINCT  | `Practice-Set/Topic-2-ORDER-BY-LIMIT/` | ✅ Done |
| 3   | Aggregate functions          | `Practice-Set/Topic-3-AGGREGATE/`      | ✅ Done |
| 4   | **GROUP BY**                 | `Practice-Set/Topic-4-GROUP-BY/`       | ✅ Done |
| 5   | HAVING                       | `Practice-Set/Topic-5-HAVING/`         | ⏳ Next |
| 6   | JOINs                        | `Practice-Set/Topic-6-JOINS/`          | —       |
| 7   | Subqueries                   | `Practice-Set/Topic-7-SUBQUERIES/`     | —       |
| 8   | CASE + string/date functions | `Practice-Set/Topic-8-FUNCTIONS/`      | —       |
| 9   | Window functions             | `Practice-Set/Topic-9-WINDOW/`         | —       |

## Concepts Covered

- **`GROUP BY`** splits rows into groups and runs an aggregate on **each group**, returning one row per group
- **Golden rule:** every non-aggregated column in `SELECT` must also appear in `GROUP BY`
- **Grouping by multiple columns:** `GROUP BY department, city` creates one group per combination
- **Grouping by an expression:** `GROUP BY YEAR(join_date)` groups by year instead of the full date
- **`WHERE` + `GROUP BY`:** rows are filtered first, then grouped
- **`ORDER BY` on aggregates / aliases:** `ORDER BY total_salary DESC`
- **Top-N groups:** `GROUP BY` + `ORDER BY` + `LIMIT`
- **`COUNT(column)` per group:** counts non-NULL values in each group

## Dataset

Database: `practice_4`. Table: `employees` (12 rows), same structure as the earlier topics.

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

| Q   | Question                                                      | Concept                              |
| --- | ------------------------------------------------------------- | ------------------------------------ |
| 1   | Count the employees in each department                        | `GROUP BY` + `COUNT`                 |
| 2   | Show the total salary for each department                     | `GROUP BY` + `SUM`                   |
| 3   | Show the average salary per department, rounded to 0 decimals | `GROUP BY` + `ROUND(AVG())`          |
| 4   | Count employees in each city, most employees first            | `GROUP BY` + `ORDER BY ... DESC`     |
| 5   | Show the highest and lowest salary in each department         | `GROUP BY` + `MAX` / `MIN`           |
| 6   | Show the average salary per city, highest first               | `GROUP BY` + `ORDER BY` alias        |
| 7   | Find the department with the highest total salary             | `GROUP BY` + `ORDER BY` + `LIMIT 1`  |
| 8   | Count employees per department, Karachi only                  | `WHERE` + `GROUP BY`                 |
| 9   | Count employees per department and city, sorted by both       | Multi-column `GROUP BY` + `ORDER BY` |
| 10  | For each department, count employees who have an email        | `COUNT(column)` per group            |
| 11  | Count employees who joined in each year, sorted by year       | `GROUP BY YEAR(join_date)`           |
| 12  | Show average age per department, youngest first               | `ROUND(AVG())` + `ORDER BY`          |
| 13  | Count employees earning more than 50,000 in each department   | `WHERE` + `GROUP BY`                 |
| 14  | Show the top 2 cities by total salary                         | `SUM` + `ORDER BY` + `LIMIT 2`       |
| 15  | Count the Gmail users in each city                            | `LIKE` + `GROUP BY`                  |

## Key Takeaways

- Without `GROUP BY`, an aggregate returns one row for the whole table. With `GROUP BY`, it returns one row per group.
- `SELECT department, name, AVG(salary) ... GROUP BY department` is wrong, because one group holds many names.
- Group by the right level: `GROUP BY join_date` makes one group per date, while `GROUP BY YEAR(join_date)` makes one group per year.
- Pick the right aggregate for the question: "total" means `SUM`, not `MAX`.
- In a multi-column sort, list every column the question asks for: `ORDER BY department, city`.
- `COUNT(email)` already skips NULLs. Adding `WHERE email IS NOT NULL` would hide groups that have zero emails instead of showing `0`.
- Aliases can be used in `ORDER BY`. In `GROUP BY`, repeat the full expression for portability across databases.
- Rows from `GROUP BY` have no guaranteed order. Add `ORDER BY` when order matters.
- `WHERE` cannot filter groups (e.g. "departments with average salary above 70,000"). That needs `HAVING`, covered in Topic 5.

## Clause Order

**Writing order:**

```sql
SELECT column, AGG(column)
FROM table
WHERE condition
GROUP BY column
HAVING condition       -- Topic 5
ORDER BY column
LIMIT n;
```

**Execution order:** `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `groupby_practice.sql`. It creates the database and table, inserts the data, then runs all 15 queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Topic-4-GROUP-BY/groupby_practice.sql
```
