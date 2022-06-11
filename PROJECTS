-----PROJECT 1--------

---creating database
CREATE DATABASE SCHOOL_DB;

---creating student table
CREATE TABLE Student
(Stud_id INT NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(50) NOT NULL,
Instr_id VARCHAR(6) NOT NULL,
Phone VARCHAR(10) NOT NULL,
Gender VARCHAR(1) NOT NULL,
);

---adding pk counstraint
ALTER TABLE Student
ADD CONSTRAINT PK_Stud_id_Student PRIMARY KEY(Stud_id);

---creating instructor table
CREATE TABLE Instructor
(Instr_id VARCHAR(6) NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Course_id VARCHAR(6) NOT NULL,
);

---adding pk counstraint
ALTER TABLE Instructor
ADD CONSTRAINT PK_Instr_id_Instructor PRIMARY KEY(Instr_id);

---creating course table
CREATE TABLE Course
(Course_id VARCHAR(6) NOT NULL,
Course_name VARCHAR(20) NOT NULL,
Course_credit INT NOT NULL,
Class_size INT NULL,
);

---adding pk counstraint
ALTER TABLE Course
ADD CONSTRAINT PK_Course_id_Course PRIMARY KEY(Course_id);

---creating student leadersship table
CREATE TABLE Student_Leadership
(Stud_exec_id INT NOT NULL,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL,
Stud_id INT NOT NULL,
Title VARCHAR(50) NOT NULL
);

---adding pk counstraint
ALTER TABLE Student_Leadership
ADD CONSTRAINT PK_Stud_exec_id_Student_Leadership PRIMARY KEY(Stud_exec_id);

---creating grade table
CREATE TABLE Grade
(Letter_Grade VARCHAR(1) NOT NULL,
Score INT NOT NULL
);

---adding pk counstraint
ALTER TABLE Grade
ADD CONSTRAINT PK_Letter_Grade_Grade PRIMARY KEY(Letter_Grade)

---creating student grade table
CREATE TABLE Student_Grade
(Stud_id INT NOT NULL,
Letter_Grade VARCHAR(1) NOT NULL,
Course_id VARCHAR(6) NOT NULL,
Instr_id VARCHAR(6) NOT NULL,
);

---adding pk counstraint
ALTER TABLE Student_Grade
ADD CONSTRAINT PK_Stud_id_Student_Grade PRIMARY KEY(Stud_id);

--ADDING FOREIGN KEYS
ALTER TABLE instructor
add constraint fk_instructor_course_id foreign key(course_id)
references course(course_id);

alter table student
add constraint fk_student_instr_id foreign key (instr_id)
references instructor (instr_id);

alter table student_leadership
add constraint fk_student_leadership_stud_id foreign key (stud_id)
references student(stud_id);

ALTER TABLE Student_Grade
ADD CONSTRAINT FK_Letter_Grade_Student_Leadership FOREIGN KEY(Letter_Grade)
REFERENCES Grade(Letter_Grade);

ALTER TABLE Student_Grade
ADD CONSTRAINT FK_Course_id_Student_Leadership FOREIGN KEY(Course_id)
REFERENCES Course(Course_id);

ALTER TABLE Student_Grade
ADD CONSTRAINT FK_Instr_id_Student_Leadership FOREIGN KEY(Instr_id)
references instructor(instr_id);

--modifying score column
alter table grade
alter column score varchar(20) not null;

--populating grade table
insert into grade (letter_grade, score)
           values ('A', '90-100'),
                  ('B', '85-89'),
                  ('C', '80-84'),
                  ('D', '70-79'),
                  ('E', '60-69'),
                  ('F', '0-59');

SELECT * FROM GRADE;

--inserting data into the course table
INSERT INTO Course (Course_id, Course_name, Course_credit, Class_size)
            VALUES ('Soc101', 'Fundamentals of Sociology', '3', '30'), 
                   ('Mat102', 'Elementary Calculus', '3', '25'), 
                   ('His304', 'Intermediate US History', '3', '15'),
                   ('Soc401', 'Advanced Sociology', '3', '40'),
                   ('Phi400', 'Advanced Philosophy', '3', '20'); 

-- MODIFYING COURSE NAME DATATYPE LENGTH
alter table course
alter column course_name varchar(50) not null;

select * from course;

--inserting data into Instructor table
INSERT INTO Instructor (Instr_id, First_Name, Last_Name, Course_id) 
                VALUES ('In10001', 'Charles', 'Dzacka', 'Mat102'), 
                       ('In10002', 'Martin', 'Gold', 'Phi400'),
                       ('In10003', 'Venkata', 'Josyam', 'Soc101'),
                       ('In10004', 'Bharath', 'Mandadi', 'His304'),
                       ('In10005', 'Eric', 'Forson', 'Soc401'); 

