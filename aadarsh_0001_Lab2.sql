create database university;
use university;
create table Department (
    DeptID int primary key,
    DeptName varchar(100)
);
create table Student (
    USN varchar(20) primary key,
    StudentName varchar(100),
    DeptID int,
    foreign key (DeptID) REFERENCES Department(DeptID)
);
create table Course (
    CourseID varchar(20) primary key,
    CourseName varchar(100),
    DeptID int,
    foreign key (DeptID) REFERENCES Department(DeptID)
);
create table CourseReg (
    USN varchar(20),
    CourseID varchar(20),
    primary key (USN, CourseID),
    foreign key (USN) REFERENCES Student(USN),
    foreign key (CourseID) REFERENCES Course(CourseID)
);
create table Marks (
    USN varchar(20),
    CourseID varchar(20),
    Marks int,
    foreign key (USN) REFERENCES Student(USN),
    foreign key (CourseID) REFERENCES Course(CourseID)
);

insert into Department values
(1, 'Physics'),
(2, 'Computer Science'),
(3, 'Mathematics');

insert into Student values
('24BSC101', 'Ravi Kumar', 1),
('24BSC107', 'Aadarsh Bhandari', 2),
('24BSC123', 'Mukesh', 3);

insert into Course values
('CS202', 'Database Systems', 2),
('CH217', 'Organic Chemistry' , 3),
('PY117', 'Quantum Mechanics', 1);

insert into CourseReg values
('24BSC101', 'PY117'),
('24BSC107', 'CS202'),
('24BSC123', 'CH217');

insert into Marks values
('24BSC101', 'PY117', 82),
('24BSC107', 'CS202', 91),
('24BSC123', 'CH217', 96);

select * from Department;
select * from Student;
select * from Course;
select * from CourseReg;
select * from Marks;
