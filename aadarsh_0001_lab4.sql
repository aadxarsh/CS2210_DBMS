-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- ======================================================================
-- STUDENT NAME: AADARSH BHANDARI
-- USN: 1RUA24SCS0001
-- SECTION: A
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
select EmployeeID, Name, Salary, round(Salary * 1.10, 2) as Bonus_Salary from Employees;
-- ======================================================================
-- Output:
-- EmployeeID  Name      Salary     Bonus_Salary
-- 1001	       Ashish	 60000.00	66000.00
-- 1002	       Binay	 80000.00	88000.00
-- 1003	       Charlie	 55000.00	60500.00
-- 1004	       Dhruv	 75000.00	82500.00
-- ======================================================================


-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Salary, round(Salary * 0.85, 2) as Final_Salary from Employees;
-- ======================================================================
-- Output:
-- EmployeeID  Name      Salary     Final_Salary
-- 1001	       Ashish	 60000.00	51000.00
-- 1002	       Binay	 80000.00	68000.00
-- 1003	       Charlie	 55000.00	46750.00
-- 1004	       Dhruv	 75000.00	63750.00
-- ======================================================================


-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Salary, round(Salary * 12, 2) as YearlySalary from Employees;
-- ======================================================================
-- Output:
-- EmployeeID  Name      Salary     Yearly_Salary
-- 1001	       Ashish	 60000.00	720000.00
-- 1002	       Binay	 80000.00	960000.00
-- 1003	       Charlie	 55000.00	660000.00
-- 1004	       Dhruv	 75000.00	900000.00
-- ======================================================================


-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Age, mod(Age, 5) as AgeMod5 from Employees;
-- ======================================================================
-- Output:
-- EmployeeID  Name      Age   AgeMod5
-- 1001	       Ashish	 28	     3
-- 1002	       Binay	 45	     0
-- 1003	       Charlie	 32	     2
-- 1004	       Dhruv	 38	     3
-- ======================================================================


-- ========================
-- Exercise 2: Logical Operators
-- ========================


-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Age, Salary from Employees where Age > 30 and Salary > 50000;
-- ======================================================================
-- Output:
-- EmployeeID  Name      Age   Salary
-- 1002        Binay	 45	   80000.00
-- 1003	       Charlie	 32	   55000.00
-- 1004	       Dhruv	 38	   75000.00
-- ======================================================================


-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Department, Salary from Employees where Salary > 70000 or Department = 'HR';
-- ======================================================================
-- Output:
-- EmployeeID  Name      Department   Salary
-- 1002	       Binay	 HR	          80000.00
-- 1004	       Dhruv	 HR	          75000.00
-- ======================================================================


-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW
select Name, Address from Employees where Address not like '%New York%';
-- ======================================================================
-- Output:
-- Name      Address
-- Binay	 456 Elm St, Chicago
-- Charlie	 789 Oak St, Los Angeles
-- ======================================================================


-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name from Employees where Salary = 60000;
-- ======================================================================
-- Output:
-- EmployeeID Name      
--   1001	Ashish
-- ======================================================================


-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Department, Salary from Employees where Department != 'IT';
-- ======================================================================
-- Output:
-- EmployeeID   Name      Deoartment   Salary 
-- 1002	        Binay	  HR	       80000.00
-- 1003	        Charlie	  Finance	   55000.00
-- 1004	        Dhruv	  HR	       75000.00
-- ======================================================================
	
			
-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Age, Salary from Employees where Age < 25 and Salary > 50000;
-- ======================================================================
-- Output:
-- EmployeeID   Name   Age   Salary   
-- ======================================================================


-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Age from Employees where Age between 25 and 35;
-- ======================================================================
-- Output:
-- EmployeeID   Name      Age     
-- 1001	        Ashish	  28
-- 1003	        Charlie   32
-- ======================================================================


-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Department from Employees where Department in ('HR', 'IT', 'Finance');
-- ======================================================================
-- Output:
-- EmployeeID   Name      Department     
-- 1001	        Ashish	  IT
-- 1002	        Binay	  HR
-- 1003	        Charlie	  Finance
-- 1004	        Dhruv	  HR
-- ======================================================================


-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name from Employees where Name like 'A%';
-- ======================================================================
-- Output:
-- EmployeeID  Name      
-- 1001	       Ashish
-- ======================================================================


-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW
select EmployeeID, Name, Address from Employees where Address is null;
-- ======================================================================
-- Output:
-- EmployeeID   Name   Address
-- ======================================================================


-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).
-- Create Employees2022 table
create table Employees2022 (
    EmployeeID int primary key,
    Name varchar(50),
    Age int,
    Department varchar(50),
    Salary decimal(10,2)
);

-- Sample data for Employees2022
insert into Employees2022 (EmployeeID, Name, Age, Department, Salary) values
(1001, 'Ashish', 28, 'IT', 60000),
(1002, 'Binay', 45, 'HR', 80000),
(1003, 'Charlie', 32, 'Finance', 55000),
(1004, 'Dhruv', 38, 'HR', 75000),
(1005, 'Ellen', 25, 'IT', 62000);

-- Create Employees2023 table
create table Employees2023 (
    EmployeeID int primary key,
    Name varchar(50),
    Age int,
    Department varchar(50),
    Salary decimal(10,2)
);

-- Sample data for Employees2023
insert into Employees2023 (EmployeeID, Name, Age, Department, Salary) values
(1001, 'Ashish', 29, 'IT', 66000),
(1002, 'Binay', 46, 'HR', 86000),
(1005, 'Ellen', 26, 'IT', 66000),
(1006, 'Fatima', 27, 'HR', 61000),
(1007, 'Gaurav', 30, 'Marketing', 71000);


-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW

select EmployeeID, Name, Department from Employees2023 where Department = 'HR'
union
select EmployeeID, Name, Department from Employees2022 where Department = 'HR';
-- ======================================================================
-- Output:
-- EmployeeID   Name    Department
-- 1002	        Binay	HR
-- 1006	        Fatima	HR
-- 1004	        Dhruv	HR
-- ======================================================================


-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW

select distinct e23.EmployeeID, e23.Name from Employees2023 as e23
inner join Employees2022 as e22
  on e22.EmployeeID = e23.EmployeeID
where e23.Department = 'IT' and e22.Department = 'IT';
-- ======================================================================
-- Output:
-- EmployeeID   Name
-- 1001	        Ashish
-- 1005	        Ellen
-- ======================================================================


-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW

select e23.EmployeeID, e23.Name from Employees2023 as e23
left join Employees2022 as e22
  on e22.EmployeeID = e23.EmployeeID
where e22.EmployeeID is null;
-- ======================================================================
-- Output:
-- EmployeeID   Name
-- 1006	        Fatima
-- 1007	        Gaurav
-- ======================================================================


-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================