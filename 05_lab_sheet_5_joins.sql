-- Lab Sheet 5: SQL Joins (MySQL)
USE CollegeDB;

-- 1-2. INNER JOIN students and departments.
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 3. Employees with department names.
SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
INNER JOIN Department d ON e.Dept_ID = d.Dept_ID;

-- 4. Students with course details.
SELECT s.Name, c.Course_Name, c.Duration, c.Fees
FROM Student s
INNER JOIN Course c ON s.Course_ID = c.Course_ID;

-- 5. Students in a particular department.
SELECT s.Name, d.Dept_Name
FROM Student s
INNER JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'Computer Science';

-- 6-7. LEFT OUTER JOIN: all students, even without a matching department.
SELECT s.Name, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 8-9. RIGHT OUTER JOIN: all departments, even those with no students.
SELECT s.Name, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 10. Students not assigned to a department.
SELECT s.Student_ID, s.Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments having no students.
SELECT d.Dept_ID, d.Dept_Name
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
WHERE s.Student_ID IS NULL;

-- 12. FULL OUTER JOIN concept/workaround (MySQL has no native FULL OUTER JOIN).
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student s
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student s
RIGHT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 13-14. CROSS JOIN and number of possible combinations.
SELECT s.Name, c.Course_Name
FROM Student s
CROSS JOIN Course c;

SELECT COUNT(*) AS Possible_Student_Course_Combinations
FROM Student CROSS JOIN Course;

-- 15. NATURAL JOIN example (both tables share the column Dept_ID).
SELECT Dept_ID, Dept_Name, Emp_Name
FROM Department NATURAL JOIN Employee;

-- 16. Compare NATURAL JOIN and explicit INNER JOIN.
SELECT d.Dept_ID, d.Dept_Name, e.Emp_Name
FROM Department d
INNER JOIN Employee e ON d.Dept_ID = e.Dept_ID;

-- 17-18. SELF JOIN for employee-manager relationships.
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee e
LEFT JOIN Employee m ON e.Manager_ID = m.Emp_ID;

-- 19-20. Join Student, Department, and Course.
SELECT s.Name AS Student_Name, c.Course_Name, d.Dept_Name
FROM Student s
LEFT JOIN Course c ON s.Course_ID = c.Course_ID
LEFT JOIN Department d ON s.Dept_ID = d.Dept_ID;

-- 21. Employees earning more than their department's average salary.
SELECT e.Emp_Name, d.Dept_Name, e.Salary
FROM Employee e
JOIN Department d ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- 22. Department with the maximum number of students.
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Student_Count
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(student_count)
    FROM (
        SELECT COUNT(s2.Student_ID) AS student_count
        FROM Department d2
        LEFT JOIN Student s2 ON s2.Dept_ID = d2.Dept_ID
        GROUP BY d2.Dept_ID
    ) AS counts_by_department
);

-- 23. Each department and its student count.
SELECT d.Dept_Name, COUNT(s.Student_ID) AS Total_Students
FROM Department d
LEFT JOIN Student s ON s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
ORDER BY d.Dept_ID;

-- 24. Each course and number of enrolled students.
SELECT c.Course_Name, COUNT(s.Student_ID) AS Enrolled_Students
FROM Course c
LEFT JOIN Student s ON s.Course_ID = c.Course_ID
GROUP BY c.Course_ID, c.Course_Name
ORDER BY c.Course_ID;

-- 25. Report using INNER JOIN, LEFT JOIN, GROUP BY and aggregate functions.
SELECT d.Dept_Name,
       c.Course_Name,
       COUNT(s.Student_ID) AS Total_Students,
       AVG(s.Age) AS Average_Student_Age
FROM Department d
LEFT JOIN Course c ON c.Dept_ID = d.Dept_ID
LEFT JOIN Student s ON s.Course_ID = c.Course_ID AND s.Dept_ID = d.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;
