# Day 5: MySQL FOREIGN KEY, CASCADE & ALTER TABLE

## 🐬 MySQL

### Part 1: FOREIGN KEY & CASCADE (`KU_Uni` database)
- Created a parent table `course` and a child table `teachers`
- Linked the two tables using a `FOREIGN KEY` (`teachers.dept_id` → `course.id`)
- Used `ON UPDATE CASCADE` so changes in `course.id` update `teachers.dept_id` automatically
- Used `ON DELETE CASCADE` so deleting a course also deletes its teachers

### Part 2: ALTER TABLE (`school` database)
- Added a new column using `ADD COLUMN` (with `NOT NULL` and `DEFAULT`)
- Removed a column using `DROP COLUMN`
- Renamed a table using `RENAME TO`
- Renamed a column and its data type using `CHANGE COLUMN`
- Changed a column's data type / size using `MODIFY`

## 💡 Key Learnings
- A `FOREIGN KEY` only allows values that already exist in the parent table
- The parent table must be created and filled before the child table
- `CREATE DATABASE` does not switch to the new database, `USE` is needed
- `CHANGE` renames a column, `MODIFY` only changes its type
- `CHANGE` and `MODIFY` redefine the whole column, so constraints like `NOT NULL` must be written again
- Making a column smaller fails if existing data does not fit

## 📁 Files
- `MySQL/MySql.sql`