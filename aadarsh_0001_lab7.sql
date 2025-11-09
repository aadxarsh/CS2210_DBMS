-- ======================================================================
-- Lab Experiment – Implementation of Procedures in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create stored procedures in MySQL.
-- 2. To implement procedures for performing INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT:
-- (Run DESC Employees; to verify structure)
DESC Employees;
-- WRITE YOUR OUTPUT BELOW
-- Field 		Type			Null	Key		Default		Extra
-- EmpID		int				NO		PRI					auto_increment
-- EmpName		varchar(50)		YES			
-- Department	varchar(50)		YES			
-- Salary		decimal(10,2)	YES			

-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify data)
SELECT * FROM Employees;
-- WRITE YOUR OUTPUT BELOW
-- EmpID	EmpName		Department	Salary
-- 1		John		IT			55000.00
-- 2		Alice		HR			50000.00
-- 4		John		IT			55000.00
-- 5		Alice		HR			48000.00
-- 6		Bob			Finance		60000.00
-- 7		David		Marketing	52000.00

-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER $$
CREATE PROCEDURE DisplayEmployees()
BEGIN
  SELECT * FROM Employees;
END $$
DELIMITER ;

-- CALL DisplayEmployees();
CALL DisplayEmployees();
-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
-- EmpID	EmpName		Department	Salary
-- 1		John		IT			55000.00
-- 2		Alice		HR			48000.00
-- 3		Bob			Finance		60000.00
-- 4		John		IT			55000.00
-- 5		Alice		HR			48000.00
-- 6		Bob			Finance		60000.00


-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER $$
CREATE PROCEDURE AddEmployee(
  IN pname VARCHAR(50),
  IN pdept VARCHAR(50),
  IN psalary DECIMAL(10,2)
)
BEGIN
  INSERT INTO Employees (EmpName, Department, Salary)
  VALUES (pname, pdept, psalary);
END $$
DELIMITER ;

-- CALL AddEmployee('David', 'Marketing', 52000);
CALL AddEmployee('David', 'Marketing', 52000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify insertion)
SELECT * FROM Employees;
-- WRITE YOUR OUTPUT BELOW
-- EmpID	EmpName		Department	Salary
-- 1		John		IT			55000.00
-- 2		Alice		HR			48000.00
-- 3		Bob			Finance		60000.00
-- 4		John		IT			55000.00
-- 5		Alice		HR			48000.00
-- 6		Bob			Finance		60000.00
-- 7		David		Marketing	52000.00


-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER $$
CREATE PROCEDURE UpdateSalary(
  IN pempid INT,
  IN psalary DECIMAL(10,2)
)
BEGIN
  UPDATE Employees SET Salary = psalary WHERE EmpID = pempid;
END $$
DELIMITER ;


-- CALL UpdateSalary(2, 50000);
CALL UpdateSalary(2, 50000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify update)
SELECT * FROM Employees;
-- WRITE YOUR OUTPUT BELOW
-- EmpID	EmpName		Department	Salary
-- 1		John		IT			55000.00
-- 2		Alice		HR			50000.00
-- 4		John		IT			55000.00
-- 5		Alice		HR			48000.00
-- 6		Bob			Finance		60000.00
-- 7		David		Marketing	52000.00


-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER $$
CREATE PROCEDURE RemoveEmployee(IN pempid INT)
BEGIN
  DELETE FROM Employees WHERE EmpID = pempid;
END $$
DELIMITER ;

-- CALL RemoveEmployee(3);
CALL RemoveEmployee(3);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify deletion)
SELECT * FROM Employees;
-- WRITE YOUR OUTPUT BELOW
-- EmpID	EmpName		Department	Salary
-- 1		John		IT			55000.00
-- 2		Alice		HR			50000.00
-- 4		John		IT			55000.00
-- 5		Alice		HR			48000.00
-- 6		Bob			Finance		60000.00
-- 7		David		Marketing	52000.00


-- ======================================================================
-- END OF EXPERIMENT – Implementation of Procedures
-- ======================================================================