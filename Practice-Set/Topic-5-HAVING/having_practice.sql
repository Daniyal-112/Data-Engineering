CREATE DATABASE IF NOT EXISTS practice_5;

USE practice_5;

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

-- Q1 Show the departments that have more than 2 employees.

SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  department
HAVING
  COUNT(emp_id) > 2;

-- Q2 Show the departments whose average salary is above 70,000.

SELECT
  department,
  ROUND(AVG(salary), 0) AS avg_salary
FROM
  employees
GROUP BY
  department
HAVING
  AVG(salary) > 70000
ORDER BY
  department;

-- Q3 Show the cities that have more than 1 employee.

SELECT
  city,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  city
HAVING
  COUNT(emp_id) > 1;

-- Q4 Show the departments whose total salary is greater than 150,000.

SELECT
  department,
  SUM(salary) AS total_salary
FROM
  employees
GROUP BY
  department
HAVING
  SUM(salary) > 150000;

-- Q5 Show the departments whose highest salary is above 100,000.

SELECT
  department,
  MAX(salary) AS highest_salary
FROM
  employees
GROUP BY
  department
HAVING
  MAX(salary) > 100000;

-- Q6 Show the cities whose average salary is below 75,000.

SELECT
  city,
  ROUND(AVG(salary), 0) AS avg_salary
FROM
  employees
GROUP BY
  city
HAVING
  AVG(salary) < 75000;

-- Q7 Show the departments that have exactly 2 employees.

SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  department
HAVING
  COUNT(emp_id) = 2
ORDER BY
  department;

-- Q8 Show the departments where the lowest salary is at least 55,000.

SELECT
  department,
  MIN(salary) AS lowest_salary
FROM
  employees
GROUP BY
  department
HAVING
  MIN(salary) >= 55000
ORDER BY
  lowest_salary;

-- Q9 Considering only employees who live in Karachi, show the departments that have more than 1 employee.

SELECT
  department,
  COUNT(emp_id) AS total_emp
FROM
  employees
WHERE
  city = 'Karachi'
GROUP BY
  department
HAVING
  COUNT(emp_id) > 1;

-- Q10 Considering only employees earning more than 50,000, show the departments that have more than 1 such employee.

SELECT
  department,
  COUNT(emp_id) AS emp
FROM
  employees
WHERE
  salary > 50000
GROUP BY
  department
HAVING
  COUNT(emp_id) > 1;

-- Q11 Show the departments whose average salary is above 55,000, highest average first.

SELECT
  department,
  ROUND(AVG(salary), 0) AS avg_salary
FROM
  employees
GROUP BY
  department
HAVING
  AVG(salary) > 55000
ORDER BY
  avg_salary DESC;

-- Q12 Show the departments where at least 2 employees have an email.

SELECT
  department,
  COUNT(email) AS emails_count
FROM
  employees
GROUP BY
  department
HAVING
  COUNT(email) >= 2;

-- Q13 Show the department and city combinations that have more than 1 employee.

SELECT
  department,
  city,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  department,
  city
HAVING
  COUNT(emp_id) > 1;

-- Q14 Show the years in which more than 1 employee joined.

SELECT
  YEAR (join_date) AS join_year,
  COUNT(emp_id) AS total_emp
FROM
  employees
GROUP BY
  YEAR (join_date)
HAVING
  COUNT(emp_id) > 1
ORDER BY
  YEAR (join_date);

-- Q15 Show the departments whose total salary is above 100,000 and average age is below 30.

SELECT
  department,
  AVG(age) AS avg_age,
  SUM(salary) AS total_salary
FROM
  employees
GROUP BY
  department
HAVING
  SUM(salary) > 100000
  AND AVG(age) < 30;