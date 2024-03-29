----09/13/2023-----
-----DDL - Data Definition Language
--CREATE - Used to create a new database object such as a table, view, index, or procedure
--ALTER - Used to modify an existing database object
--DROP - Used to delete an existing database object
--TRUNCATE - Used to remove all data from a table, but keep the table structure

-----SQL DATATYPES
--INTEGER/ INT 
--FLOAT 
--VARCHAR() 
--CHAR()
--NVARCHAR()
--NCHAR()
--DATE 
--BOOLEAN 


----SQL CONSTRAINTS
--NOT NULL - Ensures that a column cannot have a null value
--PRIMARY KEY - Uniquely identifies each row in a table and cannot have null values.
--FOREIGN KEY - Enforces a link OR relationship between the data in two tables
--UNIQUE - Ensures that all values in a column are distinct
--CHECK - Ensures that the value in a column meets a specific condition
--DEFAULT - Provides a default value for a column when no value is specified 


---HOSPITAL_DB
--CLAIMS
--PROVIDER
--PATIENT
--PAYOR

---SYNTAX
--CREATE DATABASE  DATABASE_NAME;

--CREATING HOSPITAL DATABASE 
CREATE DATABASE HOSPITAL_DB;

USE HOSPITAL_DB;

--- CREATING CLAIMS TABLE
CREATE TABLE CLAIMS
(
CLAIM_NUMBER INTEGER NOT NULL,
PROVIDER_ID VARCHAR(10) NOT NULL,
PATIENT_ID VARCHAR(10) NOT NULL,
PAYOR_ID VARCHAR(10) NOT NULL,
DATE_OF_SERVICE DATE NULL,
D_CODE CHAR(4) NOT NULL,
AMOUNT MONEY NOT NULL
);


--PRIMARY KEY
---PRIMARY KEY IS A UNIQUE IDENTIFIER IN A TABLE

---ADDING PRIMARY KEY TO TABLE
ALTER TABLE CLAIMS
ADD CONSTRAINT PK_CLAIMS_CLAIM_NUMBER PRIMARY KEY(CLAIM_NUMBER);

---- PROVIDER TABLE
CREATE TABLE PROVIDER
(ID VARCHAR(10)NOT NULL,
PROVIDER_NAME VARCHAR(50) NOT NULL
);

--ADDING PRIMARY KEY
ALTER TABLE PROVIDER 
ADD CONSTRAINT PK_PROVIDER_ID PRIMARY KEY(ID);

--- CREATING PATIENT TABLE
CREATE TABLE PATIENT
(
ID VARCHAR(10) NOT NULL,
F_NAME VARCHAR(50) NOT NULL,
L_NAME VARCHAR(50) NOT NULL,
GENDER CHAR(1) NULL,
PHONE CHAR(10) NULL,
CITY VARCHAR(50) NOT NULL,
STATE CHAR(2) NOT NULL
);

--ADDING PRIMARY KEY
ALTER TABLE PATIENT
ADD CONSTRAINT PK_PATIENT_ID PRIMARY KEY(ID);

---PAYOR TABLE
CREATE TABLE PAYOR
(
ID INT IDENTITY(100, 1),
PAYOR_NAME VARCHAR(50) NOT NULL,
);

--ADDING PRIMARY KEY TO PAYOR
ALTER TABLE PAYOR
ADD CONSTRAINT PK_PAYOR_ID PRIMARY KEY(ID);


--FOREIGN KEY
-- A COLUMN OR FIELD IN ONE TABLE THAT REFERS TO THE PRIMARY KEY COLUMN IN 
--ANOTHER TABLE.

-- ADDING FOREIGN KEY CONSTRAINT
--PROVIDER ID FK
ALTER TABLE CLAIMS
ADD CONSTRAINT FK_CLAIMS_PROVIDER_ID FOREIGN KEY(PROVIDER_ID)
REFERENCES PROVIDER(ID);

-- PATIENT ID FK
ALTER TABLE CLAIMS
ADD CONSTRAINT FK_CLAIMS_PATIENT_ID FOREIGN KEY(PATIENT_ID)
REFERENCES PATIENT(ID);

--PAYOR ID FK
ALTER TABLE CLAIMS
ADD CONSTRAINT FK_CLAIMS_PAYOR_ID FOREIGN KEY(PAYOR_ID)
REFERENCES PAYOR(ID);

