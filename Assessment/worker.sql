


create table worker (
worker_id int primary key,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date datetime,
department varchar(10)
);


INSERT INTO worker VALUES 
 (1, 'Monika', 'Arora','100000','2014-02-20 09:00:00', 'HR'),
 (2, 'Niharika','verma','80000','2014-06-11 09:00:00','Admin'),
 (3, 'Vishal', 'Singhal','300000','2014-02-20 09:00:00','HR'),
 (4, 'Amitabh', 'Singh','500000','2014-02-20 09:00:00','Admin'),
 (5, 'Vivek', 'Bhati','300000','2014-06-11 09:00:00','Admin'),
 (6, 'Vipul', 'Diwan','200000','2014-06-11 09:00:00','Account'),
 (7, 'Satish', 'Kumar','75000','2014-01-20 09:00:00','Account'),
 (8, 'Geetika', 'Chauhan','90000','2014-04-11 09:00:00','Admin');

/*Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
Ascending */
 SELECT 
    *
FROM
    worker
ORDER BY first_name;
 /*
 O/P 
 worker_id	first_name  last_name	salary 	joining_date		department
4			Amitabh		Singh		500000	2014-02-20 09:00:00	Admin
8			Geetika		Chauhan		90000	2014-04-11 09:00:00	Admin
1			Monika		Arora		100000	2014-02-20 09:00:00	HR
2			Niharika	verma		80000	2014-06-11 09:00:00	Admin
7			Satish		Kumar		75000	2014-01-20 09:00:00	Account
6			Vipul		Diwan		200000	2014-06-11 09:00:00	Account
3			Vishal		Singhal		300000	2014-02-20 09:00:00	HR
5			Vivek		Bhati		300000	2014-06-11 09:00:00	Admin
*/
 
 /*Write an SQL query to print all Worker details from the Worker table order by department
descending*/ 
 SELECT 
    *
FROM
    worker
ORDER BY department DESC;
 /*
 O/P 
 
 1	Monika	Arora	100000	2014-02-20 09:00:00	HR
3	Vishal	Singhal	300000	2014-02-20 09:00:00	HR
2	Niharika	verma	80000	2014-06-11 09:00:00	Admin
4	Amitabh	Singh	500000	2014-02-20 09:00:00	Admin
5	Vivek	Bhati	300000	2014-06-11 09:00:00	Admin
8	Geetika	Chauhan	90000	2014-04-11 09:00:00	Admin
6	Vipul	Diwan	200000	2014-06-11 09:00:00	Account
7	Satish	Kumar	75000	2014-01-20 09:00:00	Account
*/
 
/* Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
from the Worker table.*/ 
 select * from worker where first_name in ('Vipul', 'Satish');
 /* O/P 
6   Vipul	Diwan	200000	2014-06-11 09:00:00	Account
7	Satish	Kumar	75000	2014-01-20 09:00:00	Account
*/
 
/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
contains six alphabets. */
 select * from worker where length(first_name)=6 and first_name like '%h';
 /*
 O/P 
 7	Satish	Kumar	75000	2014-01-20 09:00:00	Account
*/
 
 
 /*Write an SQL query to show the top 6 records of a table.*/ 
 select * from worker limit 6;
 /*
 O/P 
 1	Monika	Arora	100000	2014-02-20 09:00:00	HR
2	Niharika	verma	80000	2014-06-11 09:00:00	Admin
3	Vishal	Singhal	300000	2014-02-20 09:00:00	HR
4	Amitabh	Singh	500000	2014-02-20 09:00:00	Admin
5	Vivek	Bhati	300000	2014-06-11 09:00:00	Admin
6	Vipul	Diwan	200000	2014-06-11 09:00:00	Account
*/
 
/*Write an SQL query to fetch the departments that have less than five people in them.*/ 
 select department,count(worker_id) from worker group by department having count(worker_id)<5;
 /*
 O/P 
 HR	    2
Admin	4
Account	2
*/
 
/*Write an SQL query to show all departments along with the number of people in there.*/
 select department,count(*) from worker group by department;
 /*
 O/P 
 HR	    2
Admin	4
Account	2
 
 /*Write an SQL query to print the name of employees having the highest salary in each
department.*/ 
 select department,max(salary) from worker group by department;
 /*O/P 
 HR	    300000
Admin	500000
Account	200000
*/
 
 
 
 
 
 
 
 