--modigying instructor id coulmn datatype lenght
alter table instructor
alter column instr_id varchar(7) not null;

alter table student_grade
alter column instr_id varchar(7) not null;

alter table student
alter column instr_id varchar(7) not null;

--removing fk constraints
alter table student_grade
drop FK_Instr_id_Student_Leadership;

alter table student
drop fk_student_instr_id;

select * from instructor;

--insert data into the stdent table
INSERT INTO Student(Stud_id, First_Name, Last_Name, DOB, City, State, Instr_id, Phone, Gender)
            VALUES (1, 'Joseph', 'Ahene', '11/25/1980', 'Baltimore', 'Maryland', 'In10004', '4321053421', 'M'), 
                   (2, 'Precious', 'Owusu', '09/11/1982', 'Columbia', 'Maryland', 'In10003', '4321762243', 'F'), 
                   (3, 'Eni', 'Edo', '01/06/1979', 'Bronx', 'New York', 'In10002', '5011053421', 'F'), 
                   (4, 'Felix', 'Emeka', '12/01/1984', 'Newark', 'New Jersey', 'In10005', '7011762243', 'M'), 
                   (5, 'Mercy', 'Johnson', '04/20/1981', 'Wilmington', 'Delaware', 'In10005', '3011053421', 'F'),
                   (6, 'Lilian', 'Asong', '08/19/1986', 'Owings Mills', 'Maryland', 'In10003', '4321761432', 'F'),
                   (7, 'Prince', 'Williams', '06/04/1989', 'Silver Spring', 'Maryland', 'In10004', '4324432211', 'M'),
                   (8, 'Grace', 'Bonnie', '05/13/1985', 'Knoxville', 'Tennessee', 'In10001', '8651762243', 'F'),
                   (9, 'Leomie', 'Titus', '05/20/1986', 'Nashville', 'Tennessee', 'In10001', '8651053421', 'F'),
                   (10, 'Magic', 'Johnson', '09/01/1978', 'Falls Church', 'Virginia', 'In10002', '7241762243', 'M'), 
                   (11, 'Henry', 'Edwards', '02/12/1983', 'Boston', 'Massachusetts', 'In10002', '9031053421', 'M'), 
                   (12, 'George', 'Phillips', '12/04/1980', 'San Francisco', 'California', 'In10001', '4631762241', 'M'), 
                   (13, 'Frederick', 'Benson', '01/01/1978', 'Wilmington', 'Delaware', 'In10003', '3011222411', 'M'),
                   (14, 'Christy', 'Jones', '10/10/1991', 'Frederick', 'Maryland', 'In10005', '4321764444', 'F'),
                   (15, 'Princess', 'Brown', '06/04/1989', 'Tulsa', 'Oklahoma', 'In10001', '4234432211', 'F'), 
                   (16, 'Hillary', 'Morgan', '11/13/1990', 'Tampa', 'Florida', 'In10001', '6411765432', 'F');

select * from student;

--insert data into the Student_Grade
INSERT INTO Student_Grade (Stud_id, Letter_Grade, Course_id)
                   VALUES (1, 'A', 'Soc401'),
                          (2, 'B', 'Phi400'),
                          (3, 'B', 'His304'),
                          (4, 'A', 'Mat102'),
                          (5, 'C', 'Soc101'),
                          (6, 'D', 'His304'),
                          (7, 'B', 'Phi400'),
                          (8, 'A', 'Mat102'),
                          (9, 'C', 'Soc401'),
			                    (10, 'A', 'Mat102'),
                          (11, 'D', 'His304'),
                          (12, 'F', 'Soc101'), 
                          (13, 'A', 'Mat102'),
                          (14, 'A', 'His304'),
                          (15, 'B', 'Mat102'),
                          (16, 'C', 'His304'); 

--modify student grade instructor id constraint
alter table student_grade
alter column instr_id varchar(7);

select * from student_grade;

 --insert data into the Student_Leadership table 
 INSERT INTO Student_Leadership (Stud_exec_id, Stud_id, Title)                    
					     VALUES (100, 7, 'President' ),
						        (101,  2, 'Vice President'),
						        ('103',  4, 'Secretary'),
						        ('104',  3, 'Treasurer'), 
                    ('105',  11, 'Advisor' ),
                    ('106',  16, 'Organizer');

--modifying student leadership table
alter table student_leadership
alter column first_name varchar(50);