--MODIFY PAYOR_ID COLUMN IN CLAIMS
ALTER TABLE CLAIMS
ALTER COLUMN PAYOR_ID INT NOT NULL;

--ADDING DOB COLUMN TO PATIENT
ALTER TABLE PATIENT
ADD DOB DATE ;

--MODIFYING COLUMN DATATYPE
ALTER TABLE PATIENT 
ALTER COLUMN DOB DATE NOT NULL;

--REMOVING DOB COLUMN
ALTER TABLE PATIENT
DROP COLUMN DOB;


------09/14/2023------
---CHECK
--CHECK CONSTRAINT VERIFIES THAT ALL VALUES IN A FIELD SATISFY A GIVEN CONDITION.

--ADDING A CHECK CONSTRAINT TO PHONE NUMBER LENGHT
ALTER TABLE PATIENT
ADD CONSTRAINT CK_PATIENT_PHONE CHECK(LEN(PHONE) = 10);

--ADDING SSN TO PATIENT TABLE
ALTER TABLE PATIENT
ADD SSN CHAR(9)NOT NULL ;


-----UNIQUE CONSTRAINT
--UNIQUE ENSURES THAT ALL VALUES IN A COLUMN ARE DISTINCT.
--AND THERE CAN BE MORE THAN ONE DEFINED ON A TABLE

--- ADDING UNIQUE CONSTRAINT TO SSN COLUMN
ALTER TABLE PATIENT
ADD CONSTRAINT UQ_PATIENT_SSN UNIQUE(SSN);

---INDEXES
---INDEXES ARE USED TO RETRIEVE DATA FROM DATABASES MORE QUICK, THEY HELP SPEED UP QUERIES.

----CLUSTERED 
--Whenever you apply clustered indexing in a table, it will perform sorting 
--in that table only. You can create only one clustered index in a table like primary key.
--Clustered index is as same as dictionary where the data is arranged by alphabetical order. 
--If you apply primary key to any column, then automatically it will become clustered index. 

----NONCLUSTERED
--is similar to the index of a book. The index of a book consists of a chapter name and page number, 
--if you want to read any topic or chapter then you can directly go to that page by using index of
-- that book. No need to go through each and every page of a book. 

--ADDING INDEX TO PATIENT TABLE
CREATE CLUSTERED INDEX IDX_PATIENT_PHONE
ON PATIENT(PHONE);
 
CREATE NONCLUSTERED INDEX IDX_PATIENT_PHONE
ON PATIENT(PHONE);

---REMOVING AN INDEX
DROP INDEX IDX_PATIENT_PHONE
ON PATIENT;

DROP INDEX PATIENT.IDX_PATIENT_PHONE;

----DML-- DATA MANIPULATION LANGUAGE---
--INSERT -- POPULATE RECORDS INTO THE TABLE
--UPDATE -- MODIFY AN EXISTING RECORD BASED ON A GIVEN CONDITION
--DELETE -- REMOVE EXISTING RECORDS BASED ON A GIVEN CONDITION..
		-- WHEN NO CONDITION IS SPECIFIED ALL RECORDS ARE REMOVED
--SELECT --RETRIEVE RECORDS FROM TABLES

---INSERT
--SYNTAX
--INSERT INTO TABLE_NAME(COLUMN1, COLUMN2, COLUMN3.....)
--VALUES 
--('VALUE1',  'VALUE2', 'VALUE3'),
--('VALUE1',  'VALUE2', 'VALUE3'),
--('VALUE1',  'VALUE2', 'VALUE3'),
--('VALUE1',  'VALUE2', 'VALUE3');

-- POPULATING PATIENT TABLE
INSERT INTO PATIENT(ID, F_NAME, l_NAME, GENDER, PHONE, CITY, STATE, SSN)
VALUES
('PAT0000001', 'JOHN', 'MURPHY' , 'M', '9132347654', 'BALTIMORE', 'MD', '876290987'),
('PAT0000002', 'JANE', 'DOE' , 'F', '9132222654', 'COLUMBIA', 'MD', '098359864'),
('PAT0000003', 'JAMIE', 'SANCHO' , 'M', '9132347111', 'BALTIMORE', 'MD', '894781234');


INSERT INTO PATIENT(ID, F_NAME, l_NAME, GENDER, PHONE, CITY, STATE, SSN)
VALUES
('PAT0000005', 'JOHN', 'MURPHY' , 'M', '9132340076', 'BALTIMORE', 'MD', '336290987');


