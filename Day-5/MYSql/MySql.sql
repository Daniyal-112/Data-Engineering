-- =========================================
-- Day-5: FOREIGN KEY, CASCADE & ALTER TABLE
-- =========================================


-- #########################################
-- PART 1: FOREIGN KEY & CASCADE (KU_Uni)
-- #########################################

-- Create and select the database
CREATE DATABASE IF NOT EXISTS KU_Uni;
USE KU_Uni;

-- Parent table: course
CREATE TABLE IF NOT EXISTS course(
	id INT PRIMARY KEY,
    c_name VARCHAR(10)
    );

INSERT INTO course
(id,c_name)
VALUES
(101,"Science"),
(102,"English"),
(103,"Hindi")
;

-- Child table: teachers
-- dept_id must match an id in the course table
-- ON UPDATE CASCADE -> if a course id changes, dept_id changes automatically
-- ON DELETE CASCADE -> if a course is deleted, its teachers are deleted too
CREATE TABLE IF NOT EXISTS teachers(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES course(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teachers
(id,name,dept_id)
VALUES 
(2001,"Adam",101),
(2002,"Bob",103),
(2003,"Casey",102),
(2004,"Donald",102)
;
SELECT * FROM teachers;

-- Change course id 101 to 108
-- Because of ON UPDATE CASCADE, Adam's dept_id also becomes 108
UPDATE course
SET id = 108
WHERE id  = 101;
SELECT * FROM course;



-- #########################################
-- PART 2: ALTER TABLE (school)
-- #########################################

-- Create and select the database
CREATE DATABASE IF NOT EXISTS school;
USE school;

CREATE TABLE IF NOT EXISTS students(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(2),
    city VARCHAR(20)
);

INSERT INTO students 
(id, name, marks, grade, city)
VALUES
(101, 'Daniyal', 94, 'A+', 'Karachi'),
(102, 'Taha', 60, 'C', 'Lahore'),
(103, 'Asad', 85, 'A', 'Karachi'),
(104, 'Ali', 72, 'B', 'Islamabad'),
(105, 'Ahmed', 55, 'D', 'Quetta'),
(106, 'Hassan', 90, 'A+', 'Lahore'),
(107, 'Usman', 78, 'B', 'Karachi'),
(108, 'Hamza', 66, 'C', 'Multan');

-- Add new column (every existing row gets age = 19)
ALTER TABLE students
ADD COLUMN age INT NOT NULL DEFAULT 19;

-- Drop column
ALTER TABLE students
DROP COLUMN age;

-- Rename table 
ALTER TABLE students
RENAME TO matric_students;

-- Rename it back to the original name
ALTER TABLE  matric_students
RENAME TO students;

-- Change Column(Rename)
-- CHANGE can rename a column AND change its data type
ALTER TABLE students
CHANGE COLUMN id stu_id INT ;
SELECT * FROM  students;

-- Modify Column
-- MODIFY changes only the data type / size (not the name)
ALTER TABLE students
MODIFY city VARCHAR(10);