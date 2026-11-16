-- Q1 Show each employee’s name with their department name.
SELECT
  e.name,
  d.dept_name
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id;

-- Q2 Show each employee’s name, salary, department name and department location.
SELECT
  e.name,
  e.salary,
  d.dept_name,
  d.location
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id;

-- Q3 Show the employees who work in departments located in Karachi, with their department name.
SELECT
  e.name,
  d.dept_name
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
WHERE
  d.location = 'Karachi';

-- Q4 Show the names of employees in the Finance department, sorted alphabetically.
SELECT
  e.name
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
WHERE
  d.dept_name = 'Finance'
ORDER BY
  e.name;

-- Q5 Show the employees in Lahore-based departments who earn more than 50,000, with salary and department name.
SELECT
  e.name,
  e.salary,
  d.dept_name
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
WHERE
  d.location = 'Lahore'
  AND e.salary > 50000;

-- Q6 Show the top 3 highest-paid employees with their department name.
SELECT
  e.name,
  e.salary,
  d.dept_name
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
ORDER BY
  e.salary DESC
LIMIT
  3;

-- Q7 Show the unique locations where at least one employee works, sorted A–Z.
SELECT DISTINCT
  d.location
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
ORDER BY
  d.location;

-- Q8 Show employees who joined on or after Jan 1, 2021, with their department name and location, sorted by join date.
SELECT
  e.name,
  d.dept_name,
  d.location,
  e.join_date
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
WHERE
  e.join_date >= '2021-01-01'
ORDER BY
  e.join_date;

-- Q9 Count the employees in each department (department name), most first.
SELECT
  d.dept_name,
  COUNT(e.emp_id) AS total_emp
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
GROUP BY
  d.dept_name
ORDER BY
  total_emp DESC;

-- Q10 Show the total salary for each department name, highest first.
SELECT
  d.dept_name,
  SUM(e.salary) AS total_salary
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
GROUP BY
  d.dept_name
ORDER BY
  total_salary DESC;