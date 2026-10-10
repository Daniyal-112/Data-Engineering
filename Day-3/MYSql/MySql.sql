-- =========================================
-- Day-3: Aggregate Functions & GROUP BY
-- =========================================


-- #########################################
-- DATABASE 1: university (student table)
-- #########################################

-- Create and select the database
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Delete the old table (if it exists) to start fresh
DROP TABLE student;

-- Create the student table
CREATE TABLE IF NOT EXISTS student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    city VARCHAR(30)
);

-- Insert multiple students at once
INSERT INTO student 
(id ,name ,marks,city)
VALUES
(101, "Daniyal",94,"Karachi"),
(102, "Taha",60,"Lahore"),
(103, "Asad",91,"Karachi"),
(104, "Affan",75,"Karachi"),
(105, "Ibrahim",87,"Lahore"),
(106, "Faheem",74,"Quetta"),
(107, "Ali",40,"Quetta"),
(108, "Bilal",70,"Karachi");

-- Insert a single student (same name "Faheem", different id)
INSERT INTO student VALUES (109, "Faheem",82,"Quetta");


-- ---------- Revision: ORDER BY, LIMIT, BETWEEN ----------

-- Top 3 students with the highest marks
SELECT name,marks FROM student
ORDER BY marks DESC
LIMIT 3;

-- Students with marks from 80 to 96 (both included)
SELECT * FROM student WHERE marks BETWEEN 80 AND 96;


-- ---------- Aggregate Functions ----------

-- Total number of students
SELECT COUNT(id) FROM student;

-- Highest marks
SELECT MAX(marks) FROM student;

-- Lowest marks
SELECT MIN(marks) FROM student;

-- Average marks
SELECT AVG(marks) FROM student;

-- Total of all marks
SELECT SUM(marks) FROM student;


-- ---------- DISTINCT ----------

-- List of unique cities
SELECT DISTINCT city FROM student;


-- ---------- GROUP BY ----------

-- Count of students for each name + city combination
-- (shows that "Faheem" from Quetta appears 2 times)
SELECT name,city ,COUNT(id) FROM student GROUP BY name,city;

-- Highest marks and count of students for each name
SELECT name,MAX(marks), COUNT(id) FROM student GROUP BY name;

-- Count of students for each city + name combination
SELECT city,name,COUNT(id) FROM  studenT GROUP BY city,name;

-- Highest marks in each city
SELECT city,MAX(marks)
FROM student
GROUP BY city;


-- ---------- Subquery ----------

-- Topper of each city
-- (inner query finds the max marks per city,
--  outer query finds the student who has those marks in that city)
SELECT name,marks,city
FROM student
WHERE (city,marks) IN(
	SELECT city, MAX(marks)
    FROM student
    GROUP BY city
);


-- ---------- GROUP BY + ORDER BY ----------

-- Average marks of each city, sorted from lowest to highest
SELECT city ,AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks)
;



-- #########################################
-- DATABASE 2: Bank (customers table)
-- #########################################

-- Create and select the database
CREATE DATABASE IF NOT EXISTS Bank;
USE Bank;

-- Create the customers table
CREATE TABLE IF NOT EXISTS customers(
	cus_id INT PRIMARY KEY,
    name VARCHAR(50),
    mode VARCHAR(30),
    city VARCHAR(30)
);

-- Insert customers with their payment mode
INSERT INTO customers
(cus_id,name,mode,city)
VALUES
(101,"Olivia","Netbanking","Portland"),
(102,"Ethan","CreditCard","Portland"),
(103,"Maya","CreditCard","Portland"),
(104,"Liam","Netbanking","Portland"),
(105,"Sophia","CreditCard","Portland"),
(106,"Caleb","DebitCard","Portland"),
(107,"Ava","DebitCard","Portland"),
(108,"Lucas","Netbanking","Portland"),
(109,"Isabella","Netbanking","Portland"),
(110,"Jackson","CreditCard","Portland");

-- Number of customers for each payment mode, sorted from lowest to highest
SELECT mode,COUNT(name)
FROM customers
GROUP BY mode
ORDER BY COUNT(name)
;