INSERT INTO PATIENT(ID, F_NAME, l_NAME,  PHONE, CITY, STATE, SSN)
VALUES
('PAT0000006', 'JOHN', 'MURPHY' , '9132340076', 'BALTIMORE', 'MD', '336290980');

SELECT * FROM PATIENT;

---POPULATING PROVIDER TABLE
INSERT INTO PROVIDER(ID, PROVIDER_NAME)
VALUES
(9873696486, 'JOHN HOPKINS HOSPITAL'),
(9867367123, 'KAISER PERMANENTE'),
(0986749164, 'NATIONWIDE HOSPITAL');

---POPULATING PAYOR TABLE
INSERT INTO PAYOR( PAYOR_NAME)
VALUES
('BLUE CROSS BLUE SHIELD'),
('UNITED HEALTH GROUP');

-- POPULATING CLAIMS TABLE
INSERT INTO CLAIMS( CLAIM_NUMBER, PROVIDER_ID, PAYOR_ID, PATIENT_ID, DATE_OF_SERVICE,
			D_CODE, AMOUNT	)
VALUES
(1007, 9873696486, 100, 'PAT0000001', '09-19-2022', 'GB11', '1,200'),
(1002, 0986749164, 101, 'PAT0000003', '09-19-2022', 'XR11', '200'),
(1009, 9867367123, 100, 'PAT0000002', '09-19-2022', 'DG11', '22,900'),
(1003, 9873696486, 101, 'PAT0000005', '09-19-2022', 'GB01', '1,200');

SELECT * FROM CLAIMS

---UPDATE
--SYNTAX
--UPDATE TABLE_NAME
--SET COLUMNNAME = 'NEW VALUE'
--WHERE <CONDITION GOES HERE>

----MODIFYING JOHN PAT000006 LAST NAME
UPDATE PATIENT
SET L_NAME = 'WILSON'
WHERE ID = 'PAT0000006'

SELECT * FROM PATIENT;


---DELETE ---
--SYNTAX
--DELETE
--FROM TABLE_NAME
--WHERE <CONDITION GOES HERE>

--- REMOVING JOHN PAT000006 FROM PATIENT TABLE
DELETE
FROM PATIENT 
WHERE ID = 'PAT0000006';

--- TRUNCATING PATIENT TABLE
TRUNCATE TABLE PATIENT;

----09/18/2023---
--KEYED IN ORDER
--SELECT
--FROM 
--WHERE
--GROUP BY
--HAVING
--ORDER BY

---LOGICAL QUERY ORDER
---FROM
---WHERE
---GROUP BY
---HAVUNG
---SELECT
---ORDER BY




----AGGREGATE FUNCTIONS---
--- 1, 2, 6, 7
SUM()      
COUNT()
AVG() 
MIN()
MAX()

---F(X) 

SELECT *
FROM HR.EMPLOYEES;

-- FIND OUT THE NUMBER OF EMPLOYEES WE HAVE IN OUR COMPANY.
SELECT COUNT(EMPID) AS NUMBEROFEMPLOYEES
FROM HR.EMPLOYEES;

--RETRIEVE THE TOTAL AMOUNT FOR UNIT PRICES PER CATEGORY.
--FROM HIGHEST UNITPRICE TO LOWEST
SELECT CATEGORYID, SUM(UNITPRICE) AS TOTAL
FROM PRODUCTION.PRODUCTS
GROUP BY CATEGORYID
ORDER BY TOTAL DESC;

--RETRIEVE THE TOTAL AMOUNT FOR UNIT PRICES PER CATEGORY.
--ONLY CATEGORIES WITH TOTALS ABOVE $300
--FROM HIGHEST UNITPRICE TO LOWEST
SELECT CATEGORYID, SUM(UNITPRICE) AS TOTAL
FROM PRODUCTION.PRODUCTS
GROUP BY CATEGORYID
HAVING SUM(UNITPRICE) >= 300
ORDER BY TOTAL DESC;


SELECT * FROM PRODUCTION.PRODUCTS
ORDER BY UNITPRICE DESC;


---WHAT IS  THE MAXIMUM UNIT PRICE ?
SELECT MAX(UNITPRICE) AS MOSTEXPENSIVE
FROM PRODUCTION.PRODUCTS;

