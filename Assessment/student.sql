create table student(
std_id int,
std_Name varchar(20),
Sex varchar(6),
Percentage int,
Class int,
Sec varchar(1),
Stream varchar(8),
DOB date
);

insert into student values
(1001,'Surekha Joshi', 'Female', 82, 12, 'A', 'Science','1992-08-03'),
(1002, 'Maahi Agarwal', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-05-11'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'Jahanvi Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-07-11'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-08-03'),
(1008, 'Sahil Saras', 'Male', 56, 11, 'C', 'Commerce', '2008-07-11'),
(1009, 'Akshara Agarwal', 'Female', 72, 12, 'B', 'Commerce', '1996-01-10'),
(1010, 'Stuti Mishra', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'Harsh Agarwal', 'Male', 42, 11, 'C', 'Science', '1998-08-03'),
(1012, 'Nikunj Agarwal', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'Akriti Saxena', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'Tani Rastogi', 'Female', 82, 12, 'A', 'Science', '2008-11-23');

/*To display all the records*/
select * from student;
/*O/P 
std_id	std_Name		Sex		Percentage			Class	Sec  Stream		   DOB
1001	Surekha Joshi	Female		82				12		A	Science		1992-08-03
1002	Maahi Agarwal	Female		56				11		C	Commerce	2008-11-23
1003	Sanam Verma		Male		59				11		C	Commerce	2006-06-29
1004	Ronit Kumar		Male		63				11		C	Commerce	1997-05-11
1005	Dipesh Pulkit	Male		78				11		B	Science		2003-09-14
1006	Jahanvi Puri	Female		60				11		B	Commerce	2008-07-11
1007	Sanam Kumar		Male		23				12		F	Commerce	1998-08-03
1008	Sahil Saras		Male		56				11		C	Commerce	2008-07-11
1009	Akshara Agarwal	Female		72				12		B	Commerce	1996-01-10
1010	Stuti Mishra	Female		39				11		F	Science		2008-11-23
1011	Harsh Agarwal	Male		42				11		C	Science		1998-08-03
1012	Nikunj Agarwal	Male		49				12		C	Commerce	1998-06-28
1013	Akriti Saxena	Female		89				12		A	Science		2008-11-23
1014	Tani Rastogi	Female		82				12		A	Science		2008-11-23 
*/

/*To display any name and date of birth from the table STUDENT*/
select std_Name, DOB from student;
/* 
O/P 
std_Name		    DOB
Surekha Joshi	1992-08-03
Maahi Agarwal	2008-11-23
Sanam Verma		2006-06-29
Ronit Kumar		1997-05-11
Dipesh Pulkit	2003-09-14
Jahanvi Puri	2008-07-11
Sanam Kumar		1998-08-03
Sahil Saras		2008-07-11
Akshara Agarwal	1996-01-10
Stuti Mishra	2008-11-23
Harsh Agarwal	1998-08-03
Nikunj Agarwal	1998-06-28
Akriti Saxena	2008-11-23
Tani Rastogi	2008-11-23
*/

/*To display all students record where percentage is greater of equal to 80 FROM student table*/
select * from student where Percentage >= 80;
/*O/P 
std_id	std_Name		Sex		Percentage	  Class	Sec	 Stream		    DOB
1001	Surekha Joshi	Female	82				12	 A	 Science	1992-08-03
1013	Akriti Saxena	Female	89				12	 A	 Science	2008-11-23
1014	Tani Rastogi	Female	82				12	 A	 Science	2008-11-23 
*/

/*To display student name, stream and percentage where percentage of student is more than 80*/
select std_Name, Stream, Percentage from student where Percentage >= 80;
/*
O/P 
std_Name		Stream  Percentage
Surekha Joshi	Science	  82
Akriti Saxena	Science	  89
Tani Rastogi	Science	  82
*/

/*To display all records of science students whose percentage is more than 75 form student table.*/
select * from student where  Stream = 'Science' and percentage > 75;
/*
O/P 
std_id  std_Name		Sex     Percentage  Class  Sec	Stream    DOB
1001	Surekha Joshi	Female	82			12		A	Science	1992-08-03
1005	Dipesh Pulkit	Male	78			11		B	Science	2003-09-14
1013	Akriti Saxena	Female	89			12		A	Science	2008-11-23
1014	Tani Rastogi	Female	82			12		A	Science	2008-11-23
*/








