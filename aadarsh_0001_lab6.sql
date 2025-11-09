-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT:
-- DESC Patients;
-- Field          Type          Null  Key  Default  Extra
-- patient_id     int           NO    PRI          auto_increment
-- patient_name   varchar(50)   YES
-- age            int           YES
-- gender         varchar(10)   YES

-- DESC Visits;
-- Field           Type           Null  Key  Default  Extra
-- visit_id        int            NO    PRI          auto_increment
-- patient_id      int            YES   MUL
-- visit_date      date           YES
-- doctor_id       int            YES
-- diagnosis       varchar(100)   YES
-- treatment_cost  decimal(10,2)  YES

-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.

INSERT INTO Patients (patient_name, age, gender) VALUES
('Ravi Kumar', 28, 'Male'),
('Sneha Patil', 34, 'Female'),
('Amit Sharma', 40, 'Male'),
('Priya Singh', 25, 'Female'),
('Rahul Mehta', 30, 'Male');

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(1, '2025-01-10', 101, 'Flu', 150.00),
(2, '2025-01-12', 102, 'Diabetes', 350.00),
(3, '2025-01-15', 103, 'Fever', 180.00),
(4, '2025-01-18', 104, 'Asthma', 400.00),
(5, '2025-01-20', 105, 'Flu', 120.00),
(1, '2025-01-25', 101, 'Flu', 200.00),
(3, '2025-01-28', 103, 'Asthma', 380.00),
(4, '2025-02-01', 102, 'Diabetes', 320.00),
(5, '2025-02-03', 104, 'Fever', 170.00),
(2, '2025-02-05', 105, 'Flu', 180.00);

-- OUTPUT:
-- SELECT * FROM Patients;
-- SELECT * FROM Visits;

-- ======================================================================
-- QUICK NOTES (for your report)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.

SELECT diagnosis, 
       COUNT(*) AS total_visits, 
       AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;

-- OUTPUT:
-- diagnosis | total_visits | avg_cost
-- Flu       | 4            | 162.5
-- Diabetes  | 2            | 335.0
-- Fever     | 2            | 175.0
-- Asthma    | 2            | 390.0

-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.

SELECT diagnosis, 
       COUNT(*) AS total_visits, 
       AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;

-- OUTPUT:
-- diagnosis | total_visits | avg_cost
-- Diabetes  | 2            | 335.0
-- Asthma    | 2            | 390.0

-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.

SELECT diagnosis, 
       COUNT(*) AS total_visits, 
       AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;

-- OUTPUT:
-- diagnosis | total_visits | avg_cost
-- Asthma    | 2            | 390.0
-- Diabetes  | 2            | 335.0
-- Flu       | 4            | 162.5
-- Fever     | 2            | 175.0

-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.

CREATE INDEX idx_patient_id ON Visits(patient_id);

-- Verify index creation
SHOW INDEX FROM Visits;

-- Retrieve all visits for a particular patient (example: patient_id = 1)
SELECT * FROM Visits WHERE patient_id = 1;

-- OUTPUT:
-- SHOW INDEX FROM Visits;
-- Table  | Non_unique | Key_name       | Column_name | Index_type
-- Visits | 1           | idx_patient_id | patient_id  | BTREE

-- SELECT * FROM Visits WHERE patient_id = 1;
-- visit_id | patient_id | visit_date  | doctor_id | diagnosis | treatment_cost
-- 1        | 1          | 2025-01-10  | 101       | Flu       | 150.00
-- 6        | 1          | 2025-01-25  | 101       | Flu       | 200.00

-- ======================================================================
-- END OF EXPERIMENT
