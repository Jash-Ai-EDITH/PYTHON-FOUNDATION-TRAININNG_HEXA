select * from students;
select * from payments;
-- 1
SELECT s.student_id, s.first_name, s.last_name, 
       CASE 
           WHEN SUM(p.amount) IS NULL THEN 0 
           ELSE SUM(p.amount) 
       END AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1  
GROUP BY s.student_id;

-- 2
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY student_count DESC;

-- 3
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


-- 4
SELECT DISTINCT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.last_name, s.first_name;

-- 5
SELECT t.first_name, t.last_name, c.course_name
FROM Teachers t
RIGHT JOIN Courses c ON t.teacher_id = c.teacher_id
ORDER BY t.last_name, t.first_name;

-- 6
SELECT s.student_id, s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Machine Learning';  


-- 7
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES ('Arjun', 'Kumar', '2000-05-12', 'arjun.kumar@example.com', '9123457680');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
SELECT s.student_id, c.course_id, CURDATE()
FROM Students s, Courses c
WHERE s.first_name = 'Arjun' AND s.last_name = 'Kumar'
AND c.course_name = 'Machine Learning';  
/* added a person enrolled but not paid */
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;
select * from payments;

-- 8

SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;


-- 9
select * from courses;
select * from students;
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
SELECT s.student_id, c.course_id, CURDATE()
FROM Students s, Courses c
WHERE s.first_name = 'Arjun' AND s.last_name = 'Kumar'
AND c.course_name = 'Artificial Intelligence';  

/* added a person course enrollment for example */

SELECT s.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;

-- 10
/* added a teacher with no course assigned */
INSERT INTO Teachers (first_name, last_name, email) 
VALUES ('Karthika ', 'Madhan', 'KarthikaMadhan.sharma@example.com');

SELECT t.teacher_id, t.first_name, t.last_name
FROM Teachers t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