---WHAT IS  THE MINIMUM UNIT PRICE ?
SELECT MIN(UNITPRICE) AS LEASTEXPENSIVE
FROM PRODUCTION.PRODUCTS;

--WHAT IS THE AVERAGE UNITPRICE
SELECT AVG(UNITPRICE) AS AVGPRICE
FROM PRODUCTION.PRODUCTS;

---DISTINCT---
SELECT DISTINCT CATEGORYID 
FROM PRODUCTION.PRODUCTS

----SQL OPERATORS---
-->
--<
--=
-->=
--<=
--<> / !=
--AND
--OR
--BETWEEN
--IN 
--NOT IN 
--LIKE
--NOT LIKE

--- RETRIEVE CUSTOMERS AND THE NUMBER OF ORDERS THEY PLACED 
--FROM MARCH 2006 TO FEBRUARY 2007
SELECT CUSTID, COUNT(ORDERID) AS NUMBEROFORDERS
FROM SALES.ORDERS
WHERE ORDERDATE BETWEEN '03-01-2006' AND '02-28-2007'
GROUP BY CUSTID;

SELECT CUSTID, COUNT(ORDERID) AS NUMBEROFORDERS
FROM SALES.ORDERS
WHERE ORDERDATE >= '03-01-2006' AND  ORDERDATE <='02-28-2007'
GROUP BY CUSTID;

--RETIREVE ALL ORDER INFORMATION FOR ORDERS SHIPPED TO THESE COUNTRIES
--FRANCE, GERMANY, BRAZIL, USA, MEXICO, CANADA
SELECT ORDERID, CUSTID, ORDERDATE, FREIGHT, SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY IN ('FRANCE', 'GERMANY', 'BRAZIL', 'USA', 
					'MEXICO', 'CANADA');

SELECT ORDERID, CUSTID, ORDERDATE, FREIGHT, SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY = 'FRANCE'
OR SHIPCOUNTRY = 'GERMANY'
OR SHIPCOUNTRY = 'BRAZIL'
OR SHIPCOUNTRY = 'USA'
OR SHIPCOUNTRY = 'CANADA'
OR SHIPCOUNTRY = 'MEXICO';

--RETIREVE ALL ORDER INFORMATION FOR ORDERS NOT SHIPPED TO THESE COUNTRIES
--FRANCE, GERMANY, BRAZIL, USA, MEXICO, CANADA
SELECT ORDERID, CUSTID, ORDERDATE, FREIGHT, SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY NOT IN ('FRANCE', 'GERMANY', 'BRAZIL', 'USA', 
					'MEXICO', 'CANADA');

----RETRIVE ORDERS NOT SHIPPED TO GERMANY
SELECT ORDERID, CUSTID, ORDERDATE, FREIGHT, SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY <> 'GERMANY'

SELECT ORDERID, CUSTID, ORDERDATE, FREIGHT, SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY != 'GERMANY'

---LIKE
--WILDCARDS (_ . %)

SELECT DISTINCT SHIPCOUNTRY
FROM SALES.ORDERS;

--RETRIEVE ALL SHIPPED COUNTRIS THAT HAVE THE LETTER D IN THEIR SPELLING.
SELECT DISTINCT SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY LIKE '%D%'

--RETRIEVE ALL SHIPPED COUNTRIS THAT HAVE THE LETTER D AT THE END OF THEIR SPELLING.
SELECT DISTINCT SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY LIKE '%D'

--RETRIEVE ALL SHIPPED COUNTRIS THAT HAVE THE LETTER D AT THE START OF THEIR SPELLING.
SELECT DISTINCT SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY LIKE 'D%'

--RETRIEVE ALL SHIPPED COUNTRIS THAT HAVE THE LETTER A IN
--THE THIRD POSITION  OF THEIR SPELLING.
SELECT DISTINCT SHIPCOUNTRY
FROM SALES.ORDERS
WHERE SHIPCOUNTRY LIKE  '__A%'

-----09/19/2023-----
-----STRING FINCTIONS---
--CAST()
--CONCAT()
--LEFT()
--RIGHT()
--SUBSTRING()
--ISNULL()
--COALESCE()
--LTRIM()
--RTRIM()
--LEN()
--CHARINDEX()

