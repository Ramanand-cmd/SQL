


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

Key Insights

Purpose:
This query is typically used for exploratory purposes to view the entire structure and data of the Students table.

Result:
The output includes all columns and rows from the Students table. Common columns in a Students table might include:
student_id: A unique identifier for each student (primary key).
first_name: The student's first name.
last_name: The student's last name.
date_of_birth: The student's date of birth.
email: The student's email address.
department: The department or major the student is enrolled in.
enrollment_date: The date the student enrolled in the institution.
status: Current status (e.g., active, graduated, or withdrawn).

Use Cases:
Exploratory Analysis:
Understand the structure and contents of the Students table.
Identify columns available for queries or analyses.
Data Validation:
Check if the table contains expected data without filtering.
Debugging:
Retrieve all data to verify joins, filters, or constraints in related queries.
*/

/*Retrieve all courses along with the number of credits*/
SELECT * FROM Courses;
/* it will returm course_id-name, department from course table

Key Insights

Purpose:
This query is primarily used for exploratory purposes to view all data in the Courses table. 
It helps users understand the structure and contents of the table.

Result:
The output includes all columns and rows from the Courses table. Common columns in such a table might include:
course_id: A unique identifier for each course (primary key).
course_name: The name or title of the course.
department: The department offering the course.
credits: The number of credits the course is worth.
instructor: The name or ID of the instructor teaching the course.
semester: The semester in which the course is offered.
schedule: The timing or days the course is held.

Use Cases:
Exploratory Analysis:
Understand the structure and content of the Courses table, including available columns and data types.
Data Validation:
Check whether the courses data aligns with expectations (e.g., all departments are represented, no missing course_id).
Debugging:
Retrieve full data for troubleshooting queries involving this table.
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

Key Insights

Purpose:
The query is used to find courses and their associated departments for a specific student.

Relationships:
This assumes that there is a many-to-many relationship between students and courses. 
The Enrollments table acts as a bridge table linking students (student_id) and courses (course_id).

Result:
The output will contain two columns:
The name of each course the student is enrolled in (course_name).
The department offering that course (department).

Efficiency:
The query's performance depends on the indexing of student_id and course_id. 
Adding indexes on these columns in the Enrollments and Courses tables can speed up the join and filtering.

Assumptions:
It assumes that student_id = 1 exists in the Enrollments table and that corresponding course_id entries exist in the Courses table.
If there are no enrollments for the student, the query will return an empty result set.

Extensibility:
You can extend the query to include additional details, such as course credits or semester,
 by adding more columns from the Courses or Enrollments tables.

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

Key Insights

Purpose:
The query identifies the courses a specific student has taken and their corresponding grades.

Relationships:
There is a one-to-many relationship between courses and grades, where a course can have grades for multiple students.

Result:
The output will include:
course_name: The name of each course the student has grades for.
grade: The grade received by the student for that course.

Assumptions:
The Grades table includes columns for student_id, course_id, and grade.
The Courses table has corresponding entries for each course_id present in the Grades table.
The student with student_id = 1 exists in the Grades table and has grades recorded.

Efficiency:
The performance can be improved by ensuring indexes are present on the student_id and course_id columns in the Grades table,
 and on the course_id column in the Courses table.
 
Potential Use Cases:
Academic Insights: Helps in analyzing a student’s performance across courses.
Reporting: Can be used to generate grade reports for students.
Advising: Advisors can use this data to suggest areas for improvement or course selection.
*/

