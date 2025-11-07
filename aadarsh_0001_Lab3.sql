create database TechSolutions;

use TechSolutions;

create table Employees(
EmployeeID int primary key auto_increment,
FirstName varchar(50),
LastName varchar(50),
Salary decimal(10,2),
BirthDate date,
HireDate date
);

create table Orders(
OrderID int primary key auto_increment,
OrderDate date,
TotalAmount decimal(10,2),
EmployeeID int,
foreign key (EmployeeID) references Employees(EmployeeID)
);

insert into Employees (FirstName, LastName, Salary, BirthDate, HireDate) values
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane','Smith', 65000.50,'1990-08-22', '2012-07-10'),
('Alice','Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

insert into Orders(OrderDate, TotalAmount, EmployeeID) values
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
 
select FirstName, LastName, round(Salary,0) as Rounded_Salary from Employees;

select FirstName, LastName, abs(Salary) as Absolute_Salary from Employees;

select count(*) AS Total_employee from Employees;

select sum(Salary) as Total_expenses from Employees;

select avg(TotalAmount) as AVG_Amount from Orders;

select min(Salary) as Minimum_Salary from Employees;

select max(Salary) as Maximum_Salary from Employees;

select FirstName, LastName, upper(FirstName) as UpperFirstName, lower(LastName) as LowerLastName from Employees;

select EmployeeID, concat(FirstName, ' ' , LastName) as FullName from Employees;

select substring(FirstName,1,3) as first_three_char from Employees;

select now();

select year(OrderDate) as OrderYear from Orders;

select OrderDate, date_add(OrderDate, interval 3 month) as NewDate from Orders;

select OrderDate, datediff(curdate(), OrderDate) as DaysSinceOrder from Orders;

select upper(concat(FirstName,' ',LastName)) as UpperFullName from Employees;