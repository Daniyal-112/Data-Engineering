CREATE DATABASE IF NOT EXISTS practice_4;

USE practice_4;

CREATE TABLE
  IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    city VARCHAR(30),
    salary INT,
    age INT,
    join_date DATE,
    email VARCHAR(50)
  );

INSERT IGNORE INTO employees (
  emp_id,
  name,
  department,
  city,
  salary,
  age,
  join_date,
  email
)
VALUES
  (
    1,
    'Ali Khan',
    'IT',
    'Karachi',
    85000,
    28,
    '2021-03-15',
    'ali@gmail.com'
  ),
  (
    2,
    'Sara Ahmed',
    'HR',
    'Lahore',
    60000,
    32,
    '2019-07-01',
    'sara@yahoo.com'
  ),
  (
    3,
    'Usman Tariq',
    'IT',
    'Islamabad',
    120000,
    35,
    '2018-01-10',
    NULL
  ),
  (
    4,
    'Ayesha Malik',
    'Finance',
    'Karachi',
    95000,
    30,
    '2020-11-20',
    'ayesha@gmail.com'
  ),
  (
    5,
    'Bilal Hussain',
    'Sales',
    'Lahore',
    45000,
    24,
    '2023-02-05',
    NULL
  ),
  (
    6,
    'Fatima Noor',
    'IT',
    'Karachi',
    70000,
    26,
    '2022-06-18',
    'fatima@outlook.com'
  ),
  (
    7,
    'Hamza Sheikh',
    'Sales',
    'Karachi',
    52000,
    29,
    '2021-09-12',
    'hamza@gmail.com'
  ),
  (
    8,
    'Zainab Raza',
    'HR',
    'Islamabad',
    58000,
    27,
    '2022-01-25',
    'zainab@yahoo.com'
  ),
  (
    9,
    'Omar Farooq',
    'Finance',
    'Lahore',
    110000,
    40,
    '2016-05-30',
    'omar@gmail.com'
  ),
  (
    10,
    'Hina Aslam',
    'Marketing',
    'Karachi',
    48000,
    23,
    '2024-03-01',
    NULL
  ),
  (
    11,
    'Kashif Iqbal',
    'Marketing',
    'Peshawar',
    65000,
    33,
    '2019-12-15',
    'kashif@outlook.com'
  ),
  (
    12,
    'Mariam Javed',
    'IT',
    'Lahore',
    98000,
    31,
    '2020-04-08',
    'mariam@gmail.com'
  );

-- Q1 Count the number of employees in each department.
SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  department;

-- Q2 Show the total salary for each department.
SELECT
  department,
  SUM(salary) AS total_salary
FROM
  employees
GROUP BY
  department;

-- Q3 Show the average salary for each department, rounded to 0 decimal places.
SELECT
  department,
  ROUND(AVG(salary), 0) AS avg_salary
FROM
  employees
GROUP BY
  department;

-- Q4 Count the employees in each city, with the city that has the most employees first.
SELECT
  city,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  city
ORDER BY
  COUNT(emp_id) DESC;

-- Q5 Show the highest and lowest salary in each department.
SELECT
  department,
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary
FROM
  employees
GROUP BY
  department;

-- Q6 Show the average salary in each city, highest average first.
SELECT
  city,
  ROUND(AVG(salary), 0) AS avg_salary
FROM
  employees
GROUP BY
  city
ORDER BY
  avg_salary DESC;

-- Q7 Find the department with the highest total salary (only 1 row).
SELECT
  department,
  SUM(salary) AS total_salary
FROM
  employees
GROUP BY
  department
ORDER BY
  total_salary DESC
LIMIT
  1;

-- Q8 Count the employees in each department, but only for employees who live in Karachi.
SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
WHERE
  city = 'Karachi'
GROUP BY
  department;

-- Q9 Count the employees for each department and city combination, sorted by department and then city.
SELECT
  department,
  city,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  department,
  city
ORDER BY
  department,
  city;

-- Q10 For each department, count how many employees have an email.
SELECT
  department,
  COUNT(email) AS have_email
FROM
  employees
GROUP BY
  department;

-- Q11 Count how many employees joined in each year, sorted by year.
SELECT
  YEAR (join_date) AS join_year,
  COUNT(emp_id) AS total_joined
FROM
  employees
GROUP BY
  YEAR (join_date)
ORDER BY
  join_year;

-- Q12 Show the average age for each department, rounded to 1 decimal, with the youngest department first.
SELECT
  department,
  ROUND(AVG(age), 1) AS avg_age
FROM
  employees
GROUP BY
  department
ORDER BY
  avg_age;

-- Q13 For employees earning more than 50,000, count how many are in each department.
SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
WHERE
  salary > 50000
GROUP BY
  department;

-- Q14 Show the top 2 cities by total salary.
SELECT
  city,
  SUM(salary) AS total_salary
FROM
  employees
GROUP BY
  city
ORDER BY
  total_salary DESC
LIMIT
  2;

-- Q15 Count the Gmail users in each city.
SELECT
  city,
  COUNT(emp_id) AS emp
FROM
  employees
WHERE
  email LIKE '%@gmail.com'
GROUP BY
  city;