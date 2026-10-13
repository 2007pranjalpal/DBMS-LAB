-- Lab Sheet 4: SQL Operators (MySQL)
USE CollegeDB;

-- Arithmetic operators
SELECT 10 + 5 AS Addition;
SELECT 10 - 5 AS Subtraction;
SELECT 10 * 5 AS Multiplication;
SELECT 10 / 5 AS Division;
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount FROM Product;

-- Logical operators
SELECT * FROM Student WHERE Age >= 18 AND City = 'Delhi';
SELECT * FROM Employee WHERE Department = 'Business' OR Department = 'Mechanical';
SELECT * FROM Student WHERE NOT City = 'Delhi';
SELECT * FROM Student WHERE Course = 'BCA' AND City = 'Delhi';
SELECT * FROM Employee WHERE Department IN ('Business', 'Mechanical');

-- Comparison operators
SELECT * FROM Student WHERE City = 'Meerut';
SELECT * FROM Employee WHERE Salary > 50000;
SELECT * FROM Employee WHERE Salary < 50000;
SELECT * FROM Employee WHERE Salary >= 50000 AND Salary <= 70000;
SELECT * FROM Student WHERE City <> 'Delhi';
SELECT * FROM Student WHERE City != 'Delhi';

-- Special operators
SELECT * FROM Employee WHERE Salary BETWEEN 45000 AND 60000;
SELECT * FROM Student WHERE City IN ('Delhi', 'Meerut');
SELECT * FROM Student WHERE City NOT IN ('Delhi', 'Meerut');
SELECT * FROM Student WHERE Name LIKE 'A%';
SELECT * FROM Student WHERE Email IS NULL;
SELECT * FROM Student WHERE Email IS NOT NULL;

-- Set operations
SELECT City AS Place FROM Student
UNION
SELECT Location AS Place FROM Department;

SELECT City AS Place FROM Student
UNION ALL
SELECT Location AS Place FROM Department;

-- INTERSECT is supported in MySQL 8.0.31+:
-- SELECT City AS Place FROM Student INTERSECT SELECT Location AS Place FROM Department;
-- Compatible alternative to find cities/locations common to both result sets:
SELECT DISTINCT s.City AS Common_Place
FROM Student s
INNER JOIN Department d ON d.Location = s.City;

-- EXCEPT is supported in MySQL 8.0.31+:
-- SELECT City AS Place FROM Student EXCEPT SELECT Location AS Place FROM Department;
-- Compatible alternative:
SELECT DISTINCT s.City AS Student_City_Not_Used_As_Department_Location
FROM Student s
WHERE NOT EXISTS (
    SELECT 1 FROM Department d WHERE d.Location = s.City
);

-- Combined arithmetic + logical + comparison + special operators
SELECT Product_Name, Price, Quantity, Price * Quantity AS Total_Amount
FROM Product
WHERE Price BETWEEN 100 AND 8000
  AND Quantity > 0
  AND (Product_Name LIKE 'M%' OR Product_Name LIKE 'K%');
