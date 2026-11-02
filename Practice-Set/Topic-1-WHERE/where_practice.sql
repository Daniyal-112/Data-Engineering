CREATE DATABASE IF NOT EXISTS practice_1;

USE practice_1;

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

INSERT INTO
  employees (
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

-- Q1 Retrieve all details of employees who live in Karachi.
SELECT
  *
FROM
  employees
WHERE
  city = 'karachi';

-- Q2  Show the name and salary of employees earning more than 80,000.
SELECT
  name,
  salary
FROM
  employees
WHERE
  salary >= 80000;

-- Q3 Show the names of IT employees who live in Karachi.
SELECT
  name
FROM
  employees
WHERE
  departmenT = 'It'
  AND city = 'Karachi';

-- Q4 Show the name and department of employees in either HR or Finance.
SELECT
  name,
  department
FROM
  employees
WHERE
  department = "HR"
  OR department = "Finance";

-- Q5 Using IN, show the names of employees in Sales or Marketing.
SELECT
  name
FROM
  employees
WHERE
  department IN ("Sales", "Marketing");

-- Q6 Show the name and salary of employees earning between 50,000 and 70,000 (inclusive).
SELECT
  name,
  salary
FROM
  employees
WHERE
  salary BETWEEN 50000 AND 70000;

-- Q7 Find employees whose name starts with ‘A’.
SELECT
  name
FROM
  employees
WHERE
  name LIKE "A%";

-- Q8 Show the names of employees who have no email.
SELECT
  name
FROM
  employees
WHERE
  email IS NULL;

-- Q9 Show the name and email of employees who use Gmail
SELECT
  name,
  email
FROM
  employees
WHERE
  email LIKE "%gmail.com";

-- Q10 Find all employees who do not live in Karachi.
SELECT
  *
FROM
  employees
WHERE
  city != "Karachi";

SELECT
  *
FROM
  employees
WHERE
  city NOT IN ("Karachi");

-- Q11 Find employees who joined on or after January 1, 2022.
SELECT
  *
FROM
  employees
WHERE
  join_date >= "2022-01-01";

-- Q12 Find employees younger than 30 who also earn more than 50,000.
SELECT
  name
FROM
  employees
WHERE
  age < 30
  AND salary >= 50000;

-- Q13 Find employees whose name has ‘a’ as the second letter.
SELECT
  name
FROM
  employees
WHERE
  name LIKE ("_a%");

-- Q14 Find employees in IT or Finance who earn more than 90,000.
SELECT
  name
FROM
  employees
WHERE
  department IN ("IT", "Finance")
  AND salary >= 90000;

SELECT
  name,
  department,
  salary
FROM
  employees
WHERE
  (
    department = "IT"
    OR department = "Finance"
  )
  AND salary >= 90000;

-- Q15 Find employees who have an email, live in Lahore or Islamabad, and are aged between 25 and 35.
SELECT
  name
FROM
  employees
WHERE
  (email IS NOT NULL)
  AND city IN ("Lahore", "Islamabad")
  AND (age BETWEEN 25 AND 35);