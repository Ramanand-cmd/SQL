


-- Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Create the Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    department VARCHAR(50)
);

-- Create the Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create the Grades table
CREATE TABLE Grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES 
('John', 'Doe', '2000-05-15', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', '1999-08-20', 'jane.smith@example.com', '123-555-7890'),
('Alice', 'Johnson', '2001-11-10', 'alice.johnson@example.com', '123-444-7890'),
('Bob', 'Williams', '1998-02-28', 'bob.williams@example.com', '123-333-7890');


INSERT INTO Courses (course_name, department)
VALUES 
('Database Systems', 'Computer Science'),
('Mathematics 101', 'Mathematics'),
('Physics 101', 'Physics'),
('Chemistry 101', 'Chemistry');


INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES 
(1, 1, '2024-09-01'),
(1, 2, '2024-09-01'),
(2, 1, '2024-09-01'),
(3, 3, '2024-09-01'),
(4, 4, '2024-09-01');


INSERT INTO Grades (student_id, course_id, grade)
VALUES 
(1, 1, 'A'),
(1, 2, 'B'),
(2, 1, 'A'),
(3, 3, 'B'),
(4, 4, 'C');


/*Retrieve all students with their details*/
SELECT * FROM Students;
/* it will return all information of the student from students table
e.g. student_name,id,dob,email
*/ 

/*Get all courses enrolled by a student (e.g., student_id = 1)*/
SELECT c.course_name, c.department
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.student_id = 1;
/*it will return course name and department taken by the student having id=1
O/P
course_name			department
Database Systems	Computer Science
Mathematics 101  	Mathematics
*/

/*Retrieve grades for a specific student (e.g., student_id = 1)*/
SELECT c.course_name, g.grade
FROM Courses c
JOIN Grades g ON c.course_id = g.course_id
WHERE g.student_id = 1;
/* it will return course name and grade of student_id=1
O/P 
course_name			grade
Database Systems	 A
Mathematics 101		 B
*/

/*Get the number of students enrolled in each course*/
SELECT c.course_name, COUNT(e.student_id) AS num_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
/* it will the number of students enrolled in each course
O/P 
course_name			num_students
Database Systems		2
Mathematics 101			1
Physics 101				1
Chemistry 101			1

*/

/*Get a list of students who are enrolled in more than one course*/
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS num_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
HAVING COUNT(e.course_id) > 1;
/* it will return the information of students who are enrolled in more than one course
O/P
first_name		last_name		num_courses
John			 Doe			    2
*/

/*Get students who are enrolled in a specific department (e.g., 'Computer Science')*/
SELECT distinct s.first_name, s.last_name, department
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.department = 'Computer Science';
/* it will return the information if students who are enrolled in a computer science department
O/P 
first_name		last_name		department
John			 Doe			 Computer Science
Jane			 Smith			 Computer Science

*/

/*Get all students who have not received an 'A' grade in any course*/
SELECT DISTINCT s.first_name, s.last_name, g.grade
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
WHERE g.grade != 'A';
/* it will returned the information of students who have not received grade A 
O/P 
first_name		last_name		grade	
John			Doe				 B
Alice			Johnson			 B
Bob				Williams		 C
*/

/*Get the list of all students along with their total number of enrolled courses*/
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS total_courses
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id;
/* it will gives the list of all students along with their total number of enrolled courses
O/P 
first_name		last_name		total_courses
John			Doe					2
Jane			Smith				1
Alice			Johnson				1
Bob				Williams			1
*/

/*
INSIGHTS
1)
  -The Students table captures essential student information, like names, email addresses, and phone numbers.
  -The Courses table holds data on courses available across different departments.
  -The Enrollments table is central to understanding which students are enrolled in which courses.
  -The Grades table provides critical insights into student performance, linking students with their grades in individual courses.
  
2)
The enrollment data shows that some students are enrolled in multiple courses, such as John Doe, who is taking both "Database Systems" and 
"Mathematics 101," while others are only enrolled in one course. This can help identify students with heavier course loads.

3)
By joining the Enrollments and Courses tables, you can easily query the courses a specific student is enrolled in, 
providing detailed information about each student’s academic choices. Similarly, by joining the Grades and Courses tables, 
you can get detailed insights into a student's academic performance in each course.

4)
Analyzing the number of students in each course reveals which courses are popular and which have fewer students.
For example, "Database Systems" has two students enrolled, while other courses like "Physics 101" and "Chemistry 101"
have just one student each.

5)
The data shows that John Doe is the only student enrolled in more than one course, suggesting he might have a more diverse academic focus.

6)
The queries reveal that students like John Doe and Jane Smith are enrolled in the Computer Science department, which could help determine
the most engaged students in a particular field.

7)
Through the Grades table, you can quickly identify students who have not received an 'A' grade in any course. 
This insight could guide academic interventions, such as offering extra tutoring etc.

8)
The query that provides a total number of courses each student is enrolled in shows that most students are enrolled in a single course, 
while John Doe is taking two.This insight could indicate that students are taking a lighter course load.
  




