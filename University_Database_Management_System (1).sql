-- =====================================
-- University Database Management System
-- =====================================

-- Tables:
-- Student_Table
-- Professor_Table
-- College_Table
-- Department_Table

-- This project demonstrates SQL operations like:
-- SELECT, JOIN, UNION, ALTER, AGGREGATE FUNCTIONS

/* ===============================
   TASK 1 : DATABASE AND TABLES
   =============================== */

/* ===============================
   TASK 1 : DATABASE AND TABLES
   =============================== */

CREATE DATABASE University_Data;
USE University_Data;

/* College Table */
CREATE TABLE College_Table(
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(50),
    College_Area VARCHAR(50)
);

/* Department Table */
CREATE TABLE Department_Table(
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Dept_Facility VARCHAR(50),
    College_ID INT,
    FOREIGN KEY (College_ID) REFERENCES College_Table(College_ID)
);

/* Professor Table */
CREATE TABLE Professor_Table(
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(50),
    Professor_Subject VARCHAR(50)
);

/* Student Table */
CREATE TABLE Student_Table(
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Student_Stream VARCHAR(50),
    Professor_ID INT,
    FOREIGN KEY (Professor_ID) REFERENCES Professor_Table(Professor_ID)
);

/* Insert Sample Records (10 each) */

INSERT INTO College_Table VALUES
(1,'Central College','Pune'),
(2,'City College','Mumbai'),
(3,'Commerce College','Nashik'),
(4,'Modern College','Nagpur'),
(5,'Science College','Delhi'),
(6,'Engineering College','Chennai'),
(7,'Arts College','Kolkata'),
(8,'National College','Jaipur'),
(9,'Royal College','Indore'),
(10,'Global College','Hyderabad');

INSERT INTO Department_Table VALUES
(1,'IT','Lab',1),
(2,'Commerce','Library',2),
(3,'Science','Research Lab',3),
(4,'Arts','Hall',4),
(5,'Mechanical','Workshop',5),
(6,'Civil','Survey Lab',6),
(7,'Electrical','Power Lab',7),
(8,'Medical','Hospital',8),
(9,'Law','Court Room',9),
(10,'Management','Seminar Hall',10);

INSERT INTO Professor_Table VALUES
(1,'Amit','Math'),
(2,'Ravi','Physics'),
(3,'Suresh','Chemistry'),
(4,'Anita','Accounts'),
(5,'Rahul','IT'),
(6,'Pooja','Law'),
(7,'Meena','English'),
(8,'Vijay','Biology'),
(9,'Kiran','Economics'),
(10,'Ajay','Statistics');

INSERT INTO Student_Table VALUES
(1,'Aakash','Science',1),
(2,'Aman','Commerce',2),
(3,'Neha','IT',3),
(4,'Anjali','Arts',4),
(5,'Arjun','Science',5),
(6,'Rohit','Commerce',6),
(7,'Akshay','IT',7),
(8,'Sneha','Arts',8),
(9,'Aditi','Science',9),
(10,'Riya','IT',10);


/* ===============================
   TASK 2 : QUERIES
   =============================== */

-- 1
SELECT College_ID, College_Name FROM College_Table;

-- 2
SELECT TOP 5 * FROM Student_Table;

-- 3
SELECT Professor_Name FROM Professor_Table WHERE Professor_ID = 5;

-- 4
SELECT UPPER(Professor_Name) FROM Professor_Table;

-- 5
SELECT * FROM Student_Table WHERE Student_Name LIKE 'A%';

-- 6
SELECT * FROM College_Table WHERE College_Name LIKE '%a';

-- 7
ALTER TABLE Professor_Table ADD Salary INT;

-- 8
ALTER TABLE Student_Table ADD Contact VARCHAR(15);

-- 9
SELECT SUM(Salary) AS Total_Salary FROM Professor_Table;

-- 10
ALTER TABLE Student_Table ALTER COLUMN Contact BIGINT;


/* ===============================
   TASK 3 : ADVANCED
   =============================== */

-- 1 Combine first 5 records
SELECT TOP 5 Student_ID, Student_Name FROM Student_Table
UNION
SELECT TOP 5 Professor_ID, Professor_Name FROM Professor_Table;

-- 2 Inner Join all tables
SELECT *
FROM College_Table C
INNER JOIN Department_Table D ON C.College_ID = D.College_ID
INNER JOIN Professor_Table P ON P.Professor_ID = D.Dept_ID
INNER JOIN Student_Table S ON S.Professor_ID = P.Professor_ID;


-- 3 Create View
CREATE VIEW [College_View] AS
SELECT * FROM College_Table
WHERE College_Name LIKE 'C%';

-- 4 Stored Procedure
CREATE PROCEDURE GetProfessor
@ID INT
AS
SELECT * FROM Professor_Table
WHERE Professor_ID = @ID;

--5 Execute
EXEC GetProfessor 5;

-- 6 Rename table
EXEC sp_rename 'College_Table','College_Tables_Data';