--- COMBINE EMPLOYEES TITLE OF COURTESY, FIRSTNAME AND LASTNAME
SELECT CONCAT(TITLEOFCOURTESY ,' ',FIRSTNAME,' ', LASTNAME) AS EMPLOYEE
FROM HR.EMPLOYEES

SELECT TITLEOFCOURTESY +' '+FIRSTNAME + ' '+LASTNAME AS EMPLOYEE
FROM HR.EMPLOYEES

---COMNINE EMPLOYEEID AND EMPLOYEE LASTNAME TO CREATE LOGIN ID
SELECT CONCAT(EMPID, LASTNAME) AS LOGINID
FROM HR.EMPLOYEES;

SELECT CAST(EMPID AS VARCHAR(25) )+ LASTNAME AS LOGINID
FROM HR.EMPLOYEES;

---RETRIRVE FIRST 3 LETTERS OF EMPLOYEES LAST NAME
SELECT LEFT(LASTNAME, 3) AS LNAME, LASTNAME
FROM  HR.EMPLOYEES;

---RETRIRVE LAST 3 LETTERS OF EMPLOYEES LAST NAME
SELECT RIGHT(LASTNAME, 3) AS LNAME, LASTNAME
FROM  HR.EMPLOYEES;

--RETRIEVE 3 CHARACTERS FROM THE 2 POSITION IN EMPLOYEES LASTNAME
SELECT SUBSTRING(LASTNAME, 2, 3) AS LNAME, LASTNAME
FROM HR.EMPLOYEES

----
SELECT CONCAT(LEFT(FIRSTNAME, 2), RIGHT(LASTNAME, 2) , EMPID) 
FROM HR.EMPLOYEES 

-- COUNT THE NUMBER OF CHARACTERS IN EMPLOYEES LAST NAMES
SELECT LEN(LASTNAME) AS NAMELEN, LASTNAME
FROM HR.EMPLOYEES;

--LTRTM()/ RTRIM()
DECLARE @VAL1 VARCHAR(50) = '               JUSTIN'
SELECT LEN(@VAL1), LEN(LTRIM(@VAL1))

DECLARE @VAL1 VARCHAR(50) = 'JUSTIN                   '
SELECT LEN(@VAL1), LEN(RTRIM(@VAL1))

--- REPLACE ALL CUSTOMERS WITH NO FAX PROVIDEDWITH THIER PHONE NUMBER
SELECT CUSTID, COMPANYNAME, CONTACTNAME, FAX, PHONE,
		ISNULL(FAX, PHONE) AS FAXPHONE
FROM SALES.CUSTOMERS

---REPLACE ALL CUSTOMER NULL REGIONS WITH FAX.
--IF FAX IS ALSO NULL THEN REPLAVE WITH PHONE
SELECT CUSTID, COMPANYNAME, CONTACTNAME, REGION, FAX, PHONE,
		COALESCE(REGION, FAX, PHONE) AS FAXPHONE
FROM SALES.CUSTOMERS

---MATH FUNCTIONS--
--ABS()
--ROUND()
--POWER()
--FLOOR()
--CEILING()
--SQRT()

--ABS()
DECLARE @NUM INT = -10
SELECT @NUM AS VAL1, ABS(@NUM) AS VAL2;

--ROUND()
DECLARE @NUM FLOAT = 27.236
SELECT @NUM AS VAL1, ROUND(@NUM, 2) AS VAL2;

--POWER()
SELECT POWER(3,4)

--FLOOR()
DECLARE @NUM FLOAT = 27.936
SELECT @NUM AS VAL1, FLOOR(@NUM) AS VAL2;

--CEILING ()
DECLARE @NUM FLOAT = 27.236
SELECT @NUM AS VAL1, CEILING(@NUM) AS VAL2;

--SQRT
SELECT SQRT(81);

----DATE FUNCTIONS----
---GETDATE()
--DATEDIFF()
--DATEADD()
--DATEPART()
--DATENAME()
--DAY()
--YEAR()
--MONTH()
--CURRENT_TIMESTAMP

--GETDATE()
SELECT GETDATE();

-- CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP

--DATEDIFF()
--HOW MANY DAYS SINCE 9/11
SELECT DATEDIFF(DAY, '09-11-2001', GETDATE()) AS NUMOFDAYS

--HOW MANY MONTHS SINCE 9/11
SELECT DATEDIFF(MONTH, '09-11-2001', GETDATE()) AS NUMOFMONTHS

