CREATE DATABASE IF NOT EXISTS practice_2;

USE practice_2;

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

-- Q1 List all employees sorted by salary from lowest to highest.
SELECT
  *
FROM
  employees
ORDER BY
  salary;

-- Q2 Show the name and salary of all employees, highest salary first.
SELECT
  name,
  salary
FROM
  employees
ORDER BY
  salary DESC;

-- Q3 List all employee names in alphabetical order (A–Z).
SELECT
  name
FROM
  employees
ORDER BY
  name;

-- Q4 Show the top 3 highest-paid employees.
SELECT
  name,
  salary
FROM
  employees
ORDER BY
  salary DESC
LIMIT
  3;

-- Q5 Find the youngest employee (only 1 row).
SELECT
  *
FROM
  employees
ORDER BY
  age
LIMIT
  1;

-- Q6 Show a unique list of departments, sorted alphabetically.
SELECT DISTINCT
  department
FROM
  employees
ORDER BY
  department;

-- Q7 Show employees who live in Karachi, sorted by salary from highest to lowest.
SELECT
  *
FROM
  employees
WHERE
  city = 'Karachi'
ORDER BY
  salary DESC;

-- Q8 List all employees sorted by department (A–Z), and within each department by salary (highest first).
SELECT
  *
FROM
  employees
ORDER BY
  department,
  salary DESC;

-- Q9 Show the 3 most recently joined employees.
SELECT
  *
FROM
  employees
ORDER BY
  join_date DESC
LIMIT
  3;

-- Q10 Show the name and age of Gmail users, youngest first.
SELECT
  name,
  age
FROM
  employees
WHERE
  email LIKE '%@gmail.com'
ORDER BY
  age;

-- Q11 Find the employee with the second-highest salary.
SELECT
  *
FROM
  employees
ORDER BY
  salary DESC
LIMIT
  1, 1;

-- Q12 Show the employees ranked 4th to 6th by salary (highest first).
SELECT
  *
FROM
  employees
ORDER BY
  salary DESC
LIMIT
  3, 3;

-- Q13 Show all unique department and city combinations.
SELECT DISTINCT
  department,
  city
FROM
  employees;

-- Q14 Show a unique, alphabetically sorted list of departments that have at least one employee earning more than 80,000.
SELECT DISTINCT
  department
FROM
  employees
WHERE
  salary > 80000
ORDER BY
  department;

-- Q15 Among employees who have an email and do not live in Karachi, show the 2 youngest.
SELECT
  *
FROM
  employees
WHERE
  email IS NOT NULL
  AND city != 'Karachi'
ORDER BY
  age
LIMIT
  2;

-- Q16 Show the 2 lowest-paid employees in the IT department.
SELECT
  *
FROM
  employees
WHERE
  department = 'IT'
ORDER BY
  salary
LIMIT
  2;

-- Q17 Show unique cities of employees who joined before 2021, sorted Z–A.
SELECT DISTINCT
  city
FROM
  employees
WHERE
  join_date < '2021-01-01'
ORDER BY
  city DESC;