-- 1. Create 'emp' table
CREATE TABLE emp (
    EMPNO INT PRIMARY KEY,          -- Employee Number (Primary Key)
    ENAME VARCHAR(50),              -- Employee Name
    JOB VARCHAR(50),                -- Job Title
    HIREDATE DATE,                  -- Hire Date
    SAL DECIMAL(10, 2),             -- Salary
    COMM DECIMAL(10, 2),            -- Commission
    DEPTNO INT,                     -- Department Number
    MGR INT                         -- Manager's Employee Number
);

-- Insert data into 'emp' table
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES
(7369, 'KHAN', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALI', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'VERMA', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'PATEL', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7698, 'SHARMA', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'SINGH', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);

-- Select all data from 'emp' table
SELECT * FROM emp;

-- 2. Create 'dept' table
CREATE TABLE dept(
    DEPTNO INT PRIMARY KEY,         -- Department Number (Primary Key)
    DNAME VARCHAR(50),              -- Department Name
    LOCATION VARCHAR(50)            -- Location of the Department
);

-- Insert data into 'dept' table
INSERT INTO dept (deptno, dname, location)
VALUES
(10, 'ACCOUNTING', 'MUMBAI'),
(20, 'RESEARCH', 'BANGALORE'),
(30, 'SALES', 'DELHI'),
(40, 'OPERATIONS', 'CHENNAI');

-- Select all data from 'dept' table
SELECT * FROM dept;

-- 3. Create 'stud_master' table
CREATE TABLE stud_master (
    REG_NO INT PRIMARY KEY,         -- Registration Number (Primary Key)
    S_NAME VARCHAR(100),            -- Student Name
    BRANCH VARCHAR(50)              -- Branch of Study
);

-- Insert data into 'stud_master' table
INSERT INTO stud_master (REG_NO, S_NAME, BRANCH)
VALUES
(1, 'Aamir Khan', 'Computer Engineering'),
(2, 'Ayesha Begum', 'Electrical Engineering'),
(3, 'Rahul Verma', 'Mechanical Engineering'),
(4, 'Sara Ali', 'Computer Engineering');

-- Select all data from 'stud_master' table
SELECT * FROM stud_master;

-- 4. Create 'stud_detail' table
CREATE TABLE stud_detail (
    REG_NO INT NOT NULL,            -- Registration Number (Foreign Key)
    COURSE_CODE VARCHAR(20),        -- Course Code
    COURSE_NAME VARCHAR(100),       -- Course Name
    MARKS INT,                      -- Marks Obtained
    SEM VARCHAR(10),                -- Semester
    PRIMARY KEY (REG_NO, COURSE_CODE) -- Composite Primary Key
);

-- Insert data into 'stud_detail' table
INSERT INTO stud_detail (REG_NO, COURSE_CODE, COURSE_NAME, MARKS, SEM)
VALUES
(1, 'CS101', 'Data Structures', 85, 'Sem1'),
(2, 'EE101', 'Circuit Analysis', 90, 'Sem1'),
(3, 'ME101', 'Thermodynamics', 78, 'Sem1'),
(4, 'CS102', 'Algorithms', 88, 'Sem1');

-- Select all data from 'stud_detail' table
SELECT * FROM stud_detail;

-- 5. Select all data from 'emp' table again
SELECT * FROM emp;

-- 6. Select employees with salary between 1000 and 2000
SELECT * FROM emp
WHERE SAL BETWEEN 1000 AND 2000;

-- 7. Select employee names and job titles where job is 'CLERK' and department is 20
SELECT ename, job FROM emp
WHERE job = 'CLERK' AND deptno = 20;

-- 8. Select distinct job titles from 'emp' table
SELECT DISTINCT job FROM emp;

-- 9. Select department number and name from 'dept' table, ordered by department name
SELECT deptno, dname FROM dept
ORDER BY dname;

-- 10. Select all data from 'stud_master' table again
SELECT * FROM stud_master;

-- 11. Join 'stud_detail' and 'stud_master' tables to select registration number and student name
--         where the branch is 'Computer Engineering'
SELECT stud_detail.REG_NO, stud_master.S_NAME
FROM stud_detail
JOIN stud_master ON stud_detail.REG_NO = stud_master.REG_NO
WHERE stud_master.BRANCH = 'Computer Engineering';
