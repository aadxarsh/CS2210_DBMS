-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW


-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW


-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW


-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW



-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW


-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW


-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW



-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW


-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW


-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW



-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW


-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW


-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW


-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW



-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW


-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW


-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================