alter table student_leadership
alter column last_name varchar(50);

select * from student_leadership;

INSERT INTO Student(Stud_id, First_Name, Last_Name, DOB, City, State, Instr_id, Phone, Gender)
values
(100, 'Justin', 'Akwetey', '05-17-1990', 'Columbia', 'Maryland', 'In10001', '4437019321', 'M');

select * from student;

--updating student with id 6 last name
update student
set last_name = 'Basong'
where Stud_id = 6;

--removing records from student grade table
truncate table student_grade;

select * from student_grade;


--inserting data into the Student\_Grade table
INSERT INTO Student_Grade (Stud_id, Letter_Grade, Course_id)
                   VALUES (1, 'C', 'Mat102'), 
                          (2, 'A', 'Soc401'),
                          (3, 'F', 'Mat102'),
                          (4, 'D', 'His304'),
                          (5, 'B', 'Soc101'),
                          (6, 'A', 'Mat102'),
                          (7, 'E', 'His304'),
                          (8, 'D', 'Mat102'),
                          (9, 'F', 'Soc401'),
                          (10, 'B', 'Mat102'),
                          (11, 'D', 'His304'),
                          (12,  'C', 'Soc101'), 
                          (13, 'C', 'Mat102'), 
                          (14, 'A', 'His304'),
                          (15, 'A', 'Mat102'),
                          (16, 'D', 'His304');

select * from student_grade;
select * from instructor;

---updating instructor id in student grade leveraging fk constraints
update student_grade
set instr_id = i.instr_id
from student_grade s, instructor i
where s.Course_id = i.course_id;

update student_grade
set instr_id = i.instr_id
from student_grade s
join instructor i
on i.course_id = s.course_id;

================================================================================================================================
================================================================================================================================

-----PROJECT 2-------- USE TSQL2012 DATABASE

--1.Create a report for all employees by specifying the employee id and the 
--last name of all the employees.
select empid, lastname
from hr.Employees;

--2.Generate an employee report specifying the employee id and the last name of 
--all the employees. Please sort the data by the employee id in ascending order
select empid, lastname
from hr.Employees
order by empid asc;

--3. Create a report specifying the country, hiredate and count of all employees 
--aliased as numemployees for hiredate greater than or equal to ‘20030101’ and 
--the count of the employees greater than 1. Please sort your query by country and hiredate.
select country, hiredate, count(empid) numeployees
from hr.Employees
where hiredate >= '20030101'
group by country, hiredate
having count(empid) > 1
order by country, hiredate;

--4. Please fix the query below by remembering or keeping in mind the		
--logical query processing: Please provide explanations of the problem		
--and why you fixed it the way you did.		
--a. 
--Select shipperid, SUM(freight) AS totalfrieght		
--From Sales.Orders		
--Where freight > 20000.00		
--Group by shipperid;		
		
----b. 
--Select shipperid, SUM(freight) AS totalfrieght		
--From Sales.Orders		
--Having SUM(freight) > 20000.00;		

Select shipperid, SUM(freight) AS totalfrieght		
From Sales.Orders	
Group by shipperid
Having SUM(freight) > 20000.00;

--5.Create a report for shippers by specifying the shipper id, company name and 
--phone of all the   shippers.
select shipperid, companyname, phone 
from sales.shippers

--6.Generate a report for shippers by specifying the shipper id, company name and 
--phone of all shippers. Alias the table S and reference the columns in your select statement.
select s.shipperid, s.companyname, s.phone 
from sales.shippers s;

--7.Generate an employee report showing the employee id, first name, last mane, country,
--region and the city of all the employees who livein the ‘WA’ region.
select empid, firstname, lastname, country,region, city
from hr.Employees
where region = 'WA';

--8.Create an employee report showing the employee id, first name, last mane, country, 
--region and the city of all the employees who do not live in the ‘WA’ 
--region or region is null.
select empid, firstname, lastname, country,region, city
from hr.Employees
where region <> 'WA' or region is null;

--9.Create orders report showing the order id, order date, customer id and employee id
--for all orders between ‘20080211’ and ‘20080213’.
select orderid, orderdate, custid, empid
from sales.orders
where orderdate between '20080211' and '20080213'; 

select orderid, orderdate, custid, empid
from sales.orders
where orderdate > '20080211' and  orderdate < '20080213'; 

--10.Generate a report for employees by specifying the employee id, first name, 
--last mane and the city of all the employees who live in a city with ‘a’ in the spelling.
select empid, firstname, lastname, city
from hr.Employees
where city like '%a%';


