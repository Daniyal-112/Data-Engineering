# Day 2: MySQL Constraints & Filtering Data

## 🐬 MySQL
- Used `CREATE DATABASE IF NOT EXISTS` and `CREATE TABLE IF NOT EXISTS` to avoid errors when re-running scripts
- Added data with `INSERT` and read it with `SELECT`
- Set default values for columns using `DEFAULT`
- Added rules on column values using `CHECK` (e.g. `age >= 18`)
- Used `NOT NULL` to make sure a column always has a value
- Got unique values using `DISTINCT`
- Filtered rows using the `WHERE` clause
- Combined conditions with `AND`, `OR` and `NOT`
- Selected values in a range using `BETWEEN`
- Matched a list of values using `IN` and `NOT IN`
- Sorted results using `ORDER BY` (`ASC` / `DESC`)
- Limited the number of rows using `LIMIT`

## 💡 Key Learnings
- `BETWEEN` includes both the start and end values
- `IN` matches any value in the list
- If no value is given for a column, its `DEFAULT` value is used
- An `INSERT` fails if it breaks a `CHECK` rule or repeats a `PRIMARY KEY`
- Always use `ORDER BY` with `LIMIT`, otherwise the rows returned are not guaranteed
- Use single quotes `'text'` for strings in SQL (standard across all databases)

## 📁 Files
- `MySQL/MySql.sql`