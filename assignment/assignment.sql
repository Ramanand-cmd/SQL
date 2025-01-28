create database contact_management;
use contact_management;

create table company(
companyId int primary key,
companyName varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10)
);

create table contact(
contactId int primary key,
companyId int,
firstName varchar(45),
lastName varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10),
isMain boolean,
email varchar(45),
phone varchar(12),
foreign key (companyId) references company(companyId)
);

create table contactEmployee(
contactEmployeeId int primary key,
contactId int,
employeeId int,
contactDate date,
description varchar(100),
foreign key (contactId) references contact (contactId),
foreign key (employeeId) references employee (employeeId)
);

create table employee(
employeeId int primary key,
firstName varchar(45),
lastName varchar(45),
salary decimal(10,2),
hireDate date,
jobTitle varchar(25),
email varchar(45),
phone varchar(12)
);


INSERT INTO company VALUES
(1, 'TechCorp', '123 Tech Street', 'New York', 'NY', '10001'),
(2, 'HealthPlus', '456 Health Avenue', 'Boston', 'MA', '02115'),
(3, 'GreenEnergy', '789 Green Blvd', 'San Francisco', 'CA', '94105'),
(4, 'Urban Outfitters, Inc', '101 Edu Lane', 'Austin', 'TX', '73301'),
(5, 'FinSecure', '202 Finance Road', 'Chicago', 'IL', '60601');

-- Insert rows into `contact`
INSERT INTO contact VALUES
(1, 1, 'Alice', 'Johnson', '123 Tech Street', 'New York', 'NY', '10001', TRUE, 'alice.j@techcorp.com', '1234567890'),
(2, 2, 'Bob', 'Smith', '456 Health Avenue', 'Boston', 'MA', '02115', TRUE, 'bob.s@healthplus.com', '0987654321'),
(3, 3, 'Cathy', 'Lee', '789 Green Blvd', 'San Francisco', 'CA', '94105', TRUE, 'cathy.l@greenenergy.com', '1122334455'),
(4, 4, 'David', 'Brown', '101 Edu Lane', 'Austin', 'TX', '73301', FALSE, 'david.b@edulearn.com', '2233445566'),
(5, 5, 'Emma', 'Davis', '202 Finance Road', 'Chicago', 'IL', '60601', FALSE, 'emma.d@finsecure.com', '3344556677');

-- Insert rows into `employee`
INSERT INTO employee VALUES
(1, 'John', 'Doe', 75000.00, '2020-01-15', 'Manager', 'john.d@company.com', '5551234567'),
(2, 'Lesley', 'Bland', 68000.00, '2018-03-22', 'Developer', 'jane.r@company.com', '5559876543'),
(3, 'Sam', 'Hill', 85000.00, '2017-06-10', 'Analyst', 'sam.h@company.com', '5556543210'),
(4, 'Diana', 'Connor', 62000.00, '2021-08-01', 'HR', 'nancy.w@company.com', '5555678901'),
(5, 'Jack', 'Lee', 90000.00, '2019-11-05', 'Director', 'tom.g@company.com', '5553456789');

-- Insert rows into `contactEmployee`
INSERT INTO contactEmployee VALUES
(1, 1, 1, '2023-01-10', 'Meeting to discuss project A'),
(2, 2, 2, '2023-02-15', 'Follow-up call for health initiative'),
(3, 3, 3, '2023-03-20', 'Discussion on renewable energy solutions'),
(4, 4, 4, '2023-04-25', 'HR policy alignment session'),
(5, 5, 5, '2023-05-30', 'Budget review for new financial tools');


