-- Student Information System
/*Task 1. Database Design:
--1. Create the database named "SISDB" */ 
-- create Student Information System (SIS) database.
create database SISDB
Use SISDB

/* 2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
types, constraints, and relationships. 
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments */

-- creating student table 
CREATE TABLE Students (
  student_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number bigint
)

-- creating Courses Table 
CREATE TABLE Courses (
  course_id INT not null PRIMARY KEY IDENTITY(1,1),
  course_name VARCHAR(100) NOT NULL,
  credits INT NOT NULL,
  teacher_id INT NOT NULL,
  FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
)

--creating Teacher Table 
CREATE TABLE Teacher (
  teacher_id INT PRIMARY KEY IDENTITY(1,1),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
)

--creating Enrollment Table 
CREATE TABLE Enrollments (
  enrollment_id INT not null PRIMARY KEY identity(1,1),
  student_id INT not null,
  course_id INT not null,
  enrollment_date DATE not null,
  FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)

--creating Payment Table 
CREATE TABLE Payments (
  payment_id INT not null PRIMARY KEY IDENTITY(100,1),
  student_id INT not null,
  amount DECIMAL(10,2) not null,
  payment_date DATE not null,
  FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
  )

 /*3. Create an ERD (Entity Relationship Diagram) for the database.
 --Created 

4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
--created

5. Insert at least 10 sample records into each of the following tables. */

--Insert into Students
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Shree', 'Shukla', '1998-01-01', 'shukla.shree@gmail.com', 1234567890),
       ('Hari', 'Pathak', '2000-02-14', 'pathak.hari@gmail.com', 9876543210),
       ('Samarth', 'Joshi', '1997-05-12', 'joshi.samarth@gmail.com', 5551234567),
       ('Aksh', 'Tiwari', '1999-08-21', 'tiwari.aksh@gmail.com', 8887776655),
       ('Gargi', 'Sharma', '2001-11-03', 'sharma.gargia@gmail.com', 2125551212),
       ('Ridhhi', 'Shukla', '1998-07-10', 'shukla.ridhhi@gmail.com', 3334445555),
       ('Ratna', 'Joshi', '2000-03-25', 'sarah.ratna@gmail.com', 4442221111),
       ('Nisha', 'Chaube', '1999-12-16', 'chaube.nisha@gmail.com', 6665554444),
       ('Dipika', 'Dubey', '2001-06-09', 'dubey.dipika@gmail.com', 7778883333),
       ('Niti', 'Shrivastava', '2000-09-23', 'matthew.niti@gmail.com', 9090123456),
	   ('Dipti', 'Dubey', '2001-06-09', 'dubey.dipti@gmail.com', 7709883223),
       ('Nitisha', 'Malhotra', '2000-09-23', 'malhotra.niti@gmail.com', 9699123156);

--Insert into Courses
INSERT INTO Courses (course_name, credits, teacher_id)
VALUES ('Introduction to Programming', 3,1),
       ('Database Management Systems', 3, 2),
       ('Web Development', 3, 3),
       ('Discrete Mathematics', 3, 4),
       ('Calculus I', 4, 5),
       ('Physics I', 4, 6),
       ('English Literature', 3, 7),
       ('History of Art', 3, 8),
       ('Psychology 101',3, 9),
       ('Introduction to Economics', 3, 10),
	   ('Hindi Literature',4, 11),
       ('Operating System', 3, 12);

--Insert into Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2024-01-15'),
       (2, 2, '2024-01-20'),
       (3, 3, '2024-01-25'),
       (4, 4, '2024-01-15'),
       (5, 5, '2024-01-20'),
       (6, 6, '2024-02-01'),
       (7, 7, '2024-02-05'),
       (8, 8, '2024-02-10'),
       (9, 9, '2024-02-15'),
       (10,10,'2024-02-20'),
	   (11,11,'2024-02-15'),
       (12,12,'2024-02-20');

-- Insert into Teacher
INSERT INTO Teacher (first_name, last_name, email)
VALUES ('Anshuman', 'Sharma','anshu@school.edu'),
       ('Bhoomi','Naik','bhoomi@school.edu'),
       ('Chandan','Govil','chan@school.edu'),
       ('Deepak', 'Raval','deepak@school.edu'),
       ('Eshita', 'Shukla', 'eshita@school.edu'),
       ('Hari','Dixit','hari@school.edu'),
       ('Chhaya','Purohit', 'chaya@school.edu'),
       ('Pratap','Pathak', 'pratap@school.edu'),
	   ('Chhavi','Barve', 'chavi@school.edu'),
       ('Shaurya','Kaushik','shaurya@school.edu'),
	   ('Swapnil','Dave', 'swapnil@school.edu'),
       ('Sneha','Pandit','snehaa@school.edu');

