# Day 4: MySQL UPDATE & DELETE

## 🐬 MySQL
- Created a `school` database with a `class9_students` table (15 students)
- Revised `WHERE` with `ORDER BY`
- Changed existing data using `UPDATE ... SET ... WHERE`
- Updated many rows at once (all "A" grades changed to "A+")
- Updated a single row using its `PRIMARY KEY` (`id = 101`)
- Removed a row using `DELETE FROM ... WHERE`
- Checked the table after every change using `SELECT`

## 💡 Key Learnings
- Always use `WHERE` with `UPDATE` and `DELETE`, otherwise every row in the table changes
- Using the `PRIMARY KEY` in `WHERE` is the safest way to change exactly one row
- Run a `SELECT` with the same `WHERE` first to see which rows will be affected
- `DELETE` cannot be undone
- Text columns sort alphabetically, so `ORDER BY grade DESC` gives F, D, C, B, A
- MySQL Workbench has a "safe update mode" that blocks `UPDATE` / `DELETE` without a key column (Error 1175)

## 📁 Files
- `MySQL/MYSql.sql`