/*
In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 
ANS:
UPDATE employee
SET phone = '215-555-8800'
WHERE firstName = 'Lesley' AND lastName = 'Bland';
-------------------------------------------------------------------------------------------------------------------------------------
In the Company table, the statement that changes the name of “Urban
Outfitters, Inc.” to “Urban Outfitters” . 
ANS:
UPDATE company
SET companyName = 'Urban Outfitters'
WHERE companyName = 'Urban Outfitters, Inc.';

------------------------------------------------------------------------------------------------------------------------------------
In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement).
ANS:
DELETE FROM contactEmployee
WHERE contactId = (SELECT contactId FROM contact WHERE firstName = 'Dianne' AND lastName = 'Connor')
  AND employeeId = (SELECT employeeId FROM employee WHERE firstName = 'Jack' AND lastName = 'Lee');
  -------------------------------------------------------------------------------------------------------------------------------------
  Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. 
  
SELECT e.firstName AS EmployeeFirstName, e.lastName AS EmployeeLastName
FROM contactEmployee ce
JOIN contact c ON ce.contactId = c.contactId
JOIN employee e ON ce.employeeId = e.employeeId
JOIN company co ON c.companyId = co.companyId
WHERE co.companyName = 'Toll Brothers';

---------------------------------------------------------------------------------------------------------------
What is the significance of “%” and “_” operators in the LIKE statement? 
Ans:- 
The % and _ operators are used with the LIKE statement in SQL to perform pattern matching on string data. 
These operators allow you to search for patterns in text fields rather than exact matches.

Significance of the % and _ Operators in the LIKE Statement:
1) % (Percent Sign):

Represents zero or more characters in a pattern match.
It can be placed at the beginning, end, or anywhere in the string to match any sequence of characters (including no characters).
Example:
Pattern: LIKE 'A%'
Matches any string that starts with 'A' (e.g., "Apple", "Aardvark", "A").
Pattern: LIKE '%son'
Matches any string that ends with "son" (e.g., "Johnson", "Harrison").
Pattern: LIKE '%a%'
Matches any string that contains the letter 'a' (e.g., "Apple", "Banana", "Pear").
Example Query:
sql
Copy code
SELECT * FROM employees
WHERE lastName LIKE 'S%';  -- Finds all employees with last names starting with 'S'

2)_ (Underscore):

Represents exactly one character in a pattern match.
It is used to match a single character at a specific position in the string.
Example:
Pattern: LIKE 'A__e'
Matches any string that starts with 'A' and ends with 'e', with exactly two characters in between (e.g., "Abe", "Axe").
Pattern: LIKE '____n'
Matches any string with exactly four characters that end with 'n' (e.g., "John", "Ryan").

------------------------------------------------------------------------------------
9) Explain normalization in the context of databases. 
Ans:-
Normalization is the process of organizing the data in a relational database to reduce redundancy and improve data integrity.
 It involves structuring the database in a way that minimizes duplication of data and ensures that relationships between data are logical and consistent.

Why Normalize Data?
Normalization helps:

Reduce Redundancy: Avoids storing duplicate data in the database.
Prevent Data Anomalies: Ensures data modifications (insertions, updates, and deletions) do not result in inconsistencies.
Improve Data Integrity: Maintains consistency and accuracy of data.
Improve Query Performance: Reduces the need for complex joins and helps optimize data access.
Steps of Normalization:
Normalization generally follows a series of stages called normal forms (NF), each building upon the previous one to refine the database structure.

1. First Normal Form (1NF):
A table is in 1NF if:

All columns contain atomic (indivisible) values.
Each column contains only one value per record (no repeating groups or arrays).
Each row is unique, typically identified by a primary key.
Example:
StudentID	Name	Courses
1	John	Math, Science
2	Alice	Math, History
The Courses column has multiple values (e.g., "Math, Science"). To convert this into 1NF, we split each course into a separate row:

StudentID	Name	Course
1	John	Math
1	John	Science
2	Alice	Math
2	Alice	History
2. Second Normal Form (2NF):
A table is in 2NF if:

It is in 1NF.
All non-key columns are fully dependent on the primary key (i.e., no partial dependency exists). This eliminates the possibility of non-key columns depending on only part of a composite primary key.
Example:
Consider a table with a composite key (StudentID, CourseID) and an additional Instructor column:

StudentID	CourseID	Instructor
1	Math	Dr. Smith
1	Science	Dr. Jones
2	Math	Dr. Smith
Here, Instructor depends only on CourseID, not the full composite key (StudentID, CourseID). To resolve this, we break the table into two:

Student Table:

StudentID	Name
1	John
2	Alice
Course Table:

CourseID	Instructor
Math	Dr. Smith
Science	Dr. Jones
Enrollment Table (relates students and courses):

StudentID	CourseID
1	Math
1	Science
2	Math
3. Third Normal Form (3NF):
A table is in 3NF if:

It is in 2NF.
No transitive dependencies exist, meaning non-key columns should not depend on other non-key columns.
Example:
If a table stores student information like this:

StudentID	Name	Department	DepartmentHead
1	John	Math	Dr. Smith
2	Alice	History	Dr. Brown
Here, DepartmentHead depends on Department, not StudentID. This is a transitive dependency. To resolve this, we split the table:

Student Table:

StudentID	Name	Department
1	John	Math
2	Alice	History
Department Table:

Department	DepartmentHead
Math	Dr. Smith
History	Dr. Brown

------------------------------------------------------------------------
10) What does a join in MySQL mean? 
Ans:-
In MySQL, a JOIN is a SQL operation that is used to combine data from two or more tables based on a related column between them. 
It allows you to retrieve data from multiple tables in a single query, which is crucial when you have normalized your database and the data is split across different tables.


Join Type		Description
INNER JOIN -	Returns rows with matching values in both tables.
LEFT JOIN  -		Returns all rows from the left table, with matching rows from the right table (NULL if no match).
RIGHT JOIN - 	Returns all rows from the right table, with matching rows from the left table (NULL if no match).
FULL OUTER - 	JOIN	Returns rows when there is a match in either table (NULL if no match). Not directly supported in MySQL.
CROSS JOIN - 	Returns the Cartesian product of both tables. Every row from the left table is paired with every row from the right table.
SELF JOIN  - 	Joins a table with itself, typically used to compare rows within the same table.

----------------------------------------------------------------------------------
11) 19.What do you understand about DDL, DCL, and DML in MySQL? 
Ans:-
In MySQL, SQL commands are categorized into three main groups based on their functionality: DDL (Data Definition Language), DML (Data Manipulation Language), and DCL (Data Control Language). Each group serves a different purpose when working with databases.

1. DDL (Data Definition Language)
DDL is used to define and manage the structure of database objects.
 It involves creating, altering, and deleting the structures (like tables, indexes, and schemas) that hold the data, but not the data itself.

Common DDL Commands:
CREATE: Defines a new database object (like a table, view, or index).
Example: CREATE TABLE employees (id INT PRIMARY KEY, name VARCHAR(50));
ALTER: Modifies an existing database object (such as adding or removing columns in a table).
Example: ALTER TABLE employees ADD COLUMN salary DECIMAL(10, 2);
DROP: Deletes an existing database object (such as a table, view, or index).
Example: DROP TABLE employees;
TRUNCATE: Deletes all records in a table without removing the table structure.
Example: TRUNCATE TABLE employees;
Purpose:
Define and modify the schema and structure of the database.
Create, alter, or delete tables and other database objects like views and indexes.

2. DML (Data Manipulation Language)
DML is used for manipulating the data stored in database tables. 
These commands interact with the actual data inside the database, allowing you to query, insert, update, and delete records.

Common DML Commands:
SELECT: Retrieves data from one or more tables.
Example: SELECT * FROM employees;
INSERT: Adds new rows to a table.
Example: INSERT INTO employees (id, name, salary) VALUES (1, 'John Doe', 50000);
UPDATE: Modifies existing records in a table.
Example: UPDATE employees SET salary = 55000 WHERE id = 1;
DELETE: Removes rows from a table.
Example: DELETE FROM employees WHERE id = 1;
Purpose:
Query and retrieve data from the database.
Insert new data, update existing data, or delete data from the database.

3. DCL (Data Control Language)
DCL is used to control the access and permissions of the database. It involves granting or revoking privileges to users or roles, ensuring the security and access control of the database.

Common DCL Commands:
GRANT: Provides specific privileges (like SELECT, INSERT, DELETE) to a user or role.
Example: GRANT SELECT, INSERT ON employees TO 'user'@'localhost';
REVOKE: Removes specific privileges from a user or role.
Example: REVOKE SELECT ON employees FROM 'user'@'localhost';

--------------------------------------------------------------------------
12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins?
Ans:
The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column between them. 
This is useful for retrieving data from multiple tables in a single query, 
which is common in relational databases where information is spread across different tables.

Here are the most common types of JOINs:

INNER JOIN:
Returns only the rows that have matching values in both tables.
If there’s no match between the tables, the row is not included in the result.

LEFT JOIN (or LEFT OUTER JOIN):
Returns all rows from the left table, and the matching rows from the right table. 
If there's no match, NULL values are returned for columns from the right table.

RIGHT JOIN (or RIGHT OUTER JOIN):
Similar to the LEFT JOIN, but returns all rows from the right table, and the matching rows from the left table.
 If there's no match, NULL values are returned for columns from the left table.
 
FULL JOIN (or FULL OUTER JOIN):
Returns all rows when there’s a match in one of the tables.
If there’s no match, NULL values are returned for the non-matching side.
MySQL does not natively support FULL JOIN, but you can achieve it using a combination of LEFT JOIN and RIGHT JOIN with a UNION.

CROSS JOIN:
Returns the Cartesian product of the two tables, i.e., every row of the first table is combined with every row of the second table. 
This can result in a large number of rows if both tables are large.

*/









