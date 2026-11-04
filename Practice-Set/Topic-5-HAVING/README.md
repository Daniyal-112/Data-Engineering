# MySQL Practice — Topic 5: HAVING

Part of my topic-by-topic MySQL practice series. Each topic has practice questions on a sample `employees` table, and later topics mix in concepts from earlier ones. This topic builds on `GROUP BY` (Topic 4) and aggregates (Topic 3), and combines `HAVING` with `WHERE` (Topic 1) and `ORDER BY` (Topic 2).

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
    ├── Topic-4-GROUP-BY/
    ├── Topic-5-HAVING/              ← you are here
    │   ├── README.md
    │   └── having_practice.sql
    └── ...
```

| File        | Path                                                                                                                |
| ----------- | ------------------------------------------------------------------------------------------------------------------- |
| This README | `Data-Engineering/Practice-Set/Topic-5-HAVING/README.md`                                                            |
| SQL file    | [`having_practice.sql`](./having_practice.sql) → `Data-Engineering/Practice-Set/Topic-5-HAVING/having_practice.sql` |

## Roadmap

| #   | Topic                        | Folder                                 | Status  |
| --- | ---------------------------- | -------------------------------------- | ------- |
| 1   | WHERE clause                 | `Practice-Set/Topic-1-WHERE/`          | ✅ Done |
| 2   | ORDER BY / LIMIT / DISTINCT  | `Practice-Set/Topic-2-ORDER-BY-LIMIT/` | ✅ Done |
| 3   | Aggregate functions          | `Practice-Set/Topic-3-AGGREGATE/`      | ✅ Done |
| 4   | GROUP BY                     | `Practice-Set/Topic-4-GROUP-BY/`       | ✅ Done |
| 5   | **HAVING**                   | `Practice-Set/Topic-5-HAVING/`         | ✅ Done |
| 6   | JOINs                        | `Practice-Set/Topic-6-JOINS/`          | ⏳ Next |
| 7   | Subqueries                   | `Practice-Set/Topic-7-SUBQUERIES/`     | —       |
| 8   | CASE + string/date functions | `Practice-Set/Topic-8-FUNCTIONS/`      | —       |
| 9   | Window functions             | `Practice-Set/Topic-9-WINDOW/`         | —       |

## Concepts Covered

- **`HAVING`** filters **groups** after `GROUP BY`, so it can use aggregates (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`)
- **WHERE vs HAVING:**

  |                    | WHERE                    | HAVING                |
  | ------------------ | ------------------------ | --------------------- |
  | Filters            | rows                     | groups                |
  | Runs               | before `GROUP BY`        | after `GROUP BY`      |
  | Aggregates allowed | ❌                       | ✅                    |
  | Example            | `WHERE city = 'Karachi'` | `HAVING COUNT(*) > 2` |

- **`WHERE` + `GROUP BY` + `HAVING` together:** filter rows, group them, then filter groups
- **Multiple conditions in HAVING** with `AND` / `OR`
- **HAVING on an aggregate not in SELECT** (e.g. `HAVING MAX(salary) > 100000`)
- **HAVING on multi-column groups** and on expressions like `YEAR(join_date)`
- **`ORDER BY` after HAVING**

## Dataset

Database: `practice_5`. Table: `employees` (12 rows), same structure as the earlier topics.

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

| Q   | Question                                                                 | Concept                            |
| --- | ------------------------------------------------------------------------ | ---------------------------------- |
| 1   | Departments with more than 2 employees                                   | `HAVING COUNT(*)`                  |
| 2   | Departments with average salary above 70,000                             | `HAVING AVG()`                     |
| 3   | Cities with more than 1 employee                                         | `HAVING COUNT(*)`                  |
| 4   | Departments with total salary greater than 150,000                       | `HAVING SUM()`                     |
| 5   | Departments whose highest salary is above 100,000                        | `HAVING MAX()`                     |
| 6   | Cities with average salary below 75,000                                  | `HAVING AVG() <`                   |
| 7   | Departments with exactly 2 employees                                     | `HAVING COUNT(*) =`                |
| 8   | Departments where the lowest salary is at least 55,000                   | `HAVING MIN() >=`                  |
| 9   | Karachi only: departments with more than 1 employee                      | `WHERE` + `GROUP BY` + `HAVING`    |
| 10  | Salary > 50,000 only: departments with more than 1 such employee         | `WHERE` + `GROUP BY` + `HAVING`    |
| 11  | Departments with average salary above 55,000, highest first              | `HAVING` + `ORDER BY`              |
| 12  | Departments where at least 2 employees have an email                     | `HAVING COUNT(email)`              |
| 13  | Department-city combinations with more than 1 employee                   | Multi-column `GROUP BY` + `HAVING` |
| 14  | Years in which more than 1 employee joined                               | `GROUP BY YEAR()` + `HAVING`       |
| 15  | Departments with total salary above 100,000 **and** average age below 30 | `HAVING` with `AND`                |

## Key Takeaways

- `WHERE AVG(salary) > 70000` fails because `WHERE` runs before groups exist. Use `HAVING AVG(salary) > 70000`.
- Rule of thumb: conditions on aggregates go in `HAVING`, everything else goes in `WHERE`.
- Filtering rows in `WHERE` first is faster than grouping everything and filtering in `HAVING`.
- `WHERE` changes what goes into each group, while `HAVING` decides which groups survive. Q9 and Q10 show both working together.
- `HAVING avg_salary > 70000` (alias) works in MySQL but not in every database. Repeating the aggregate is the portable form.
- Don't name an alias after an existing column (e.g. `YEAR(join_date) AS join_date`). Use a clear name like `join_year`.
- "At least" means `>=`, "more than" means `>`, "exactly" means `=`.

## Clause Order

**Writing order:**

```sql
SELECT column, AGG(column)
FROM table
WHERE row_condition
GROUP BY column
HAVING group_condition
ORDER BY column
LIMIT n;
```

**Execution order:** `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `SELECT` → `DISTINCT` → `ORDER BY` → `LIMIT`

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `having_practice.sql`. It creates the database and table, inserts the data, then runs all 15 queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Topic-5-HAVING/having_practice.sql
```
