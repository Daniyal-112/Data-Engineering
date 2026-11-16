CREATE DATABASE IF NOT EXISTS practice_6;

USE practice_6;

-- 1) departments  (parent table, create first)
CREATE TABLE
  IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    location VARCHAR(30),
    budget INT
  );

-- 2) employees  (dept_id -> departments)
CREATE TABLE
  IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary INT,
    age INT,
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
  );

-- 3) projects  (dept_id -> departments: which department owns the project)
CREATE TABLE
  IF NOT EXISTS projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    budget INT,
    start_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
  );

-- 4) assignments  (which employee works on which project, and for how many hours)
CREATE TABLE
  IF NOT EXISTS assignments (
    emp_id INT,
    project_id INT,
    hours INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id),
    FOREIGN KEY (project_id) REFERENCES projects (project_id)
  );

INSERT IGNORE INTO departments (dept_id, dept_name, location, budget)
VALUES
  (1, 'IT', 'Karachi', 500000),
  (2, 'HR', 'Lahore', 200000),
  (3, 'Finance', 'Karachi', 350000),
  (4, 'Sales', 'Islamabad', 300000),
  (5, 'Marketing', 'Lahore', 250000),
  (6, 'Legal', 'Karachi', 150000);

-- no employees in this department
INSERT IGNORE INTO employees (emp_id, name, dept_id, salary, age, join_date)
VALUES
  (1, 'Ali Khan', 1, 85000, 28, '2021-03-15'),
  (2, 'Sara Ahmed', 2, 60000, 32, '2019-07-01'),
  (3, 'Usman Tariq', 1, 120000, 35, '2018-01-10'),
  (4, 'Ayesha Malik', 3, 95000, 30, '2020-11-20'),
  (5, 'Bilal Hussain', 4, 45000, 24, '2023-02-05'),
  (6, 'Fatima Noor', 1, 70000, 26, '2022-06-18'),
  (7, 'Hamza Sheikh', 4, 52000, 29, '2021-09-12'),
  (8, 'Zainab Raza', 2, 58000, 27, '2022-01-25'),
  (9, 'Omar Farooq', 3, 110000, 40, '2016-05-30'),
  (10, 'Hina Aslam', 5, 48000, 23, '2024-03-01'),
  (11, 'Kashif Iqbal', NULL, 65000, 33, '2019-12-15'), -- no department
  (12, 'Mariam Javed', 1, 98000, 31, '2020-04-08');

INSERT IGNORE INTO projects (
  project_id,
  project_name,
  dept_id,
  budget,
  start_date
)
VALUES
  (101, 'Website Revamp', 1, 200000, '2025-01-10'),
  (102, 'Payroll System', 3, 150000, '2025-02-15'),
  (103, 'Hiring Drive', 2, 50000, '2025-03-01'),
  (104, 'Mobile App', 1, 300000, '2025-04-20'),
  (105, 'Ad Campaign', 5, 120000, '2025-05-05'),
  (106, 'Sales Dashboard', 4, 80000, '2025-06-12'),
  (107, 'Contract Review', 6, 40000, '2025-07-01');

-- nobody assigned yet
INSERT IGNORE INTO assignments (emp_id, project_id, hours)
VALUES
  (1, 101, 120),
  (3, 101, 80),
  (6, 101, 150),
  (3, 104, 200),
  (12, 104, 160),
  (1, 104, 60),
  (4, 102, 90),
  (9, 102, 110),
  (12, 102, 30),
  (2, 103, 70),
  (8, 103, 100),
  (10, 105, 140),
  (7, 105, 30),
  (11, 105, 60),
  (5, 106, 90),
  (7, 106, 120),
  (12, 106, 50);