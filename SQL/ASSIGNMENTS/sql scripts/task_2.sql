-- 1.insert a student 
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) 
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
SELECT * FROM students;

-- 2
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
SELECT s.student_id, c.course_id, CURDATE()
FROM Students s, Courses c
WHERE s.first_name = 'John' AND s.last_name = 'Doe'
AND c.course_name = 'Data Science Fundamentals';

SELECT * FROM enrollments;

-- 3
UPDATE Teachers 
SET email = 'uma.updated@example.com' 
WHERE teacher_id = 2;

SELECT * FROM teachers;

-- 4
DELETE FROM Enrollments 
WHERE student_id = (SELECT student_id FROM Students WHERE first_name = 'John' AND last_name = 'Doe') 
AND course_id = (SELECT course_id FROM Courses WHERE course_name = 'Data Science Fundamentals');

SELECT * FROM enrollments;


-- 5
UPDATE Courses 
SET teacher_id = (SELECT teacher_id FROM Teachers WHERE first_name = 'harish' AND last_name = 'selvam')
WHERE course_name = 'Machine Learning'
AND teacher_id = 2;  

SELECT * FROM courses;

-- 6
DELETE FROM Enrollments 
WHERE student_id = (SELECT student_id FROM Students WHERE first_name = 'bala' AND last_name = 'murugan' LIMIT 1);

-- 7
UPDATE Payments 
SET amount = 950.00
WHERE payment_date BETWEEN '2024-04-01' AND '2024-04-30'
AND student_id = (SELECT student_id FROM Students WHERE first_name = 'sundar' AND last_name = 'babu' LIMIT 1);

SELECT * FROM payments;
SELECT * FROM enrollments;


