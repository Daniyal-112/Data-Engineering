# Day 3: MySQL Aggregate Functions & GROUP BY

## 🐬 MySQL

### Database 1: `university` (student table)
- Revised `ORDER BY`, `LIMIT` and `BETWEEN`
- Used aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Got unique cities using `DISTINCT`
- Grouped rows using `GROUP BY` on one and multiple columns
- Found the highest marks in each city
- Found the topper of each city using a subquery
- Sorted the average marks of each city using `GROUP BY` + `ORDER BY`

### Database 2: `Bank` (customers table)
- Counted the number of customers for each payment mode using `GROUP BY`
- Sorted the result using `ORDER BY` on `COUNT()`

## 💡 Key Learnings
- Aggregate functions return one value from many rows
- `GROUP BY` puts rows with the same value into one group
- `GROUP BY` works best on columns with repeated values (e.g. `city`, `mode`)
- Every column in `SELECT` must be in `GROUP BY` or inside an aggregate function
- We can use `ORDER BY` on an aggregate value like `AVG(marks)` or `COUNT(name)`
- To match per-group values in a subquery, compare both columns: `WHERE (city, marks) IN (...)`

## 📁 Files
- `MySQL/MySql.sql`