/*List all students who received an 'A' grade in any course*/
SELECT s.first_name, s.last_name, c.course_name, g.grade
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
JOIN Courses c ON g.course_id = c.course_id
WHERE g.grade = 'A';
/* it will return information of student who got grade 'A'
O/P 
first_name		last_name		course_name			grade
John			 Doe			 Database Systems	 A
Jane			 Smith			 Database Systems	 A

Key Insights

Purpose:
The query identifies all students who have received an 'A' grade and the courses in which they achieved it.

Relationships:
The query assumes the following relationships:
Students table contains details of students (student_id as a primary key).
Grades table contains student-course-grade mappings (student_id and course_id as foreign keys).
Courses table contains course details (course_id as a primary key).

Result:
The output will consist of:
The student's full name (first_name and last_name).
The course name (course_name).
The grade (grade), which will always be 'A'.

Efficiency:
Performance can be improved by ensuring the following:
Index on grade in the Grades table for quick filtering.
Indexes on student_id and course_id for efficient joins.
This is particularly important for large datasets where the number of students, courses, and grades is significant.

Potential Use Cases:
Performance Tracking: Identify top-performing students in specific courses.
Award Decisions: Generate a list of students eligible for awards or honors based on their grades.
Course Insights: Analyze which courses have the highest number of top-performing students.
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

Key Insights

Purpose:
The query provides a count of students enrolled in each course, ensuring that courses without any enrollments are included in the result.

Result:
The output includes:
course_name: The name of each course.
num_students: The number of students enrolled in the course. If no students are enrolled, this will be 0.

LEFT JOIN Behavior:
Courses with no enrollments will still appear in the result due to the left join, with NULL values in the Enrollments table columns.
The COUNT function will treat these NULL values as 0.
 
Efficiency:
The query's performance can be optimized by:
Indexing course_id in both Courses and Enrollments tables.
Ensuring the Enrollments table has minimal redundant entries (e.g., duplicate student enrollments in the same course).

Use Cases:
Course Management: Identify under-enrolled or empty courses for potential cancellation or targeted marketing.
Student Distribution Analysis: Assess the popularity of courses based on enrollment numbers.
Planning: Allocate resources (e.g., instructors, classrooms) based on enrollment statistics.
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

Key Insights

Purpose:
The query identifies students who are taking multiple courses, providing insight into student participation across courses.

Result:
The output includes:
first_name: The first name of each qualifying student.
last_name: The last name of each qualifying student.
num_courses: The total number of courses the student is enrolled in (only values greater than 1).

Usage of HAVING:
The HAVING clause is used to filter aggregated results. 
This is distinct from the WHERE clause, which filters rows before aggregation.

Efficiency:
To improve performance:
Ensure the student_id and course_id columns are indexed in the Enrollments table.
Index student_id in the Students table.
For very large datasets, query performance can also benefit from proper database normalization and 
denormalized summary tables forfrequent analytics.

Use Cases:
Student Engagement Analysis: Identify students who are highly engaged by enrolling in multiple courses.
Targeted Advising: Focus on multi-course students who might need scheduling or academic support.
Course Demand Analysis: Understand how students distribute their course loads.
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

Key Insights

Purpose:
The query identifies all students enrolled in at least one course from the "Computer Science" department.

Result:
The output includes:
first_name: The first name of each student.
last_name: The last name of each student.
department: The department to which the student belongs (likely from the Students table).

DISTINCT Behavior:
The use of DISTINCT ensures that students appear only once in the results, 
even if they are enrolled in multiple "Computer Science" courses.

Assumptions:
The Students table contains a department column that represents the student’s primary department or major.
There is a valid relationship between students, their enrollments, and the courses they are enrolled in.

Potential Scenarios:
Students with Cross-Department Enrollments: If students from non-Computer Science departments
enroll in Computer Science courses, this query will include them.
Duplicate Names: If two students share the same first and last names but are distinct entities,
 they will both appear in the results since the query uniquely identifies them by the relationships in the JOIN clauses.
 
Efficiency:
Ensure proper indexing on the following:
student_id in Students and Enrollments.
course_id in Enrollments and Courses.
department in Courses (for efficient filtering).

Use Cases:
Cross-Department Analysis: Identify students from various departments engaging with Computer Science courses.
Outreach: Contact students interested in Computer Science for potential recruitment or promotional events.
Enrollment Insights: Determine the popularity of the department among students.
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

Key Insights

Purpose:
The query identifies all students who received grades other than 'A' and provides their names and corresponding grades.

Result:
The output includes:
first_name: The first name of each student.
last_name: The last name of each student.
grade: The grade received by the student (excluding 'A').

DISTINCT Behavior:
The use of DISTINCT ensures that each combination of student name and grade appears only once in the results, 
even if the same student received the same grade in multiple courses.

Assumptions:
The Grades table contains valid grade entries.
Grades other than 'A' are meaningful and properly recorded (e.g., 'B', 'C', 'D', or 'F').

Potential Scenarios:
Students with Multiple Grades: Students may appear multiple times in the results if they received different grades in multiple courses.
 For example, a student with 'B' and 'C' grades will have two separate rows in the output.
Data Integrity: If there are anomalies in the Grades table (e.g., missing or invalid grades), 
these will still appear in the results unless explicitly filtered.

Efficiency:
Ensure indexes on student_id in both the Students and Grades tables to optimize the join operation.
Indexing the grade column in the Grades table can improve the filtering operation.

Use Cases:
Performance Analysis: Identify students who might need additional support by isolating those not achieving the highest grade.
Grade Distribution: Understand how grades other than 'A' are distributed across the student population.
Targeted Interventions: Focus on students who did not excel for academic advising or tutoring programs.
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

Key Insights

Purpose:
The query calculates the total number of courses each student is enrolled in and associates this count with their name.

Result:
The output includes:
first_name: The first name of each student.
last_name: The last name of each student.
total_courses: The total count of courses the student is enrolled in.

Behavior:
Aggregation with COUNT:
The COUNT(e.course_id) function counts non-NULL values in the course_id column for each student.
Grouping:
The GROUP BY clause ensures that the count is calculated separately for each unique student_id.

Usage Scenarios:
Student Engagement Analysis: Identify highly engaged students based on their enrollment counts.
Advising and Support: Detect students with fewer enrollments who might need guidance on increasing their academic load.

Efficiency:
Ensure proper indexing on:
student_id in both the Students and Enrollments tables.
course_id in the Enrollments table for efficient aggregation.
*/