--HOW MANY YEARS SINCE 9/11
SELECT DATEDIFF(YEAR, '09-11-2001', GETDATE()) AS NUMOFYEARS

--DATEADD()
---WHAT WILL BE THE DATE 7 DAYS FROM TODAY
SELECT DATEADD(DAY, 7, GETDATE());

---WHAT WILL BE THE DATE 7 MONTHS FROM TODAY
SELECT DATEADD(MONTH, 7, GETDATE());

---WHAT WILL BE THE DATE 7 YEARS FROM TODAY
SELECT DATEADD(YEAR, 7, GETDATE());

--DATEPART()
--EXTRACT THE DAY PART FROM TODAYS DATE
SELECT DATEPART(DAY, GETDATE())

--EXTRACT THE MONTH PART FROM TODAYS DATE
SELECT DATEPART(MONTH, GETDATE())

--EXTRACT THE YEAR PART FROM TODAYS DATE
SELECT DATEPART(YEAR, GETDATE())

--DATENAME()
--WHAT IS THE MONTH NAME OF TODAYS DATE
SELECT DATENAME(MONTH, GETDATE())

--WHAT IS THE WEEKDAY NAME OF TODAYS DATE
SELECT DATENAME(WEEKDAY, GETDATE())

--11-30-2000
SELECT FLOOR(DATEDIFF(DAY, '11-30-2000', GETDATE())/ 365.25) AS AGE

----JOIN----
--INNER JOIN / JOIN 
--LEFT OUTER JOIN / LEFT JOIN
--RIGHT OUTER JOIN/ RIGHT JOIN 
--FULL OUTER JOIN/ FULL JOIN
--CROSS JOIN
--SELF JOIN***

--SYNTAX
SELECT COLUMN1, COLUMN2
FROM TABLE1 AS A
JOIN  TABLE2 AS B
ON A.COMMONCOLUMN = B.COMMONCOLUMN
LEFT JOIN TABLE3 AS C
ON A.COMMONCOLUMN = C.COMMONCOLUMN


--Table 1 Query:
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 Query:
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)


---TABLES USED IN JOIN SCENERIOS
--Table 1 Insert:
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male'),
(NULL, 'Joe', 'Hallow', 20, NULL),
(NULL, 'Timmy', 'Toms', NULL, NULL),
(NULL, 'Gigi', 'Buffon', 34, 'Male');


--Table 2 Insert:
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000),
(NULL, NULL, 49000),
(NULL, 'Receptionist', 55000);

----JOIN 

SELECT *
FROM EMPLOYEEDEMOGRAPHICS AS ED
JOIN EMPLOYEESALARY AS ES 
ON ED.EMPLOYEEID = ES.EMPLOYEEID;

SELECT * FROM EMPLOYEEDEMOGRAPHICS 
SELECT * FROM EMPLOYEESALARY 

---LEFT JOIN 
SELECT *
FROM EMPLOYEEDEMOGRAPHICS AS ED
LEFT JOIN EMPLOYEESALARY AS ES 
ON ED.EMPLOYEEID = ES.EMPLOYEEID;

---RIGHT JOIN 
SELECT *
FROM EMPLOYEEDEMOGRAPHICS AS ED
RIGHT JOIN EMPLOYEESALARY AS ES 
ON ED.EMPLOYEEID = ES.EMPLOYEEID;

--FULL JOIN 
SELECT *
FROM EMPLOYEEDEMOGRAPHICS AS ED
FULL JOIN EMPLOYEESALARY AS ES 
ON ED.EMPLOYEEID = ES.EMPLOYEEID;

---JOIN 
---RETRIEVE THE CRDER DETAILS AND THE NAMES OF THE CUSTOMER WHO MADE THAT ORDER.
SELECT SO.ORDERID,  SC.CUSTID,SC.COMPANYNAME, SC.CONTACTNAME,
         SO.EMPID, CAST(SO.ORDERDATE AS DATE) AS ORDERDATE, SO.FREIGHT
FROM SALES.ORDERS AS SO
JOIN SALES.CUSTOMERS AS SC
ON SO.CUSTID = SC.CUSTID

-- RIGHT JOIN
--RETRIEVE ALL CUSTOMERS AND THEIR ORDERS
--INCLUDE CUSTOMERS WITH NO ORDERS PLACED
SELECT SC.CUSTID, SC.COMPANYNAME, SC.CONTACTNAME, SO.ORDERID, SO.ORDERDATE
FROM SALES.ORDERS AS SO
RIGHT JOIN SALES.CUSTOMERS AS SC
ON SO.CUSTID = SC.CUSTID
--WHERE SO.CUSTID IS NULL

