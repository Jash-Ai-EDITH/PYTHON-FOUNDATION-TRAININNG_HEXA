CREATE DATABASE SISDB;
USE SISDB;

CREATE TABLE Students 
	(student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL);

CREATE TABLE Teachers 
	(teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL);

CREATE TABLE Courses 
	(course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id) ON DELETE SET NULL);
    
CREATE TABLE Payments 
	(payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE);

CREATE TABLE Enrollments 
	(enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE);
