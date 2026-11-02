# MySQL Practice — Topic 2: ORDER BY, LIMIT, DISTINCT

Part of my topic-by-topic MySQL practice series. Each topic has practice questions on a sample `employees` table, and later topics mix in concepts from earlier ones. This topic also uses the `WHERE` filtering from Topic 1.

## File Location

```
Data-Engineering/
├── Day-1/
├── Day-2/
├── ...
└── Practice-Set/
    ├── Topic-1-WHERE/
    ├── Topic-2-ORDER-BY-LIMIT/      ← you are here
    │   ├── README.md
    │   └── orderby_practice.sql
    └── ...
```

| File        | Path                                                                                                                           |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------ |
| This README | `Data-Engineering/Practice-Set/Topic-2-ORDER-BY-LIMIT/README.md`                                                               |
| SQL file    | [`orderby_practice.sql`](./orderby_practice.sql) → `Data-Engineering/Practice-Set/Topic-2-ORDER-BY-LIMIT/orderby_practice.sql` |

## Roadmap

| #   | Topic                           | Folder                                 | Status  |
| --- | ------------------------------- | -------------------------------------- | ------- |
| 1   | WHERE clause                    | `Practice-Set/Topic-1-WHERE/`          | ✅ Done |
| 2   | **ORDER BY / LIMIT / DISTINCT** | `Practice-Set/Topic-2-ORDER-BY-LIMIT/` | ✅ Done |
| 3   | Aggregate functions             | `Practice-Set/Topic-3-AGGREGATE/`      | ⏳ Next |
| 4   | GROUP BY                        | `Practice-Set/Topic-4-GROUP-BY/`       | —       |
| 5   | HAVING                          | `Practice-Set/Topic-5-HAVING/`         | —       |
| 6   | JOINs                           | `Practice-Set/Topic-6-JOINS/`          | —       |
| 7   | Subqueries                      | `Practice-Set/Topic-7-SUBQUERIES/`     | —       |
| 8   | CASE + string/date functions    | `Practice-Set/Topic-8-FUNCTIONS/`      | —       |
| 9   | Window functions                | `Practice-Set/Topic-9-WINDOW/`         | —       |

## Concepts Covered

- **`ORDER BY`**: sorting results
  - `ASC` (default): low → high, A → Z, old → new
  - `DESC`: high → low, Z → A, new → old
  - **Multi-column sort:** `ORDER BY department, salary DESC` sorts by department first, then by salary within each department
- **`LIMIT`**: returning only the first N rows (top-N queries)
- **`OFFSET`**: skipping rows (`LIMIT 1 OFFSET 1` or the short form `LIMIT 1,1`)
- **`DISTINCT`**: removing duplicates
  - On one column: unique values
  - On multiple columns: unique **combinations**
- **Clause order:** `SELECT DISTINCT` → `FROM` → `WHERE` → `ORDER BY` → `LIMIT`
- **Mixed with Topic 1:** `WHERE`, `LIKE`, `IS NOT NULL`, `!=`, date comparison

## Dataset

Database: `practice_2`. Table: `employees` (12 rows), same structure as Topic 1.

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

`INSERT IGNORE` is used so the script can be re-run without duplicate primary key errors.

## Questions

| Q   | Question                                                                 | Concept                                     |
| --- | ------------------------------------------------------------------------ | ------------------------------------------- |
| 1   | List all employees sorted by salary from lowest to highest               | `ORDER BY` (ASC)                            |
| 2   | Show name and salary, highest salary first                               | `ORDER BY ... DESC`                         |
| 3   | List all employee names in alphabetical order                            | `ORDER BY` on text                          |
| 4   | Show the top 3 highest-paid employees                                    | `ORDER BY` + `LIMIT`                        |
| 5   | Find the youngest employee                                               | `ORDER BY` + `LIMIT 1`                      |
| 6   | Show a unique list of departments, sorted alphabetically                 | `DISTINCT` + `ORDER BY`                     |
| 7   | Show Karachi employees sorted by salary, highest first                   | `WHERE` + `ORDER BY`                        |
| 8   | Sort by department (A–Z), then by salary (highest first)                 | Multi-column `ORDER BY`                     |
| 9   | Show the 3 most recently joined employees                                | Date `DESC` + `LIMIT`                       |
| 10  | Show name and age of Gmail users, youngest first                         | `LIKE` + `ORDER BY`                         |
| 11  | Find the employee with the second-highest salary                         | `LIMIT 1,1` (OFFSET)                        |
| 12  | Show employees ranked 4th to 6th by salary                               | `LIMIT 3,3` (OFFSET)                        |
| 13  | Show all unique department and city combinations                         | `DISTINCT` on 2 columns                     |
| 14  | Unique sorted departments with someone earning more than 80,000          | `WHERE` + `DISTINCT` + `ORDER BY`           |
| 15  | Among employees with an email and not in Karachi, show the 2 youngest    | `IS NOT NULL` + `!=` + `ORDER BY` + `LIMIT` |
| 16  | **Bonus:** Show the 2 lowest-paid employees in IT                        | `WHERE` + `ORDER BY` + `LIMIT`              |
| 17  | **Bonus:** Unique cities of employees who joined before 2021, sorted Z–A | Date `<` + `DISTINCT` + `DESC`              |

## Key Takeaways

- `ASC` is the default, so it can be skipped. `DESC` must be written.
- In a multi-column sort, `DESC` applies only to the column it follows: `ORDER BY department, salary DESC` sorts department A–Z and salary high → low.
- Always use `ORDER BY` before `LIMIT` for top-N queries. Without it, the rows returned are not guaranteed.
- `LIMIT offset, count` puts the skip count first: `LIMIT 3,3` skips 3 rows and returns the next 3.
- `DISTINCT` on several columns removes duplicate **combinations**, not duplicate values in each column.
- `LIMIT` + `OFFSET` for "Nth highest" breaks when values tie. Subqueries and window functions handle that (Topics 7 and 9).
- "Before 2021" means `< '2021-01-01'`, not `<=`.
- In MySQL, `NULL` sorts first in `ASC` and last in `DESC`.

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `orderby_practice.sql`. It creates the database and table, inserts the data, then runs all 17 queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Topic-2-ORDER-BY-LIMIT/orderby_practice.sql
```