-- LEFT JOIN
--RETRIEVE ALL CUSTOMERS AND THEIR ORDERS
--INCLUDE CUSTOMERS WITH NO ORDERS PLACED
SELECT SC.CUSTID,SO.CUSTID, SC.COMPANYNAME, SC.CONTACTNAME
        , SO.ORDERID, SO.ORDERDATE
FROM SALES.CUSTOMERS AS SC  
LEFT JOIN SALES.ORDERS AS SO
ON SO.CUSTID = SC.CUSTID
---WHERE SO.CUSTID IS NULL;

----CROSS JOIN 
--4 SHIFT
--7 DAYS
SELECT D.N AS WEEK_DAY, S.N AS SHIFT
FROM NUMS AS D
CROSS JOIN NUMS S 
WHERE D.N<=7 AND S.N<=4
ORDER BY WEEK_DAY;


SELECT FIRSTNAME, SHIPPERID
FROM HR.EMPLOYEES 
CROSS JOIN SALES.SHIPPERS

-----REIRIEVE AEMPLOYEES AND THE MANAGER THEY REPORT TO.
SELECT CONCAT(E.FIRSTNAME,' ', E.LASTNAME) AS EMPLOYEE ,
        CONCAT(M.FIRSTNAME,' ', M.LASTNAME) AS MANAGER 
FROM  HR.EMPLOYEES AS E 
LEFT JOIN HR.EMPLOYEES AS M
ON E.MGRID = M.EMPID
SELECT * FROM HR.EMPLOYEES


--09/21/2023--
---SET OPERATORS---
--UNION
--UNION ALL
--INTERSECT
--EXCEPT

-----UNION
---RETREIVE ALL CUSTOMER ID PRESENT IN BOTH CUSTOMER AND ORDERS TABLES.
--DO NOT INCLUDE DUPS
SELECT CUSTID    
FROM SALES.CUSTOMERS  --91

UNION  --91

SELECT CUSTID 
FROM SALES.ORDERS --- 830
ORDER BY CUSTID


-----UNION ALL
---RETREIVE ALL CUSTOMER ID PRESENT IN BOTH CUSTOMER AND ORDERS TABLES.
--INCLUDE DUPS
SELECT CUSTID    
FROM SALES.CUSTOMERS  --91

UNION ALL --921

SELECT CUSTID 
FROM SALES.ORDERS --- 830
ORDER BY CUSTID;

--INTERSECT
-----UNION
---RETREIVE THE COMMON CUSTOMER IDS IN CUSTOMER AND ORDERS TABLES.
SELECT CUSTID    
FROM SALES.CUSTOMERS  --91

INTERSECT --- 89

SELECT CUSTID 
FROM SALES.ORDERS --- 830
ORDER BY CUSTID

---EXCEPT
---RETREIVE CUSTID THAT ARE ONLY IN CUSTOMER TABLE BUT NOT IN ORDERS TABLE
SELECT CUSTID    
FROM SALES.CUSTOMERS  --91

EXCEPT --- 2

SELECT CUSTID 
FROM SALES.ORDERS --- 830
ORDER BY CUSTID

---- RETRIVE ORDERS PURCHASED BY A GROUP OF CUSTOMERS
SELECT SC.CUSTID, SC.COMPANYNAME, SC.CONTACTNAME, SO.ORDERDATE, SO.ORDERID
FROM SALES.CUSTOMERS AS SC
JOIN SALES.ORDERS AS SO
ON SC.CUSTID = SO.CUSTID
WHERE SC.CUSTID IN (1,2,3,4,5,6,7,8,9,10)

UNION

SELECT SC.CUSTID, SC.COMPANYNAME, SC.CONTACTNAME, SO.ORDERDATE, SO.ORDERID
FROM SALES.CUSTOMERS AS SC
JOIN SALES.ORDERS AS SO
ON SC.CUSTID = SO.CUSTID
WHERE SC.CUSTID IN (11,12,13,14,15,16,17,18,19,20)

UNION 

