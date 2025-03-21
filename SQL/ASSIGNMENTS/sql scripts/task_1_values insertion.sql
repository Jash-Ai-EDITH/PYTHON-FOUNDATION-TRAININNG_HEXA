INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('Arun', 'Kumar', '1998-05-12', 'arun.kumar@example.com', '9876543210'),
('Karthik', 'Raj', '1997-11-20', 'karthik.raj@example.com', '9823456710'),
('Priya', 'Subramani', '1999-02-25', 'priya.subramani@example.com', '9812345678'),
('Deepak', 'Ravi', '1996-07-18', 'deepak.ravi@example.com', '9887654321'),
('Meena', 'Lakshmanan', '2000-10-05', 'meena.lakshmanan@example.com', '9834567890'),
('Ramesh', 'Venkatesh', '1995-04-30', 'ramesh.venkatesh@example.com', '9845671234'),
('Sundar', 'Babu', '1998-09-14', 'sundar.babu@example.com', '9871234567'),
('Lakshmi', 'Iyer', '1997-03-08', 'lakshmi.iyer@example.com', '9823456789'),
('Bala', 'Murugan', '1999-12-21', 'bala.murugan@example.com', '9815674321'),
('Janani', 'Sridhar', '2001-06-11', 'janani.sridhar@example.com', '9834123456');

INSERT INTO Teachers (first_name, last_name, email) VALUES
('Ganesh', 'Narayanan', 'ganesh.narayanan@example.com'),
('Uma', 'Ravi', 'uma.ravi@example.com'),
('Harish', 'Selvam', 'harish.selvam@example.com'),
('Revathi', 'Krishnan', 'revathi.krishnan@example.com');

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Data Science Fundamentals', 4, 1),
('Mathematics for AI', 3, 2),
('Database Management Systems', 5, 3),
('Computer Networks', 3, 4),
('Software Engineering Principles', 4, 1),
('Artificial Intelligence', 5, 2),
('Data Structures & Algorithms', 4, 3),
('Operating Systems', 4, 4),
('Cyber Security Basics', 3, 1),
('Machine Learning', 5, 2);

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03'),
(4, 4, '2024-03-04'),
(5, 5, '2024-03-05'),
(6, 6, '2024-03-06'),
(7, 7, '2024-03-07'),
(8, 8, '2024-03-08'),
(9, 9, '2024-03-09'),
(10, 10, '2024-03-10');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 500.00, '2024-03-10'),
(2, 700.00, '2024-03-15'),
(3, 300.00, '2024-03-20'),
(4, 400.00, '2024-03-25'),
(5, 600.00, '2024-04-01'),
(6, 800.00, '2024-04-05'),
(7, 450.00, '2024-04-10'),
(8, 550.00, '2024-04-15'),
(9, 650.00, '2024-04-20'),
(10, 750.00, '2024-04-25');

SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM courses;
SELECT * FROM enrollments;
SELECT * FROM payments;
