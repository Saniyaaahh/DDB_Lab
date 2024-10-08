-- Step-1: Create tables
-- Create departments table
CREATE TABLE departments (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc VARCHAR(100)
);


-- Create employees table
CREATE TABLE employees (
    empno INT PRIMARY KEY,
    ename VARCHAR(100),
    job VARCHAR(50),
    sal DECIMAL(10, 2),
    hiredate DATE,
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES departments(deptno)
);


-- Step-2: Insert values into tables
-- Insert values into departments
INSERT INTO departments (deptno, dname, loc)
VALUES
    (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');


-- Insert values into employees
INSERT INTO employees (empno, ename, job, sal, hiredate, deptno)
VALUES
    (7369, 'Smith', 'CLERK', 800.00, '2023-01-15', 20),
    (7499, 'Allen', 'SALESMAN', 1600.00, '2022-12-31', 30),
    (7521, 'Ward', 'SALESMAN', 1250.00, '2023-02-22', 30),
    (7566, 'Jones', 'MANAGER', 2975.00, '2022-04-02', 20),
    (7654, 'Martin', 'SALESMAN', 1250.00, '2022-09-28', 30),
    (7698, 'Blake', 'MANAGER', 2850.00, '2022-05-01', 30),
    (7782, 'Clark', 'MANAGER', 2450.00, '2022-06-09', 10),
    (7788, 'Scott', 'ANALYST', 3000.00, '2022-12-09', 20),
    (7839, 'King', 'PRESIDENT', 5000.00, '2022-11-17', 10),
    (7844, 'Turner', 'SALESMAN', 1500.00, '2023-09-08', 30),
    (7876, 'Adams', 'CLERK', 1100.00, '2023-06-04', 20),
    (7900, 'James', 'CLERK', 950.00, '2023-06-23', 30),
    (7902, 'Ford', 'ANALYST', 3000.00, '2023-12-05', 20),
    (7934, 'Miller', 'CLERK', 1300.00, '2023-01-11', 10);


-- Step-3: Exercises
-- 1. Find the employees who earn the maximum salary for their department. Display the result in ascending order of salary.
SELECT *
FROM employees e
WHERE (deptno, sal) IN (
    SELECT deptno, MAX(sal)
    FROM employees
    GROUP BY deptno
)
ORDER BY sal ASC;


-- 2. Find the most recently hired employees in each department. Order by hire date.
SELECT empno, ename, job, hiredate, deptno
FROM employees e
WHERE (deptno, hiredate) IN (
    SELECT deptno, MAX(hiredate)
    FROM employees
    GROUP BY deptno
)
ORDER BY hiredate DESC;


-- 3. Find the employees who earn the highest salary in each job type. Sort in descending salary order.
SELECT empno, ename, job, sal
FROM employees e
WHERE (job, sal) IN (
    SELECT job, MAX(sal)
    FROM employees
    GROUP BY job
)
ORDER BY sal DESC;


-- 4. Show the following details for any employee who earns a salary less than the average for their department: ENAME, SALARY, DNAME, JOB.
SELECT e.ename, e.sal, d.dname, e.job
FROM employees e
JOIN departments d ON e.deptno = d.deptno
WHERE e.sal < (
    SELECT AVG(sal)
    FROM employees
    WHERE deptno = e.deptno
)
ORDER BY d.dname, e.sal;


-- 5. Who are the top three earners in the company? Display their name and salary.
SELECT ename, sal
FROM employees
ORDER BY sal DESC
LIMIT 3;


-- 6. Display the empno, name, job, and deptno for employees whose salary is greater than the highest salary in any SALES department.
SELECT empno, ename, job, deptno
FROM employees
WHERE sal > (
    SELECT MAX(sal)
    FROM employees
    WHERE deptno = (
        SELECT deptno
        FROM departments
        WHERE dname = 'SALES'
    )
);