-- Lab Sheet 2: DML Commands - INSERT, UPDATE, DELETE
-- Run 00_setup.sql first. This script uses the shared Student/Employee/etc. tables.
USE CollegeDB;

-- 1. Insert one record (use a dedicated demo table so existing sample data stays intact).
CREATE TABLE IF NOT EXISTS Student_DML_Demo (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

DELETE FROM Student_DML_Demo;
INSERT INTO Student_DML_Demo VALUES (1, 'Aarav', 19, 'BCA', 'Meerut');

-- 2. Five records using separate INSERT statements.
INSERT INTO Student_DML_Demo VALUES (2, 'Diya', 20, 'BCA', 'Delhi');
INSERT INTO Student_DML_Demo VALUES (3, 'Kabir', 21, 'B.Tech', 'Noida');
INSERT INTO Student_DML_Demo VALUES (4, 'Sara', 19, 'BBA', 'Meerut');
INSERT INTO Student_DML_Demo VALUES (5, 'Arjun', 22, 'BCA', 'Delhi');
INSERT INTO Student_DML_Demo VALUES (6, 'Mehak', 20, 'BBA', 'Ghaziabad');

-- 3. Multiple records in one statement.
INSERT INTO Student_DML_Demo (Student_ID, Name, Age, Course, City) VALUES
(7, 'Ishita', 18, 'BCA', 'Noida'),
(8, 'Dev', 21, 'B.Tech', 'Delhi');

-- 4-8. Insert examples for other tables, with unique demo IDs.
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Email, Joining_Date, Manager_ID, Dept_ID)
VALUES (205, 'Demo Employee', 'Computer Science', 40000, 'demo.employee@example.com', '2024-01-01', 201, 1);

INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES
(9, 'Demo Department', 'Block E');

INSERT INTO Product (Product_ID, Product_Name, Price, Quantity) VALUES
(305, 'Demo Product', 99.00, 5);

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone) VALUES
(403, 'Demo Customer', 'demo.customer@example.com', '9876533333');

INSERT INTO Course (Course_ID, Course_Name, Duration, Fees, Dept_ID) VALUES
(105, 'Demo Course', '6 months', 12000, 9);

-- 9. Record with all columns.
INSERT INTO Student_DML_Demo (Student_ID, Name, Age, Course, City)
VALUES (9, 'Riya', 20, 'BCA', 'Meerut');

-- 10. Insert selected columns only.
INSERT INTO Student_DML_Demo (Student_ID, Name)
VALUES (10, 'Om');

-- 11. Update city of a particular student.
UPDATE Student_DML_Demo SET City = 'Jaipur' WHERE Student_ID = 1;

-- 12. Update salary of a particular employee.
UPDATE Employee SET Salary = 42000 WHERE Emp_ID = 205;

-- 13. Increase salary of all employees by 10%.
-- Demonstration against only the demo employee to avoid repeatedly increasing all sample salaries:
UPDATE Employee SET Salary = Salary * 1.10 WHERE Emp_ID = 205;

-- 14. Increase product prices by 5% (demo product only).
UPDATE Product SET Price = Price * 1.05 WHERE Product_ID = 305;

-- 15. Change course of a particular student.
UPDATE Student_DML_Demo SET Course = 'B.Tech' WHERE Student_ID = 1;

-- 16. Update department of an employee.
UPDATE Employee SET Department = 'Business', Dept_ID = 3 WHERE Emp_ID = 205;

-- 17. Update all students from Meerut to Delhi (demo table).
UPDATE Student_DML_Demo SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update fees of a particular course.
UPDATE Course SET Fees = 12500 WHERE Course_ID = 105;

-- 19. Update multiple columns simultaneously.
UPDATE Student_DML_Demo
SET Age = 21, Course = 'BCA', City = 'Noida'
WHERE Student_ID = 2;

-- 20. Delete a particular student by ID.
DELETE FROM Student_DML_Demo WHERE Student_ID = 10;

-- 21. Delete students from a particular city (demo table).
DELETE FROM Student_DML_Demo WHERE City = 'Ghaziabad';

-- 22. Delete employees below a salary amount (demo employee only).
DELETE FROM Employee WHERE Emp_ID = 205 AND Salary < 50000;

-- 23. Delete products whose quantity is zero.
-- Use a safe condition scoped to the example product:
DELETE FROM Product WHERE Product_ID = 305 AND Quantity = 0;

-- 24. Multiple conditions with AND/OR.
DELETE FROM Student_DML_Demo
WHERE (Age < 18 AND City = 'Delhi') OR (Course = 'BBA' AND City = 'Delhi');

-- 25. Display table after operations.
SELECT * FROM Student_DML_Demo ORDER BY Student_ID;
SELECT * FROM Employee;
SELECT * FROM Product;
SELECT * FROM Course;
