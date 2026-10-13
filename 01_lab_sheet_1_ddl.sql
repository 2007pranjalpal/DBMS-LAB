-- Lab Sheet 1: DDL Commands - CREATE, ALTER, DROP
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- 1. Create database
CREATE DATABASE IF NOT EXISTS CollegeDB;

-- 2-9. Create example tables (run 00_setup.sql first for the full shared schema).
CREATE TABLE IF NOT EXISTS Student_DDL_Demo (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Employee_DDL_Demo (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    Email VARCHAR(150) UNIQUE
);

CREATE TABLE IF NOT EXISTS Department_DDL_Demo (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Product_DDL_Demo (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

CREATE TABLE IF NOT EXISTS Customer_DDL_Demo (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Course_DDL_Demo (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Faculty_DDL_Demo (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(100),
    Salary DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Library_DDL_Demo (
    Book_ID INT PRIMARY KEY,
    Book_Name VARCHAR(150),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 10. Department table with primary key: Dept_ID is the PRIMARY KEY above.
-- 11. Student primary key + NOT NULL: shown in Student_DDL_Demo.
-- 12. Employee UNIQUE Email: shown in Employee_DDL_Demo.
-- 13. Product CHECK Price > 0: shown in Product_DDL_Demo.

-- 14-15. Add Email and Phone columns.
ALTER TABLE Student_DDL_Demo ADD COLUMN Email VARCHAR(150);
ALTER TABLE Student_DDL_Demo ADD COLUMN Phone VARCHAR(20);

-- 16. Modify datatype/size of Name.
ALTER TABLE Student_DDL_Demo MODIFY COLUMN Name VARCHAR(150) NOT NULL;

-- 17. Rename Student table to Student_Details.
ALTER TABLE Student_DDL_Demo RENAME TO Student_Details_DDL_Demo;

-- 18. Rename City to Address (MySQL 8.0 syntax).
ALTER TABLE Student_Details_DDL_Demo RENAME COLUMN City TO Address;

-- 19. Add Salary to Employee.
ALTER TABLE Employee_DDL_Demo ADD COLUMN Salary_Bonus DECIMAL(10,2);

-- 20-21. Drop Phone and Email columns.
ALTER TABLE Student_Details_DDL_Demo DROP COLUMN Phone;
ALTER TABLE Student_Details_DDL_Demo DROP COLUMN Email;

-- 22. TRUNCATE example (uncomment to remove all rows from this demo table).
-- TRUNCATE TABLE Student_Details_DDL_Demo;

-- 23-24. DROP examples (uncomment when you want to remove these demo tables).
-- DROP TABLE Course_DDL_Demo;
-- DROP TABLE Customer_DDL_Demo;

-- 25. Complete Student table using PK, NOT NULL, UNIQUE, CHECK.
CREATE TABLE IF NOT EXISTS Student_Constraints_Demo (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE,
    Age INT CHECK (Age >= 16),
    Fees DECIMAL(10,2) CHECK (Fees >= 0)
);

-- More ALTER/DROP examples (safe demo table only):
ALTER TABLE Student_Constraints_Demo ADD COLUMN City VARCHAR(100);
-- DROP TABLE Student_Constraints_Demo; -- Uncomment to demonstrate DROP.
SHOW TABLES;
