-- Creating the departments table to store department details
CREATE TABLE dept (
 department_id INT PRIMARY KEY,          -- Department ID (Primary Key)
 department_name VARCHAR(50)             -- Department name
);

-- Creating the employees table to store employee details
CREATE TABLE emp (
 employee_id INT PRIMARY KEY,            -- Employee ID (Primary Key)
 employee_name VARCHAR(50),              -- Employee name
 department_id INT,                      -- Department ID (Foreign Key)
 salary DECIMAL(10, 2),                  -- Employee salary
 job_title VARCHAR(50),                  -- Job title
 manager_id INT,                         -- Manager's Employee ID (Foreign Key to self)
 city VARCHAR(50),                       -- City where the employee is located
 FOREIGN KEY (department_id) REFERENCES dept(department_id)  -- Foreign Key reference to dept table
);

-- Inserting data into the departments table
INSERT INTO dept (department_id, department_name) VALUES
(1, 'Sales'),                            -- Sales department
(2, 'HR'),                               -- HR department
(3, 'IT');                               -- IT department

-- Inserting data into the employees table
INSERT INTO emp (employee_id, employee_name, department_id, salary, job_title, manager_id, city) VALUES
(1, 'Alice', 1, 12000, 'Manager', NULL, 'Baroda'),            -- Alice is a Manager in Sales located in Baroda
(2, 'Bob', 1, 9000, 'Salesman', 1, 'Ahmedabad'),              -- Bob is a Salesman in Sales under Alice in Ahmedabad
(3, 'Charlie', 2, 11000, 'HR Executive', 4, 'Baroda'),        -- Charlie is an HR Executive in HR under David in Baroda
(4, 'David', 2, 8000, 'Clerk', 5, 'Surat'),                   -- David is a Clerk in HR under Eve in Surat
(5, 'Eve', 3, 13000, 'IT Manager', NULL, 'Baroda'),           -- Eve is an IT Manager in IT located in Baroda
(6, 'Frank', 3, 9500, 'Developer', 5, 'Baroda');              -- Frank is a Developer in IT under Eve in Baroda

-- 1. Selecting employee details with their department names, ordered by department name
SELECT e.employee_id, e.employee_name, d.department_name
FROM emp e
JOIN dept d ON e.department_id = d.department_id
ORDER BY d.department_name;                                   -- Ordering by department name

-- 2. Selecting all employees who are located in Baroda
SELECT * FROM emp
WHERE city = 'Baroda';

-- 3. Selecting employee names, salaries, and department IDs where salary is greater than 10000
SELECT employee_name, salary, department_id
FROM emp
WHERE salary > 10000;

-- 4. Selecting employee details excluding Clerks, ordered by salary in descending order
SELECT e.employee_name, e.job_title, e.salary, d.department_name
FROM emp e
JOIN dept d ON e.department_id = d.department_id
WHERE e.job_title != 'Clerk'                                  -- Excluding Clerks
ORDER BY e.salary DESC;                                       -- Ordering by salary in descending order

-- 5. Selecting employee and their manager details, showing employee and manager names and IDs
SELECT e.employee_id AS emp_no, e.employee_name AS emp_name, m.employee_id AS mgr_no, m.employee_name AS mgr_name
FROM emp e
LEFT JOIN emp m ON e.manager_id = m.employee_id;              -- Self-join to get manager details

-- 6. Selecting employees whose salary is less than their manager's salary
SELECT e.employee_name AS emp_name, e.salary, m.employee_name AS mgr_name, m.salary AS mgr_salary
FROM emp e
JOIN emp m ON e.manager_id = m.employee_id                    -- Self-join to compare employee and manager salaries
WHERE e.salary < m.salary;                                    -- Condition to find employees earning less than their managers
