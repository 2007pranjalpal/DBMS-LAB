-- Lab Sheet 1: DDL Commands - CREATE, ALTER, DROP
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;
CREATE DATABASE IF NOT EXISTS CollegeDB;
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
ALTER TABLE Student_DDL_Demo ADD COLUMN Email VARCHAR(150);
ALTER TABLE Student_DDL_Demo ADD COLUMN Phone VARCHAR(20);
ALTER TABLE Student_DDL_Demo MODIFY COLUMN Name VARCHAR(150) NOT NULL;
ALTER TABLE Student_DDL_Demo RENAME TO Student_Details_DDL_Demo;
ALTER TABLE Student_Details_DDL_Demo RENAME COLUMN City TO Address;
ALTER TABLE Employee_DDL_Demo ADD COLUMN Salary_Bonus DECIMAL(10,2);
ALTER TABLE Student_Details_DDL_Demo DROP COLUMN Phone;
ALTER TABLE Student_Details_DDL_Demo DROP COLUMN Email;
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
