-- Lab Sheet 3: SQL Functions (MySQL)
USE CollegeDB;

-- A. Number functions
SELECT ABS(-25) AS Absolute_Value;
SELECT ROUND(123.4567, 2) AS Rounded_Value;
SELECT CEIL(12.2) AS Ceiling_Value, FLOOR(12.8) AS Floor_Value;
SELECT MOD(17, 5) AS Remainder;
SELECT Emp_Name, ROUND(Salary, 0) AS Rounded_Salary FROM Employee;

-- B. Aggregate functions
SELECT COUNT(*) AS Total_Students FROM Student;
SELECT SUM(Salary) AS Total_Salary FROM Employee;
SELECT AVG(Salary) AS Average_Salary FROM Employee;
SELECT MAX(Salary) AS Highest_Salary FROM Employee;
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;

-- C. Character functions
SELECT Name, UPPER(Name) AS Upper_Name FROM Student;
SELECT Name, LOWER(Name) AS Lower_Name FROM Student;
SELECT Name, LENGTH(Name) AS Name_Length_Bytes FROM Student;
SELECT CONCAT('Aman', ' ', 'Sharma') AS Full_Name;
SELECT Name, SUBSTRING(Name, 1, 3) AS First_Three_Characters FROM Student;

-- D. Conversion functions
SELECT CAST(123 AS CHAR) AS Number_As_String;
SELECT CAST('456' AS UNSIGNED) AS String_As_Number;
SELECT DATE_FORMAT('2025-05-19', '%d-%m-%Y') AS Formatted_Date;
SELECT CAST('2025-01-31' AS DATE) AS Cast_Date;
-- MySQL CONVERT() example:
SELECT CONVERT('2025-10-14', DATE) AS Converted_Date;

-- E. Date functions
SELECT CURDATE() AS Current_Date;
SELECT YEAR(Joining_Date) AS Joining_Year,
       MONTH(Joining_Date) AS Joining_Month,
       DAY(Joining_Date) AS Joining_Day
FROM Employee;
SELECT DATEDIFF(CURDATE(), Joining_Date) AS Days_Since_Joining,
       Emp_Name
FROM Employee;
SELECT DATE_ADD('2025-01-01', INTERVAL 30 DAY) AS Date_After_30_Days;
SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%d/%m/%Y') AS Joining_Date_Formatted
FROM Employee;