--Insert into Payments
INSERT INTO Payments (student_id, amount, payment_date)
VALUES
  ( 1, 500.00, '2024-04-20'),  
  ( 2, 200.00, '2024-04-15'),  
  ( 3, 750.00, '2024-04-23'),  
  ( 4, 100.00, '2024-04-10'), 
  ( 5, 450.00, '2024-04-18'),  
  ( 6, 300.00, '2024-04-22'),  
  ( 7, 600.00, '2024-04-19'),  
  ( 8, 150.00, '2024-04-12'), 
  ( 9, 800.00, '2024-04-21'),  
  (10, 250.00, '2024-04-17'),  
  (11, 800.00, '2024-04-11'),  
  (12, 250.00, '2024-04-24');   


  select * from Students
  select * from Courses
  select * from Enrollments
  select * from Payments 
  select * from Teacher

/* Tasks 2: Select, Where, Between, AND, LIKE:
1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890 */

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', 1234567890);

select * from Students 
select * from Enrollments

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
--insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (7, 5, GETDATE());

select * from Enrollments

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.

select * from Teacher
UPDATE Teacher
SET email = 'new_pratap_email@gmail.com'
WHERE teacher_id = 8;

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on the student and course.

DELETE FROM Enrollments
WHERE student_id = 5 AND course_id = 5;

select * from Enrollments
select * from Courses

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables.

UPDATE Courses
SET teacher_id = 7
WHERE course_id = 4;

select*from courses

--6. Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity.

select * from Students
select * from Enrollments
delete from Students where student_id = 11

--Automatically all records removed from Enrollment table because of ON DELETE CASCADE command

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount.

UPDATE Payments
SET amount = 50000
WHERE payment_id = 105;
select * from Payments

                              --Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:

/* 1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student's ID. */

select * from students
select * from Payments

SELECT s.student_id, SUM(p.amount) AS total_payment
FROM Students s
INNER JOIN Payments p     
ON s.student_id = p.student_id
GROUP BY s.student_id
order By s.student_id;

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table. 

SELECT C.course_name, COUNT(DISTINCT E.student_id) AS student_count
FROM Courses C LEFT JOIN Enrollments E
ON C.course_id = E.course_id
GROUP BY C.course_id,C.course_name;

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
--without enrollments.

select CONCAT(s.first_name,' ', s.last_name) as Student_name
from Students s left join Enrollments e
on s.student_id = e.student_id
where e.student_id is null


--4. Write an SQL query to retrieve the first name, last name of students, and the names of the
--courses they are enrolled in. Use JOIN operations between the "Students" table and the
--"Enrollments" and "Courses" tables.
SELECT 
  S.first_name, 
  S.last_name, 
  C.course_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
LEFT JOIN Courses C ON E.course_id = C.course_id;

select * from Enrollments

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the
--"Teacher" table with the "Courses" table.

SELECT 
  CONCAT(T.first_name,' ', T.last_name) as Teacher_name, 
  C.course_name
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
--"Students" table with the "Enrollments" and "Courses" tables.

select CONCAT(S.first_name,' ', S.last_name) as student_name, E.enrollment_date, C.course_name 
from Students S LEFT JOIN Enrollments E on S.student_id = E.student_id
LEFT JOIN Courses C on E.course_id = C.course_id

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
--"Students" table and the "Payments" table and filter for students with NULL payment records.

SELECT CONCAT(S.first_name,' ', S.last_name) as Student_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL
--enrollment records.

select C.course_name
from Courses C left join Enrollments E on C.course_id=E.course_id
where E.enrollment_id is null


--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
--table to find students with multiple enrollment records.
SELECT CONCAT(first_name, ' ',  last_name) AS Student_name
FROM Students
INNER JOIN Enrollments AS Enrollments1 ON Students.student_id = Enrollments1.student_id
INNER JOIN Enrollments AS Enrollments2 ON Students.student_id = Enrollments2.student_id
WHERE Enrollments1.enrollment_id <> Enrollments2.enrollment_id
GROUP BY first_name,last_name
HAVING COUNT(DISTINCT Enrollments1.course_id) > 1;

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
--table and the "Courses" table and filter for teachers with NULL course assignments.

select * from Courses full outer join Teacher on Courses.teacher_id = Teacher.teacher_id
select CONCAT(first_name, ' ', last_name ) AS Teacher_name
from Teacher LEFT JOIN Courses on Teacher.teacher_id=Courses.teacher_id
where course_id is null

                               --Task 4. Subquery and its type:--

