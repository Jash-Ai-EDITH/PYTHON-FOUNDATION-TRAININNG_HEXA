-- 1
SELECT AVG(enrollment_count) AS avg_students_per_course
FROM (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollment_counts;

-- 2
SELECT s.student_id, s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);

-- 3
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_enrollments
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.student_id) = (
    SELECT MAX(enrollment_count) 
    FROM (
        SELECT course_id, COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS course_enrollments
);

-- 4
SELECT t.teacher_id, t.first_name, t.last_name,  
       COALESCE(SUM(p.amount), 0) AS total_payments  
FROM Teachers t  
JOIN Courses c ON t.teacher_id = c.teacher_id  
JOIN Enrollments e ON c.course_id = e.course_id  
LEFT JOIN Payments p ON e.student_id = p.student_id  
GROUP BY t.teacher_id, t.first_name, t.last_name;  

-- 5
-- no students have enrolled in all courses so the result is null
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE (
    SELECT COUNT(DISTINCT e.course_id)
    FROM Enrollments e
    WHERE e.student_id = s.student_id
) = (SELECT COUNT(course_id) FROM Courses);

/* 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to 
find teachers with no course assignments. */

SELECT t.teacher_id, t.first_name, t.last_name
FROM Teachers t
WHERE t.teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses WHERE teacher_id IS NOT NULL);

/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student 
based on their date of birth. */

SELECT AVG(student_age) AS average_age
FROM (
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS student_age
    FROM Students
) AS age_subquery;

/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment 
records. */

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT DISTINCT course_id FROM Enrollments
);

/*9. Calculate the total payments made by each student for each course they are enrolled in. Use 
subqueries and aggregate functions to sum payments. */

SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, 
       (SELECT SUM(p.amount) 
        FROM Payments p 
        WHERE p.student_id = s.student_id) AS total_payment
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;


/* 10. Identify students who have made more than one payment. Use subqueries and aggregate 
functions to count payments per student and filter for those with counts greater than one. */

-- making a student pursuing more than one corse to acheive the question
select * from students;
INSERT INTO Payments (student_id, amount, payment_date) 
VALUES 
    ((SELECT student_id FROM Students WHERE first_name = 'Priya' AND last_name = 'subramani'), 500.00, '2024-03-01'),
    ((SELECT student_id FROM Students WHERE first_name = 'Priya' AND last_name = 'subramani'), 300.00, '2024-03-10');
    
select * from payments;
SELECT student_id, COUNT(payment_id) AS payment_count
FROM Payments
GROUP BY student_id
HAVING COUNT(payment_id) > 1;

/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students" 
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each 
student.*/

SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    COALESCE(SUM(p.amount), 0) AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY total_payments DESC;

/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use 
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to 
count enrollments. */

SELECT 
    c.course_name, 
    COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY student_count DESC;

/*13. Calculate the average payment amount made by students. Use JOIN operations between the 
"Students" table and the "Payments" table and GROUP BY to calculate the average. */
SELECT 
    s.student_id, 
    s.first_name, 
    s.last_name, 
    COALESCE(AVG(p.amount), 0) AS average_payment
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
ORDER BY average_payment DESC;







