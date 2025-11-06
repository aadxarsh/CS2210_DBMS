-- Create Database
CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;

-- Drop old tables if re-running
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Stores;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustName VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

-- Stores Table
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY AUTO_INCREMENT,
    StoreName VARCHAR(100),
    Location VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    StoreID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- --------------------
-- Insert Sample Records
-- --------------------

-- Customers
INSERT INTO Customers (CustName, Email, Address) VALUES
('Aadarsh Bhandari', 'aadarsh@gmail.com', 'Bangalore'),
('Rohit Sharma', 'rohit@gmail.com', 'Delhi'),
('Sneha Verma', 'sneha@gmail.com', 'Mumbai'),
('Ankit Kumar', 'ankit@gmail.com', 'Hyderabad'),
('Priya Singh', 'priya@gmail.com', 'Chennai');

-- Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Sofa Set', 'Furniture', 15000, 10),
('Dining Table', 'Furniture', 12000, 5),
('Laptop', 'Electronics', 55000, 8),
('Mobile Phone', 'Electronics', 25000, 20),
('Shoes', 'Fashion', 2000, 50);

-- Stores
INSERT INTO Stores (StoreName, Location) VALUES
('Mega Mart', 'Bangalore'),
('Urban Living', 'Delhi'),
('Tech World', 'Mumbai'),
('Trendy Hub', 'Chennai'),
('City Store', 'Hyderabad');

-- Orders
INSERT INTO Orders (CustomerID, StoreID, OrderDate) VALUES
(1, 1, '2025-08-15'),
(2, 2, '2025-08-16'),
(3, 3, '2025-08-16'),
(4, 4, '2025-08-17'),
(5, 5, '2025-08-17');

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 3);

-- Payments
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2025-08-15', 15000, 'Credit Card'),
(2, '2025-08-16', 12000, 'UPI'),
(3, '2025-08-16', 55000, 'Net Banking'),
(4, '2025-08-17', 50000, 'Debit Card'),
(5, '2025-08-17', 6000, 'Cash');

-- --------------------
-- UPDATE Operations
-- --------------------

-- Disable Safe Update Mode (to avoid error 1175 in Workbench)
SET SQL_SAFE_UPDATES = 0;

-- Reduce stock after sale (example: Sofa sold once)
UPDATE Products SET StockQuantity = StockQuantity - 1 WHERE ProductID = 1;

-- Increase price of all Furniture products by 10%
UPDATE Products SET Price = Price * 1.10 WHERE Category = 'Furniture';

-- --------------------
-- Retrieve Records
-- --------------------
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Stores;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Payments;