/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this. */
select * from Enrollments
 SELECT course_name,
 (
        SELECT AVG(student_count)
        FROM (
            SELECT COUNT(student_id) AS student_count
            FROM Enrollments
            WHERE course_id = Courses.course_id
            GROUP BY course_id
        ) AS subquery
    ) AS avg_students_enrolled
FROM Courses;

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount.
select Students.first_name, Students.last_name, amount,Payments.student_id
from Payments inner join Students on Payments.student_id=Students.student_id
where Payments.amount in (select max(Payments.amount) as Max_Payment
from Payments)

-- alternate solution
select concat(first_name, last_name) as Student_name from Students 
where student_id = (select student_id from Payments where amount = 
(select max(total_amounts) from (select sum(amount) as total_amounts, student_id from Payments group by student_id)as total))


--3. Retrieve a list of Courses with the highest number of Enrollments. Use Subqueries to find the course(s)
--with the maximum enrollment count

--insert into courses 

 SELECT c.course_name, COUNT(e.enrollment_id) AS course_enrollment_count
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(e.enrollment_id) = (
  SELECT MAX(student_count)
  FROM (
    SELECT course_id, COUNT(*) AS student_count
    FROM Enrollments
    GROUP BY course_id
  ) AS subquery
)

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses.

SELECT CONCAT_WS(' ',t.first_name,t.last_name) AS teacher_name, 
       (SELECT SUM(amount)
        FROM Payments AS p2
        WHERE p2.student_id IN (
          SELECT student_id
          FROM Enrollments AS e2
          WHERE e2.course_id IN (
            SELECT course_id
            FROM Courses AS c2
            WHERE c2.teacher_id = t.teacher_id
          )
        )
       ) AS total_payments
FROM Teacher AS t;

-- Using Joins
SELECT CONCAT(t.first_name,' ', t.last_name) as Teacher_name, sum(amount) as total_payment, course_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id 
Left join Enrollments on c.course_id = Enrollments.course_id
LEFT JOIN  Payments on Enrollments.student_id = Payments.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name, course_name

--Alternate solution
select c.course_name, (select sum(amount) from Payments where student_id = e.student_id group by student_id)
from Courses c join Enrollments e on e.course_id = c.course_id

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a
--student's enrollments with the total number of courses.

SELECT student_id, CONCAT(first_name, last_name) as St_name
FROM students s
WHERE (SELECT COUNT(*) FROM enrollments e WHERE e.student_id = s.student_id) = 
(SELECT COUNT(*) FROM courses);


--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
--find teachers with no course assignments.
select * from Courses
   select CONCAT(first_name,' ', last_name) as Teacher_name
   from Teacher where teacher_id not in (select teacher_id 
                              from Courses 
							  where teacher_id is not null)


--7. Calculate the average age of all students. Use subqueries to calculate the age of each student
--based on their date of birth.
select AVG(age_in_years) AS average_age
FROM (
  SELECT student_id, first_name, last_name, DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age_in_years
  FROM Students
) AS student_data;

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
--records.
select c.course_id, c.course_name from Courses c 
where course_id not in(select course_id from Enrollments where Enrollments.course_id = c.course_id)


--9. Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.

SELECT concat(s.first_name,' ',s.last_name) as student_name,course_name, total_payment
FROM Students s
LEFT JOIN (
  SELECT e.student_id, e.course_id, SUM(amount) AS total_payment
  FROM Enrollments e
  LEFT JOIN Payments p ON e.student_id = p.student_id
  GROUP BY e.student_id, e.course_id
) AS course_payments
ON s.student_id = course_payments.student_id
LEFT JOIN Courses c ON course_payments.course_id = c.course_id;

--alternate solution  -- will not give records conatining null
select student_id, course_id,
    (
        select SUM(amount)
        from Payments
        where student_id = Enrollments.student_id
        AND course_id = Enrollments.course_id
    ) AS [Total Payments]
from Enrollments

--10. Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.
select * from Payments
Insert into Payments values(2,600,GETDATE())
SELECT student_id
FROM Students s
WHERE student_id IN (
  SELECT student_id
  FROM Payments
  GROUP BY student_id
  HAVING COUNT(*) > 1
)

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
--student.
SELECT s.student_id, SUM(p.amount) AS total_payment
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id
order by student_id

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
--count enrollments.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

--13. Calculate the average payment amount made by students. Use JOIN operations between the
--"Students" table and the "Payments" table and GROUP BY to calculate the average.
select CONCAT(first_name,' ', last_name) as Student_name, avg(amount) as avg_payment 
from Students
LEFT join 
Payments on Payments.student_id=Students.student_id
Group by first_name,last_name

