# MySQL Practice — Revision 1: Topics 1–5 Mixed

A revision set before moving on to JOINs. It uses a new, larger `orders` dataset (30 rows) and mixes everything from Topics 1–5 into 20 questions plus a bonus.

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
    ├── Topic-5-HAVING/
    ├── Revision-1-Topics-1-to-5/    ← you are here
    │   ├── README.md
    │   ├── revision_1.sql
    │   └── revision_dataset.sql
    └── ...
```

| File         | Path                                                                                                                             |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| This README  | `Data-Engineering/Practice-Set/Revision-1-Topics-1-to-5/README.md`                                                               |
| Queries      | [`revision_1.sql`](./revision_1.sql) → `Data-Engineering/Practice-Set/Revision-1-Topics-1-to-5/revision_1.sql`                   |
| Dataset only | [`revision_dataset.sql`](./revision_dataset.sql) → `Data-Engineering/Practice-Set/Revision-1-Topics-1-to-5/revision_dataset.sql` |

## Roadmap

| #   | Topic                        | Folder                                   | Status  |
| --- | ---------------------------- | ---------------------------------------- | ------- |
| 1   | WHERE clause                 | `Practice-Set/Topic-1-WHERE/`            | ✅ Done |
| 2   | ORDER BY / LIMIT / DISTINCT  | `Practice-Set/Topic-2-ORDER-BY-LIMIT/`   | ✅ Done |
| 3   | Aggregate functions          | `Practice-Set/Topic-3-AGGREGATE/`        | ✅ Done |
| 4   | GROUP BY                     | `Practice-Set/Topic-4-GROUP-BY/`         | ✅ Done |
| 5   | HAVING                       | `Practice-Set/Topic-5-HAVING/`           | ✅ Done |
| R1  | **Revision: Topics 1–5**     | `Practice-Set/Revision-1-Topics-1-to-5/` | ✅ Done |
| 6   | JOINs                        | `Practice-Set/Topic-6-JOINS/`            | ⏳ Next |
| 7   | Subqueries                   | `Practice-Set/Topic-7-SUBQUERIES/`       | —       |
| 8   | CASE + string/date functions | `Practice-Set/Topic-8-FUNCTIONS/`        | —       |
| 9   | Window functions             | `Practice-Set/Topic-9-WINDOW/`           | —       |

## Dataset

Database: `revision_1`. Table: `orders` (30 rows), an online store's orders from 2025.

| Column         | Type        | Notes                                                |
| -------------- | ----------- | ---------------------------------------------------- |
| order_id       | INT         | Primary key (101–130)                                |
| customer       | VARCHAR(50) | 11 customers, most with several orders               |
| city           | VARCHAR(30) | Karachi, Lahore, Islamabad, Peshawar, Multan, Quetta |
| category       | VARCHAR(30) | Electronics, Clothing, Groceries, Books              |
| product        | VARCHAR(50) |                                                      |
| quantity       | INT         | Number of units                                      |
| price          | INT         | Price of **one** unit                                |
| order_date     | DATE        | January–August 2025                                  |
| payment_method | VARCHAR(20) | Cash, Card, JazzCash, EasyPaisa                      |
| status         | VARCHAR(20) | Delivered, Pending, Cancelled                        |
| discount       | INT         | NULL means no discount                               |

**Revenue / order value** is not stored. It is calculated as `quantity * price`.

## Concepts Covered

- **Topic 1 (WHERE):** `=`, `>`, `AND`, `OR`, `IN`, `BETWEEN` on dates, `LIKE` with `%`, `IS NOT NULL`
- **Topic 2:** `ORDER BY ... DESC`, `LIMIT`, `DISTINCT`
- **Topic 3:** `COUNT(*)`, `COUNT(column)`, `COUNT(DISTINCT ...)`, `SUM`, `AVG`, `MIN` / `MAX` on dates, `ROUND`
- **Topic 4:** `GROUP BY` on one and two columns, `GROUP BY MONTH(order_date)`
- **Topic 5:** `HAVING` with one and multiple conditions, `WHERE` + `HAVING` together
- **New:** calculated columns (`quantity * price AS total_amount`) and aggregates over expressions (`SUM(quantity * price)`)

## Questions

| Q     | Question                                                          | Concept                                     |
| ----- | ----------------------------------------------------------------- | ------------------------------------------- |
| 1     | Delivered orders from Karachi                                     | `WHERE` + `AND`                             |
| 2     | Electronics orders with unit price above 10,000                   | `WHERE` + `AND` + `>`                       |
| 3     | Orders paid via JazzCash or EasyPaisa                             | `IN`                                        |
| 4     | Books orders from March 1 to May 31, 2025                         | `BETWEEN` on dates                          |
| 5     | Unique customers whose name ends with 'Khan' or starts with 'S'   | `LIKE` + `OR` + `DISTINCT`                  |
| 6     | Top 3 orders by discount, ignoring no-discount orders             | `IS NOT NULL` + `ORDER BY` + `LIMIT`        |
| 7     | Unique list of cities, A–Z                                        | `DISTINCT` + `ORDER BY`                     |
| 8     | Top 5 orders by total amount                                      | Calculated column + `ORDER BY` + `LIMIT`    |
| 9     | Total orders, discounted orders and unique customers in one query | 3 forms of `COUNT`                          |
| 10    | Total revenue and average order value for delivered orders        | `SUM` / `AVG` of `quantity * price`         |
| 11    | First and last Electronics order date                             | `MIN` / `MAX` on dates                      |
| 12    | Orders per status, most first                                     | `GROUP BY` + `ORDER BY`                     |
| 13    | Revenue per category (delivered), highest first                   | `WHERE` + `GROUP BY` + `SUM`                |
| 14    | Orders per city, most first                                       | `GROUP BY` + `COUNT`                        |
| 15    | Average order value per payment method                            | `GROUP BY` + `ROUND(AVG())`                 |
| 16    | Orders and revenue for each month of 2025                         | `GROUP BY MONTH()` + `WHERE YEAR()`         |
| 17    | Categories with delivered revenue above 50,000                    | `WHERE` + `HAVING SUM()`                    |
| 18    | Cities with at least 3 delivered orders, highest revenue first    | `WHERE` + `HAVING COUNT()` + `ORDER BY`     |
| 19    | Customers with more than 2 orders **and** spending above 20,000   | `HAVING` with `AND`                         |
| 20    | Category-product combinations ordered more than once              | Two-column `GROUP BY` + `HAVING`            |
| Bonus | Top 3 customers by delivered spending                             | `WHERE` + `GROUP BY` + `ORDER BY` + `LIMIT` |

## Key Takeaways

- `price` is the price of one unit. A single order's value is `quantity * price`, and revenue is `SUM(quantity * price)`.
- `SUM(quantity) * SUM(price)` is wrong. Multiply per row first, then aggregate.
- Read the wording carefully: "at least 3" means `>= 3`, "more than 2" means `> 2`. A wrong operator can give the right answer on one dataset and the wrong one on another.
- "Delivered only" means a `WHERE` filter. "All orders" means no status filter. This changes totals.
- `COUNT(discount)` skips NULLs, `COUNT(*)` does not, and `COUNT(DISTINCT customer)` counts each customer once.
- A calculated alias can be used in `ORDER BY`, but not in `WHERE`. Write the full expression there.
- In MySQL, `NULL` sorts last with `DESC` but first with `ASC`, so filter NULLs out when the question says to ignore them.
- Don't name an alias the same as a table (e.g. `AS orders`). Use names like `order_count`.

## How to Run

1. Open MySQL Workbench or the MySQL CLI.
2. Run `revision_1.sql`. It creates the database and table, inserts the data, then runs all queries.

From the CLI, run this from the `Data-Engineering` folder:

```bash
mysql -u root -p < Practice-Set/Revision-1-Topics-1-to-5/revision_1.sql
```
