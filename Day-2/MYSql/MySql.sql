-- =========================================
-- Day-2: Constraints & Filtering Data
-- =========================================

-- ---------- CHECK constraint ----------
CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE IF NOT EXISTS employee (
    id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT CHECK (age >= 18)
);

INSERT INTO employee (id, city, age)
VALUES
(101, 'Karachi', 20),
(102, 'Karachi', 25),
(103, 'Karachi', 30),
(104, 'Karachi', 19),
(105, 'Karachi', 34),

(106,'karachi',17);
-- This will FAIL on purpose because age 17 breaks CHECK (age >= 18)
-- INSERT INTO employee VALUES (106, 'Lahore', 17);

SELECT * FROM employee;


-- ---------- DEFAULT constraint ----------
CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS student (
    rollno INT PRIMARY KEY,
    name VARCHAR(40),
    marks INT NOT NULL,
    grade CHAR(1),
    city VARCHAR(20) DEFAULT 'Karachi'
);

INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, 'Daniyal', 93, 'A', 'Karachi'),
(102, 'Asad', 78, 'C', 'Karachi'),
(103, 'Affan', 85, 'B', 'Karachi'),
(104, 'Taha', 96, 'A', 'Karachi'),
(105, 'Ishtiaq', 82, 'B', 'Karachi'),
(106, 'Ali', 12, 'F', 'Karachi'),
(107, 'Ahmed', 20, 'F', 'Karachi'),
(108, 'Bilal', 77, 'C', 'Lahore'),
(109, 'Ibrahim', 77, 'C', 'Quetta');


INSERT INTO student (rollno, name, marks, grade)
VALUES (110, 'Hamza', 65, 'D');
-- City is not given, so DEFAULT value 'Karachi' is used-

SELECT * FROM student;

-- ---------- DISTINCT ----------
-- Gives only unique values
SELECT DISTINCT grade FROM student;


-- ---------- WHERE with AND / OR / NOT ----------
-- Students from Karachi with marks above 80
SELECT * FROM student WHERE city = 'Karachi' AND marks > 80;

-- Students with grade A or grade B
SELECT * FROM student WHERE grade = 'A' OR grade = 'B';

-- Students who did not fail
SELECT * FROM student WHERE NOT grade = 'F';


-- ---------- BETWEEN ----------
-- Marks from 70 to 90 (both included)
SELECT * FROM student WHERE marks BETWEEN 70 AND 90;


-- ---------- IN / NOT IN ----------
SELECT * FROM student WHERE city IN ('Lahore', 'Quetta');
SELECT * FROM student WHERE city NOT IN ('Lahore', 'Quetta');


-- ---------- ORDER BY and LIMIT ----------
-- Top 2 students with marks above 80
SELECT * FROM student
WHERE marks > 80
ORDER BY marks DESC
LIMIT 2;

-- Top 4 students from Karachi
SELECT * FROM student
WHERE city = 'Karachi'
ORDER BY marks DESC
LIMIT 4;