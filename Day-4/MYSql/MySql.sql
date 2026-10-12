-- =========================================
-- Day-4: UPDATE & DELETE
-- =========================================

-- Create and select the database
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- Create the class 9 students table
-- (grade is VARCHAR(2) so it can store values like "A+")
CREATE TABLE IF NOT EXISTS class9_students(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    city VARCHAR(20),
    grade VARCHAR(2)
    );

-- Insert 15 students
INSERT INTO  class9_students
(id,name,marks,city,grade)
VALUES
(101, "Hamza", 94, "Karachi", "A"),
(102, "Zain", 60, "Lahore", "D"),
(103, "Ahmed", 91, "Karachi", "A"),
(104, "Usman", 75, "Karachi", "C"),
(105, "Hassan", 87, "Lahore", "B"),
(106, "Saad", 74, "Quetta", "C"),
(107, "Arham", 40, "Quetta", "F"),
(108, "Huzaifa", 70, "Karachi", "C"),
(109, "Ayan", 85, "Lahore", "B"),
(110, "Rehan", 55, "Islamabad", "F"),
(111, "Sameer", 96, "Karachi", "A"),
(112, "Farhan", 68, "Multan", "D"),
(113, "Talha", 82, "Quetta", "B"),
(114, "Shayan", 77, "Lahore", "C"),
(115, "Waleed", 89, "Islamabad", "B");


-- ---------- Revision: WHERE + ORDER BY ----------

-- Students with marks above 70, sorted by grade in descending order
-- (text sorts in reverse alphabetical order: F, D, C, B, A)
SELECT *
FROM class9_students
WHERE (marks) >70
ORDER BY grade DESC;


-- ---------- UPDATE ----------

-- Change every "A" grade to "A+"
UPDATE class9_students
SET grade = "A+"
WHERE grade  = "A";

-- Change the name of the student with id 101
UPDATE class9_students
SET name ="Daniyal"
WHERE id  = 101;

-- Check the table after the updates
SELECT * FROM class9_students;


-- ---------- DELETE ----------

-- Delete the student with id 115
DELETE FROM class9_students
WHERE id  = 115;

-- Check the table after the delete
SELECT * FROM class9_students;