SELECT SC.CUSTID, SC.COMPANYNAME, SC.CONTACTNAME, SO.ORDERDATE, SO.ORDERID
FROM SALES.CUSTOMERS AS SC
JOIN SALES.ORDERS AS SO
ON SC.CUSTID = SO.CUSTID
WHERE SC.CUSTID IN (30,31,32,33,34,35,36,37,38,39,40)
ORDER BY SO.ORDERDATE

---CASE EXPRESSION---
--SEARCH CASE
---SIMPLE CASE

--CASE <SPECIFY COLUMN NAME> (IF ITS A SIMPLE CASE EXPRESSION)
       -- WHEN <SPECIFY CONDITIONAL STATEMENT>
       -- THEN < SPECIFY OUTPUT IF CONDITION IS MET>
       -- ELSE< SPECIFY OUTPUT IF CONDITION(S) IS NOT MET>
--END AS  < DERIVED COLUMN_NAME>

--SIMPLE FORM
SELECT   D.N AS DAY_CODE, 
        CASE D.N 
                WHEN 1 THEN 'SUNDAY'
                WHEN 2 THEN 'MONDAY'
                WHEN 3 THEN 'TUESDAY'
                WHEN 4 THEN 'WEDNESDAY'
                WHEN 5 THEN 'THURSDAY'
                WHEN 6 THEN 'FRIDAY'
                ELSE 'SATURDAY'
        END AS WEEK_DAY
        , S.N AS SHIFT_CODE
        ,CASE  S.N 
                WHEN 1 THEN 'MORNING SHIFT'
                WHEN 2 THEN 'AFTERNOON SHIFT'
                WHEN 3 THEN 'EVENING SHIFT'
                ELSE 'OVERNIGH SHIFT'
        END AS SHIFT
FROM NUMS AS D
CROSS JOIN NUMS S 
WHERE D.N<=7 AND S.N<=4
ORDER BY DAY_CODE;


--SEARCH CASE 
---WHEN THE UNITPRICE < 30 THE CATEGORIZE AS LOW
-- WHEN THE UNITPRICE IS BETWEEN 30 AND 75 THEN MEDIUM
--WHEN THE UNITPRICE IS ABOVE 75 THEN CATEGORIZE AS HIGH

SELECT PP.PRODUCTID, PP.PRODUCTNAME, PP.UNITPRICE, SS.COMPANYNAME, SS.CONTACTNAME,
        CASE 
            WHEN PP.UNITPRICE < 30 THEN 'LOW'
            WHEN UNITPRICE < 75 THEN 'MEDIUM'
            WHEN UNITPRICE >= 75 THEN 'HIGH'
            ELSE 'NO UNITPRICE'
        END AS PRICE_CATEGORY
FROM PRODUCTION.PRODUCTS AS PP
JOIN PRODUCTION.SUPPLIERS AS SS 
ON SS.SUPPLIERID = PP.SUPPLIERID;


---- SUBQUERIES----
--RETRIEVE PRODUCTS TWITH THE MAXIMUM UNIT PRICE IN EACH CATEGORY.
----INCLUDE THE PRODUCT DETALS AND THIER DISCONTINUED FLAG
-- IF 0 THEN IN PRODUCTION / IF 1 THEN NOT IN PRODUCTION
SELECT CATEGORYID, PRODUCTNAME, UNITPRICE,
        CASE 
            WHEN DISCONTINUED = 1 THEN 'NOT IN PRODUCTION'
            ELSE 'IN PRODUCTION'
        END AS PRODUCTION_STATUS
FROM PRODUCTION.PRODUCTS AS PP1
WHERE UNITPRICE =(SELECT MAX(UNITPRICE)
                    FROM PRODUCTION.PRODUCTS AS PP2
                    WHERE PP1.CATEGORYID = PP2.CATEGORYID)

--- SELF CONTAINED / INDEPENDENT
---RETRIEVE EMPLOYEES WHO ARE OLDER THAN THE AVERAGE AGE
SELECT EMPID, FIRSTNAME, LASTNAME, BIRTHDATE,
        FLOOR(DATEDIFF(DAY, BIRTHDATE, GETDATE())/ 365.25) AGE
FROM HR.EMPLOYEES
WHERE  FLOOR(DATEDIFF(DAY, BIRTHDATE, GETDATE())/ 365.25) > 
          (SELECT  AVG(FLOOR(DATEDIFF(DAY, BIRTHDATE, GETDATE())/ 365.25))
          FROM HR.EMPLOYEES)

















