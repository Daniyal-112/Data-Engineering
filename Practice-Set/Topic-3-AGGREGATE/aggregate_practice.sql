CREATE DATABASE IF NOT EXISTS practice_3;

USE practice_3;

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

-- Q1 Find the total number of employees.
SELECT
  COUNT(emp_id)
FROM
  employees;

-- Here emp_id is PK. It should not be NULL.  
SELECT
  COUNT(*)
FROM
  employees;

-- Q2 In one query, show how many employees have an email and how many do not.
SELECT
  COUNT(email) AS with_email,
  COUNT(*) - COUNT(email) AS without_email
FROM
  employees;

-- Q3 Find the total salary paid to all employees.
SELECT
  SUM(salary) AS total_salary
FROM
  employees;

-- Q4 Find the average salary of all employees. Name the column avg_salary.
SELECT
  AVG(salary) AS avg_salary
FROM
  employees;

--  Q5 Show the highest and lowest salary in one query.
SELECT
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary
FROM
  employees;

-- Q6 Count how many employees live in Karachi.
SELECT
  COUNT(emp_id) AS karachi_employees
FROM
  employees
WHERE
  city = 'Karachi';

-- Q7 Find the average salary of the IT department.
SELECT
  AVG(salary) AS it_avg_salary
FROM
  employees
WHERE
  department = 'IT';

-- Q8 Find the total salary of the Finance department.
SELECT
  SUM(salary) AS finance_total_salary
FROM
  employees
WHERE
  department = 'Finance';

-- Q9 Count how many unique departments there are.
SELECT
  COUNT(DISTINCT department) AS total_departments
FROM
  employees;

-- Q10 Find the average age of all employees, rounded to 1 decimal place.
SELECT
  ROUND(AVG(age), 1) AS avg_age
FROM
  employees;

-- Q11 Show the earliest and the latest join date.
SELECT
  MIN(join_date) AS earliest_join,
  MAX(join_date) AS latest_join
FROM
  employees;

-- Q12 Count employees earning between 50,000 and 90,000 (inclusive).
SELECT
  COUNT(emp_id) AS mid_salary_count
FROM
  employees
WHERE
  salary BETWEEN 50000 AND 90000;

-- Q13 For Gmail users, show how many there are and their average age.
SELECT
  COUNT(emp_id) AS gmail_users,
  AVG(age) AS avg_age
FROM
  employees
WHERE
  email LIKE '%@gmail.com';

-- Q14 Find the difference between the highest and lowest salary in the IT department. Name it salary_gap.
SELECT
  MAX(salary) - MIN(salary) AS salary_gap
FROM
  employees
WHERE
  department = 'IT';

-- Q15 For employees who joined on or after January 1, 2022, show their count and their total salary.
SELECT
  COUNT(emp_id) AS new_joiners,
  SUM(salary) AS new_joiners_salary
FROM
  employees
WHERE
  join_date >= '2022-01-01';