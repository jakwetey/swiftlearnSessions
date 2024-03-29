--01/19/2022
---DATA DEFINITION LANGUAGE (DDL) COMMAMDS
--CREATE -- create databases/tables/schemas
--ALTER -- modifies an existing table
---DROP -- remove or delete an entire table or constraint
--TRUNCTATE -- removes all records from a table but maintans the structure.

---SYNTAX
--CREATE DATABASE DATABASENAME;

-- CREATING DATABASE COMPANY_DB
CREATE DATABASE COMPANY_DB;

--SYNTAX
--CREATE TABLE TABLENAME
--(
--COLUMN1 DATATYPE CONSTRAINT,
--COLUMN2 DATATYPE CONSTRAINT,
--COLUMN3 DATATYPE CONSTRAINT,
-----
--);

USE COMPANY_DB;

---CREATING EMPLOYEE TABLE
CREATE TABLE EMPLOYEE
(
EMPLOYEE_ID INTEGER NOT NULL,
FIRST_NAME VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
DEPARTMENT_ID INTEGER NULL,
DOB DATE NOT NULL,
GENDER CHAR(1),
PHONE CHAR(10)
);

--PRIMARY KEY IS A UNIQUE IDENTIFIER IN A TABLE

--SYNTAX
--ALTER TABLE TABLENAME
--ADD CONSTRAINT CONSTRAINTNAME PRIMARY KEY(COLUMN);

--- ADDING PK TO EMPLOYEE TABLE
ALTER TABLE EMPLOYEE
ADD CONSTRAINT PK_EMPLOYEE_EMPLOYEE_ID PRIMARY KEY (EMPLOYEE_ID);

-- CREATING DEPARTMENT TABLE
CREATE TABLE DEPARTMENT
(
DEPARTMENT_ID VARCHAR(10) NOT NULL,
DEPARTMENT_NAME VARCHAR(50) NOT NULL,
DEPARTMENT_LOCATION VARCHAR(50) NULL
);

-- ADDING PK TO DEPARTMENT TABLE
ALTER TABLE DEPARTMENT
ADD CONSTRAINT PK_DEPARTMENT_DEPARTMENT_ID PRIMARY KEY (DEPARTMENT_ID);


---01/20/2022
---FOREIGN KEY
--A COLUMN OR FIELD IN ONE TABLE THAT REFERS TO THE PRIMARY KEY COLUMN IN
--ANOTHER TABLE
--ALTER TABLE TABLENAME
--ADD CONSTRAINT CONSTRAINTNAME FOREIGN KEY (FOREIGNCOLUMN)
--REFERENCES PARENTTABLE(COLUMNNAME)

--ADDING FK TO EMPLOYEE TABLE
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_DEPARTMENT_ID FOREIGN KEY(DEPARTMENT_ID)
REFERENCES DEPARTMENT(DEPARTMENT_ID);

--SYNTAX
--ALTER TABLE TABLENAME
--ALTER COLUMN COLUMNNAME DATATYPE CONSTRAINT;

---CHANGING DEPARTMENT_ID DATATYPE
ALTER TABLE EMPLOYEE
ALTER COLUMN DEPARTMENT_ID VARCHAR(10) NULL;

---ADDING SSN COLUMN
ALTER TABLE EMPLOYEE
ADD SSN CHAR(9);

--REMOVING SSN COLUMN
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;

--UNIQUE CONSTRAINT ENSURES THAT ALL VALUES IN A COLUMN ARE DIFFERENT.
--AND THERE CAN BE MORE THAN ONE UNIQUE CONSTRAINT DEFINED ON A TABLE.
ALTER TABLE EMPLOYEE
ADD CONSTRAINT UQ_EMPLOYEE_SSN UNIQUE (SSN);

--DEFAULT COUNSTRAINT WILL AUTOMATICALLY ASSIGN A VALUE IF NO VALUE HAS 
--BEEN SPECIFIED

-- SETTING  DEFAULT VALUE FOR GENDER COLUMN TO (N) IN SCENERIOS WHERE IT 
-- IS NOT PROVIDED.
ALTER TABLE EMPLOYEE
ADD CONSTRAINT DFT_EMPLOYEE_GENDER DEFAULT('N') FOR GENDER;

--CHECK CONSTRAINT VERIFIES THAT ALL VALUES IN A FIELD 
--SATISFY A CONDITION

--ADDING CHECK CONSTRAINT TO VERIFY THAT SSN LEMGHT OF 9 CHARACTERS IS MET.
ALTER TABLE EMPLOYEE
ADD CONSTRAINT CHK_EMPLOYEE_SSN CHECK(LEN(SSN) =9);


CREATE TABLE DEPARTMENT1
(
DEPARTMENT_ID VARCHAR(10) NOT NULL,
DEPARTMENT_NAME VARCHAR(50) NOT NULL,
DEPARTMENT_LOCATION VARCHAR(50) NULL
);

--DROP SYNTAX
--DROP TABLE TABLENAME3

--DELETING/ DROPPING DEPARTMENT1 TABLE
DROP TABLE DEPARTMENT1;

--REMOVING ALL RECORDS FROM DEPARTMENT1 TABLE
TRUNCATE TABLE DEPARTMENT1;

---REMOVING EMPLOYEE_ID COLUMN FROM EMPLOYEE TABLE
ALTER TABLE EMPLOYEE
DROP COLUMN EMPLOYEE_ID;

---REMOVING PK CONSTRAINT FROM EMPLOYEE TABLE
ALTER  TABLE EMPLOYEE
DROP PK_EMPLOYEE_EMPLOYEE_ID;

---ADDING NEW COLUMN TO EMPLOYEE
ALTER TABLE EMPLOYEE
ADD EMPLOYEE_ID INTEGER IDENTITY(100,1);


--INDEXES ARE USED TO RETIEVE DATA FROM DATABASES MORE QUICKLY.
----THEY HELP SPEED UP QUERIES


--- CREATING A UNIQUE NONCLUSTERED INDEX
CREATE  UNIQUE NONCLUSTERED INDEX IDX_EMPLOYEE_PHONE ON EMPLOYEE(PHONE)

---REMOVING INDEX 
DROP INDEX EMPLOYEE.IDX_EMPLOYEE_PHONE;

---RENAME A COLUMN SYNTAX
--EXEC sp_rename 'TABLENAME.OLDCOLUMNNAME','NEWCOLUMNNAME','COLUMN';

---RENAMING DEPARTMENT_NAME IN DEPARTMENT TABLE TO D_NAME
EXEC sp_rename 'DEPARTMENT.DEPARTMENT_NAME','D_NAME','COLUMN';

--INSERT CREATE RECORDS
--UPDATE MODIFIES AN EXISTING RECORD BASED ON A CONDITION
---DELETE REMOVE OR DELETE EXISTING RECORDS (BASED ON A CONDITION)
-- SELECT RETRIEVE RECORDS FROM ONE OR MORE TABLES

---INSERT
--SYNTAX
--INSERT INTO TABLENAME (COLUMN1,COLUMN2,COLUMN3,...)
--VALUES (VALUE1, VALUE2, VALUE3),
--		(VALUE1, VALUE2, VALUE3),
--		(VALUE1, VALUE2, VALUE3);

--POPULATING DEPARTMENT TABLE
INSERT INTO DEPARTMENT (DEPARTMENT_ID,D_NAME, DEPARTMENT_LOCATION)
VALUES  ('000000001' , 'SALES', 'MARYLAND'),
		('000000002' , 'POLICY', 'FLORIDA'),
		('000000003' , 'UNDERWRITTING', 'VIRGINIA'),
		('000000004' , 'CLAIMS', 'TEXAS'),
		('000000005' , 'CUSTOMER', NULL);

--RETRIEVING ALL RECORDS FROM DEPARTMENT TABLE
SELECT * FROM DEPARTMENT

--POPULATING EMPLOYEE TABLE
INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DOB,GENDER,
						PHONE,SSN)
VALUES
('JON', 'SNOW', '000000005', '09-19-1990', 'M', '1234567890', '222333448'),
('JAMES', 'SIMS', '000000001', '09-19-1980', NULL, '1234647890', '229633448'),
('QUEEN', 'STAR', '000000004', '09-19-1890', 'F', '1034567890', '274333448'),
('ZANE', 'SMITH', '000000005', '03-10-1989', 'M', '0034567890', '200333448'),
('AMA', 'AQUAH', '000000005', '09-19-1990', 'F', '1234057890', '211333448');

---POPULATING EMPLOYEE TABLE
INSERT INTO EMPLOYEE (FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DOB,
						PHONE,SSN)
VALUES
('RITA', 'BROWN', '000000005', '09-09-1990',  '1239167890', '209333448');

--RETRIEVING ALL RECORDS FROM EMPLOYEE TABLE
SELECT * FROM EMPLOYEE

--01/24/2022
--UPDATE
SELECT * FROM DEPARTMENT
--SYNTAX
--UPDATE TABLENME
--SET COLUMNNAME = 'NEWVALEU'
--WHERE CONDITION

-- UPDATING CUSTOMER DEPARTMENT LOCATION
UPDATE DEPARTMENT
SET DEPARTMENT_LOCATION = 'NEW YORK'
WHERE DEPARTMENT_ID = '000000005'

--UPDATING LASTNAME FOR EMPLOYEE 109
UPDATE EMPLOYEE
SET LAST_NAME = 'BROWN-JONES'
WHERE EMPLOYEE_ID = 109;

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

ALTER TABLE DEPARTMENT
ADD EMPLOYEE_ID INT;

UPDATE DEPARTMENT
SET EMPLOYEE_ID = EMPLOYEE.EMPLOYEE_ID
FROM DEPARTMENT, EMPLOYEE
WHERE DEPARTMENT.DEPARTMENT_ID = EMPLOYEE.DEPARTMENT_ID

---DELETE 
---SYMTAX
--DELETE 
--FROM TABLENAME
--WHERE CONDITION

--- REMOVING EMPLOYEE 109 RECORD
DELETE 
FROM EMPLOYEE
WHERE EMPLOYEE_ID = 109

SELECT * FROM EMPLOYEE

--REMOVING ALL RECORDS FROM EMPLOYEE TABLE
DELETE 
FROM EMPLOYEE

---REMOVE ALL RECORDS FROM TABLE
TRUNCATE TABLE DEPARTMENT;

ALTER TABLE EMPLOYEE
DROP FK_EMPLOYEE_DEPARTMENT_ID

DROP TABLE DEPARTMENT

--- keyed in order
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY

---SELECT-- retrieve the data -- list of column names, 
		---derived colun name(aggregated or non-aggregated)
--FROM -- specifies the table(s) where the columns are situated
--WHERE -- used to filter the records based on a given condition
		--or non- aggregated columns
--GROUP BY --- introduced when there are one or more aggregate 
			-- and non-aggregate columns in the select list to 
			--group non-aggregate columns.
--HAVING -- Used to filter the records based on a condition on the 
		-- aggregated column
--ORDER BY-- used to order or sort the selcted records
			-- by default its in ascending (ASC) otherwise DESC

--AGGREGATE FUNCTIONS
--SUM()
--AVERAGE()
--COUNT()
--MIN()
--MAX()

--F(X) = 2X + 4
--F(2) = 2.2 + 4 = 8

--- WE WANT FIND THE NU,BER OF EMPLOYEES IN OUR COMPANY
SELECT COUNT(EMPID) AS NUMOFEMPLOYEES
FROM HR.EMPLOYEES;

---WE WANT TO FIND THE HIGHEST UNTPRICE ACROSS ALL PRODUCTS
SELECT MAX(UNITPRICE) AS MAXPRICE
FROM PRODUCTION.PRODUCTS;

---WE WANT TO PULL TOTAL AMOUT FOR UNIT PRICES PER CATEGORY
SELECT CATEGORYID,SUM(UNITPRICE) AS TOTALAMOUNT
FROM PRODUCTION.PRODUCTS
GROUP BY CATEGORYID
ORDER BY  TOTALAMOUNT DESC;

--OTHER SQL COMMANDS AND OPERATIONS
--DISTINCT allows to retrieve non-duplicative records/rows
SELECT DISTINCT CATEGORYID
FROM PRODUCTION.PRODUCTS;

--- SQL OPERATORS
-- AND--- all the conditions must be true
--OR --- at least one conditions must be true
-- Between-- between is used as a serach predicate for a range of 
----		items.it is always used with the AND
--- IN allows to create a set predicate for a set of items
-- LIKE -- allows to perform partern search. 
	-- must always be used with a WILDCARD for a given search


-- WE WANT ORDERS PLACED FROM 04/15/2006 TO 11/20/2006
SELECT ORDERID, CAST(ORDERDATE AS DATE) AS ORDERDATE
FROM SALES.ORDERS
WHERE ORDERDATE BETWEEN '04/15/2006' AND '11/20/2006';

SELECT ORDERID, CAST(ORDERDATE AS DATE) AS ORDERDATE
FROM SALES.ORDERS
WHERE ORDERDATE >='04/15/2006' AND ORDERDATE <= '11/20/2006';

--PULL PRODUCTS THAT UNITPRICE IS LESS THAN $20 OR MORE $50
SELECT PRODUCTNAME, UNITPRICE
FROM PRODUCTION.PRODUCTS 
WHERE UNITPRICE < 20.00 OR UNITPRICE > 50.00
ORDER BY UNITPRICE DESC;

---IN OPERATOR
---PULL PRODUCTS THAT HAVE UNITPRICE IS 18.00, 30.00, 24.00, 40.00, 15.50

SELECT PRODUCTNAME, UNITPRICE 
FROM PRODUCTION.PRODUCTS
WHERE UNITPRICE IN (18.00, 30.00, 24.00, 40.00, 15.50)
ORDER BY UNITPRICE;

SELECT PRODUCTNAME, UNITPRICE 
FROM PRODUCTION.PRODUCTS
WHERE UNITPRICE = 18.00 OR UNITPRICE = 30.00 OR UNITPRICE =24.00
 OR  UNITPRICE =40.00 OR UNITPRICE =15.50
ORDER BY UNITPRICE;

--LIKE OPERATOR
-- WILDCARDS(%, _)
--% REPRESENTS MULTIPLE CHARACTERS
-- _ REPRESENTS A SINGLE CHARACTER

SELECT * FROM PERSON.PERSON

-- PULL ALL PERSONS WHOSE LAST NAME START WITH THE LETTER C
SELECT FIRSTNAME, LASTNAME
FROM PERSON.PERSON
WHERE LASTNAME LIKE 'C%';

--PULL ALL PERSONS WHO HAS THE LETTER A IN THE THIRD POSITION OF 
--THEIR LASTNAME
SELECT FIRSTNAME, LASTNAME
FROM PERSON.PERSON
WHERE LASTNAME LIKE '%I'

---!= / <>
-- PULL PRODUCTS THAT UNITPRICE IS NOT 18.00
SELECT PRODUCTNAME, UNITPRICE 
FROM PRODUCTION.PRODUCTS
WHERE UNITPRICE <> 18.00
ORDER BY UNITPRICE;

--NOT IN 
SELECT PRODUCTNAME, UNITPRICE 
FROM PRODUCTION.PRODUCTS
WHERE UNITPRICE NOT IN (18.00, 30.00, 24.00, 40.00, 15.50)
ORDER BY UNITPRICE;

---STRING FUNCTIONS
--CAST() -- CONVERT A COLUMN DATA TYPE TO A DIFFERNT ONE DURING 
		-- A QUERY ROUTINE
--CONCAT() -- COMBINES THE VALUES IN TWO OR MORE COLUMNS
--LEFT() --- RETRIEVE A PORTION OF A STRING FROM THE LEFT
--RIGHT() -- RETRIEVE A PORTION OF A STRING FROM THE RIGHT
--SUBSTRING() -- RETRIEVES A PORTIION OF A STRING
--ISNULL() -- REPLACES A NULL VALUE WITH ANOTHER VALUE(ONLY TWO EVALUATIONS)
--COALESCE() -- REPLACES A NULL VALUE WITH ANOTHER VALUE
--LTRIM() -- REMOVE AN EMPTY SPACE FROM THE LEADING PORTION OF A STRING
--RTRIM() --REMOVE AN EMPTY SPACE FROM THE TRAILING PROTION OF A STRING

--01/27/2022
--CAST()
DECLARE @number INT =5
DECLARE @name VARCHAR(10) = 'NEWTOWN'

SELECT CAST(@NUMBER AS VARCHAR) + @NAME.

--CONCAT
DECLARE @number INT =5
DECLARE @name VARCHAR(10) = 'NEWTOWN'

SELECT CONCAT(@NUMBER,'  ',@NAME) AS COMBINED

--LEFT()
DECLARE @name VARCHAR(10) = 'NEWTOWN'
SELECT LEFT(@NAME, 3) AS COMBINED

--RIGHT()
DECLARE @name VARCHAR(10) = 'NEWTOWN'
SELECT RIGHT(@NAME,4) AS COMBINED

--SUBSTRING()
DECLARE @name VARCHAR(10) = 'NEWTOWN'
SELECT SUBSTRING(@NAME,3,4) AS SSTRING

--LEN -- RETURNS THE LENGHT OF VALUES IN A SPECIFIC STRING
DECLARE @name VARCHAR(10) = 'NEWTOWN'
SELECT LEN(@NAME) AS LENGHT\

--LTRIM / RTRIM
DECLARE @NUM1 VARCHAR(10) ='   1234567'
DECLARE @NUM2 VARCHAR(10) = '0123456   '
--SELECT LEN(LTRIM(@NUM1)) AS L, LEN(RTRIM(@NUM2)) AS R
SELECT LEN(@NUM1) AS L, LEN(@NUM2) AS R


--ISNULL
---REPLACE ALL TILES THAT HAVE NULL VALUES WITH 'NA'
SELECT FIRSTNAME, LASTNAME,ISNULL(TITLE, 'NA') AS TITLE2, TITLE
FROM PERSON.PERSON

--COALESCE
SELECT  FIRSTNAME, LASTNAME, 
		COALESCE(TITLE,SUFFIX,'NA') AS SSTRING
FROM PERSON.PERSON;

--- DATE FUNCTIONS
--DATEDIFF() -- RETURNS THE DIFFERENCE OR INTERVALS BETWEEN TWO DATES
--DATEADD() -- ADD A PORTION TO A DATE PART
--DATEPART() -- RETRIEVES A PORTION OF A DATE
--DATENAME() -- RETRIEVES THE NAME PART OF A DATE
--GETDATE() -- RETURNS THE CURRENT DATE AND TIME AS PER LOCAL SYSTEM
--YEAR() -- RETURNS YEAR PORTION OF A DATE
--MONTH() -- RETURNS THE MONTH PORTION OF A DATE
--DAY() -- RETURNS THE DAY PORTIION OF A DATE

--GETDATE()
SELECT GETDATE() AS CURENTDATE

-- DATEDIFF()
--HOW MANY DAYS SINCE 9/11
SELECT DATEDIFF(DAY, '09/11/2001', GETDATE()) AS NUMBEROFDAYS

--HOW MANY MONTHS SINCE 9/11
SELECT DATEDIFF(MONTH, '09/11/2001', GETDATE()) AS NUMBEROFMONTHS

--HOW MANY MONTHS SINCE 9/11
SELECT DATEDIFF(YEAR, '09/11/2001', GETDATE()) AS NUMBEROFYEARS

--DATEADD()
--WHAT THE DATE WILL BE IN 6 YEARS
SELECT DATEADD(YEAR, 6, GETDATE());

--WHAT THE DATE WILL BE IN 6 DAYS
SELECT DATEADD(DAY, 6, GETDATE());

---DATEPART()
SELECT DATEPART(WEEKDAY, GETDATE());

-- DATENAME()
SELECT DATENAME(WEEKDAY, GETDATE());

SELECT DATENAME(WEEKDAY, '05/17/1997');

--CALCULATE SOMEONES AGE (ROUGH ESTIMATE)
SELECT DATEDIFF(YEAR, '05/17/1997', GETDATE())

--CALCULATE SOMEONES AGE (EXACT AGE)
SELECT FLOOR((DATEDIFF(DAY, '05/17/1997', GETDATE()))/ 365.25) AS AGE

---MATH FUNCTIONS
--ABS()  -- RETURENS THE ABSOLUTE VALUE
--FLOOR() -- RETURNS THE LARGEST INTEGER THAT IS <= A GIVEN DECIMAL VALUE
--CEILING()-- RETURNS THE SMALLEST INTEGER THAT IS >= A GIVEN DECIMAL VALUE
-- ROUND() -- ROUND TO THE NEAREST WHOLE NUMBER
--SIGN() -- USED TO INDICATE THE SIGN OF A GIVEN VALUE
-- POWER() -- FIND THE POER OF A GIVEN NUMBER
-- SQRT() -- FIND THE SQURE ROOT OF A GIVEN NUMBER

--ABS()
DECLARE @NUMBER INT = -7
SELECT @NUMBER AS VAL1, ABS(@NUMBER) AS ABSVAL

-- SIGN 
DECLARE @NUMBER INT = 7
SELECT SIGN(@NUMBER) AS SIGNNUM

--FLOOR
DECLARE @NUMBER FLOAT = 5.87597
SELECT FLOOR(@NUMBER) AS FLOORNUM

--CEILING
DECLARE @NUMBER FLOAT = 5.2132
SELECT CEILING(@NUMBER) AS FLOORNUM

-- ROUND
DECLARE @NUMBER FLOAT = 5.2752
SELECT ROUND(@NUMBER,1) 

--POWER
SELECT POWER(5,3)

--SQRT
SELECT ROUND(SQRT(80), 1);
SELECT SQRT(80);

SELECT * FROM HR.EMPLOYEES


---02/01/2022

-- JOINS
--INNER JOIN/ JOIN 
------retrieves matching records from the left and the right table
--LEFT JOIN/ LEFT OUTER JOIN 
------retrieves all records from the left table and matching 
-----records from the right table
--RIGHT JOIN/ RIGHT OUTER JOIN
------retrieves all records from the right table and matching 
-----records from the left table
---FULL JOIN/ FULL OUTER JOIN
----- retrieves all records from both left and right tables.
-----SELF JOIN 
-----conceptual join that allows to join a table to itself like its another table leveraging aliases.
---- CROSS JOIN 
---- cartesian join. which multiplies x amount of rows in the left to y 
---- amount of rows in the right table.

-- SYNTAX
--SELECT A.column1, B.coulmn2,...
--FROM table1 AS A
--JOIN table2 AS B
--ON A.commomcolumn = B.commoncolumn

--INNER JOIN
-- retrieve information of employees born in or after 1990
SELECT P.[FirstName],P.[LastName],E.[BirthDate]
FROM [HumanResources].[Employee] AS E
INNER JOIN [Person].[Person] AS P
ON E.[BusinessEntityID] = P.[BusinessEntityID]
WHERE DATEPART(YEAR, E.[BirthDate]) >= '1990'
ORDER BY E.[BirthDate];

--LEFT JOIN
---retrieve all firstnames in persons table and what is common from employees
SELECT P.[FirstName]
FROM [Person].[Person] AS P
LEFT JOIN [HumanResources].[Employee] AS E
ON E.[BusinessEntityID] = P.[BusinessEntityID];

--RIGHT JOIN
SELECT P.[FirstName]
FROM [Person].[Person] AS P
RIGHT JOIN [HumanResources].[Employee] AS E
ON E.[BusinessEntityID] = P.[BusinessEntityID];

-- PULL EMPLOYEES BORN IN OR AFTER 1990 AND THEIR DEPARTMENTS
SELECT P.[FirstName],P.[LastName],E.[BirthDate],D.[Name]
FROM [Person].[Person] AS P
JOIN [HumanResources].[Employee] AS E
ON E.[BusinessEntityID] = P.[BusinessEntityID]
JOIN [HumanResources].[EmployeeDepartmentHistory] AS DH
ON E.[BusinessEntityID] = DH.[BusinessEntityID]
JOIN [HumanResources].[Department] AS D
ON D.[DepartmentID] = DH.[DepartmentID]
WHERE  E.[BirthDate] > '12-31-1989'

--SELF JOIN
-- PULL EMPLOYEES AND THEIR MANAGERS
SELECT CONCAT(E.FIRSTNAME,' ', E.LASTNAME) AS EMPLOYEE,
		CONCAT(M.FIRSTNAME,' ', M.LASTNAME) AS MANAGER
FROM HR.EMPLOYEES AS E
LEFT JOIN HR.EMPLOYEES AS M
ON E.MGRID = M.EMPID

--CROSS JOIN 
--DEVELOP TIMETABLE WITH 7 WORK DAYS AND 3 SHIFTS
SELECT D.N AS DAY, S.N AS SHIFT
FROM NUMS D
CROSS JOIN NUMS AS S
WHERE D.N <=7 AND S.N <= 3
ORDER BY DAY

-- SET OPERATORS
--UNION 
---used to combine the result set of 2 or more select statements 
---without duplicates

--UNION ALL
--used to combine the result set of 2 or more select statements 
---with duplicates

--INTERSECT
--combines only rows or records of 2  select statements that 
--exists in both tables and is distinct

--EXCEPT
--used to perform set difference; so it will return rows/ records that
--are in the first result data set but not in the second result data set

-----TAKE AWAYS
--the number of selected columns must be the same
--their data types must be the same

-- UNION
-- PULL FRSTNAMES THAT ARE BOTH EMPLOYEES AND CUSTOMERS WITHOUT DUPLICATES
SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN HUMANRESOURCES.EMPLOYEE AS E
ON E.BUSINESSENTITYID = P.BUSINESSENTITYID

UNION  ---936

SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN SALES.CUSTOMER AS C
ON C.PERSONID = P.BUSINESSENTITYID

-- UNION ALL
-- PULL FRSTNAMES THAT ARE BOTH EMPLOYEES AND CUSTOMERS WITH DUPLICATES
SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN HUMANRESOURCES.EMPLOYEE AS E
ON E.BUSINESSENTITYID = P.BUSINESSENTITYID

UNION ALL -- 19409

SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN SALES.CUSTOMER AS C
ON C.PERSONID = P.BUSINESSENTITYID

--INTERSECT
--PULL ONLY FIRSTNAMES THAT ARE COMMON AMONG CUSTOMERS AND EMPLOYEES
SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN HUMANRESOURCES.EMPLOYEE AS E
ON E.BUSINESSENTITYID = P.BUSINESSENTITYID

INTERSECT  -- 159

SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN SALES.CUSTOMER AS C
ON C.PERSONID = P.BUSINESSENTITYID

--EXCEPT 
-- PULL FIRSTNAMES THAT ARE ONLY EMPLOYEES AND NOT CUSTOMERS
SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN HUMANRESOURCES.EMPLOYEE AS E
ON E.BUSINESSENTITYID = P.BUSINESSENTITYID

EXCEPT  --65

SELECT P.FIRSTNAME
FROM PERSON.PERSON AS P
JOIN SALES.CUSTOMER AS C
ON C.PERSONID = P.BUSINESSENTITYID


--CASE STATEMENT
-- CASE <SPECIFY COLUMN NAME(IF IT IS A SIMPLE CASE EXPRESSION)>
--	WHEN <SPECIFY THE CONDITIONAL STATEMENT>
--	THEN <SPECIFY OUTCOME IF CONDITION AT WHEN IS MET>
-- ELSE <SPECIFY OUTCOME IF CONDITIN(S) ARE NOT MET>
--END AS < DERIVED COLUMN NAME>

--TYPES
--SIMPLE CASE EXPRESSION
--SEARCH CASE EXPRESSION

-- SIMPLE CASE EXPRESSION
-- SC = Store Contact, 
--IN = Individual (retail) customer, SP = Sales person, 
--EM = Employee (non-sales), VC = Vendor contact, GC = General contact
-- RETRIEVE PERSON FIRST AND LAST NAME AND FULL DEFINTION FOR 
-- THEIR PERSON TYPE
SELECT FIRSTNAME, LASTNAME,PERSONTYPE,
	CASE PERSONTYPE
		WHEN 'SC' THEN 'STORE CONTACT'
		WHEN 'IN' THEN 'INDIVIDUAL CUSTOMER'
		WHEN 'EM' THEN 'EMPLOYEE'
		WHEN 'SP' THEN 'SALES PERSON'
		WHEN 'VC' THEN 'VENDOR CONTACT'
		ELSE 'GENERAL CONTACT'
	END AS PERSONTYPEDESCRIPTION
FROM PERSON.PERSON.

--SEARCH CASE EXPRESSION
--CATEGORIZE OUR PRODUCTS BY THEIR UNITPRICE
-- IF UNIOTPRICE LESS THAN 20 THEN LOW CATEGORY
--IF UNITPRICE IS LESS 40 THEN MEDIUM CATEGORY
--IF UNITPRICE IS MORE THAN 40 THEN HIGH
SELECT PRODUCTNAME, UNITPRICE,
		CASE 
			WHEN UNITPRICE < 20 THEN 'LOW'
			WHEN UNITPRICE < 40 THEN 'MEDIUM'
			ELSE 'HIGH'
		END AS PRICECATEGORY
FROM PRODUCTION.PRODUCTS;


---Subquery
--syntax
Select column(s)
From Tablename
Where column operator(Exists, = <> or =!, >) (Select column 
                                              From Tablename)
Having agg_column operator(Exists, = <> or =!, >) (Select column 
                                              From Tablename)

---Example;
Select * From Production.Products;

----Retrieve the product info for the product with the max unitprice;
--Self-contained/indepedent subquery;
---incorrect attempt by the novice;
Select productid, productname, supplierid, categoryid,
       sum(unitprice) as maxunitprice, discontinued
From Production.Products
Group by productid, productname, supplierid, categoryid,discontinued
Order by maxunitprice Desc;

--right attempt
Select productid, productname, supplierid, categoryid,
       unitprice as maxunitprice, discontinued
From Production.Products
Where unitprice = (Select max(unitprice)
                   From Production.Products)

---correlated subquery;
----Retrieve the product info for the product with the max unitprice
---within each category of product;

---to see the actual data for the categories
Select productid, productname, supplierid, categoryid,
       unitprice, discontinued
From Production.Products
Order by 4,5 

---right approach;
Select productid, productname, supplierid, categoryid,
       unitprice as maxunitprice, discontinued
From Production.Products as a
Where unitprice = (Select max(unitprice)
                   From Production.Products as b
				   Where a.categoryid = b.categoryid)
Order by 4;

----Retrieve the product info for the product with the 4th max unitprice
---within each category of product;
Select productid, productname, supplierid, categoryid,
       unitprice as maxunitprice, discontinued
From Production.Products as a
Where unitprice = (Select max(unitprice)
                   From Production.Products as b
				   Where a.categoryid = b.categoryid)
Order by 5 Desc

----Table Expressions
--Types;
--1. Derived table;
--2. Common table expression (CTE);
--3. Views;
--4. Inline table-valued function

---Derived table;
--Select column(s)
--From (Select column(s)
--      From Table(s) ) T

---Windowing functions/analytic function
--Types
--1. Rank() ---skips the ranking order when there is/are ties over a partition.
--2. Dense_Rank() ---orders sequentially even when there is/are ties over a partition.
--3. Row_Number() ---gives a sequential row numbering over a partition
--4. Ntile() ---gives the percentile over a partition

---Example:
--colum Rank() Dense_Rank() Row_Number() 
   20    1         1           1
   23    2         2           2
   24    3         3           3
   24    3         3           4
   24    3         3           5
   25    6         4           6
   25    6         4           7 
   26    8         5           8

--Problem of evening;
----Retrieve the product info for the product with the 4th max unitprice
---within each category of product;
Select productid, productname, supplierid, categoryid,
       max4thunitprice, discontinued
From (Select productid, productname, supplierid, categoryid,
       unitprice as max4thunitprice, discontinued, 
	   Dense_Rank() OVER (Partition by categoryid order by unitprice desc) as ranked
      From Production.Products) AS T
Where ranked = 4;

---CTE;
---Syntax;
--WITH ctename
--AS
--(Select statement),
 --ctename1
-- AS
--  (Select statement1)
--Select from ctename
 -- Join ctename1

 ----Retrieve the product info for the product with the 5th and 6th max unitprice
---within each category of product;

WITH maxitems
AS
(Select productid, productname, supplierid, categoryid,
       unitprice as max4thunitprice, discontinued, 
	   Dense_Rank() OVER (Partition by categoryid order by unitprice desc) as ranked
      From Production.Products)
Select productid, productname, supplierid, categoryid,
       max4thunitprice, discontinued
From maxitems
Where ranked IN (5,6)

---create a report to pull product for product that has the same sell date as the end date;
---productid, Name, productnumber of selldate product, productid, Name, productnumber 
---of enddate product;
WITH sellstartdate
AS
(Select productid, Name, productnumber, sellstartdate
 From AdventureWorks.Production.Product),
sellenddate
AS
 (Select productid, Name, productnumber, sellenddate
 From AdventureWorks.Production.Product)
Select a.productid as startprodid, a.Name as startname, a.productnumber as startprodnumbder
       ,a.sellstartdate, b.productid as endprodid, b.Name as endname, 
	    b.productnumber as endprodnumber, b.sellenddate
From sellstartdate as a
Join sellenddate as b
on a.SellStartDate =b.SellEndDate;

---View
---Syntax
---CREATE view viewname
---AS
---Select statement
----Create a reuseable report view that will produce productid, productname,
----productnumber together with the product categoryid, category name and 
----the modified date on the category;

CREATE View vw_ProdCategory
AS
Select a.[ProductID],a.[Name] as prodname,a.[ProductNumber],
       b.[ProductCategoryID],b.[Name] as categoryname,b.[ModifiedDate]
From [Production].[Product] As a
Join [Production].[ProductSubcategory] as s
 ON a.[ProductSubcategoryID] = s.ProductSubcategoryID
Join [Production].[ProductCategory] As b
 ON s.ProductCategoryID = b.ProductCategoryID

 Select * from vw_ProdCategory
 Where categoryname = 'Components';

---Inline table valued function.
---scalar function
---Stored procedure
---IF ELSE construct
---WHILE loop
---Cursors

---Inline table-valued function
--CREATE function fncname(@name)
-- RETURNS TABLE
--  AS
--    RETURN
--	 (sql statement)

CREATE function fn_ProdCategory(@categoryname NVARCHAR(20))
 RETURNS TABLE
  AS
   RETURN
     Select a.[ProductID],a.[Name] as prodname,a.[ProductNumber],
       b.[ProductCategoryID],b.[Name] as categoryname,b.[ModifiedDate]
      From [Production].[Product] As a
      Join [Production].[ProductSubcategory] as s
      ON a.[ProductSubcategoryID] = s.ProductSubcategoryID
      Join [Production].[ProductCategory] As b
      ON s.ProductCategoryID = b.ProductCategoryID
	  WHERE b.Name = @categoryname

	 
	 Select * from dbo.fn_ProdCategory('accessories')

Select * from [Production].[Product]

Select [ProductID],
       [Name],
       [ProductNumber],
       [MakeFlag],
       [StandardCost],
       [ListPrice],
       [ListPrice] - [StandardCost] as Profit
From [Production].[Product]

---User-Defined Scalar function
--Syntax
--CREATE FUNCTION fncname(@parametername datatype)
-- RETURNS Datatype
--  AS
--   BEGIN
--     RETURN (logic/statement)
--   END 

 CREATE FUNCTION Profit(@Listprice FLOAT, @cost FLOAT)
  RETURNS FLOAT
   AS
    BEGIN
	   RETURN (@Listprice - @cost)
	END

Select [ProductID],
       [Name],
       [ProductNumber],
       [MakeFlag],
       [StandardCost],
       [ListPrice],
      [dbo].[Profit](60,40) as Profit
From [Production].[Product]

----Stored Procedure

--cache

---Syntax
--CREATE Procedure procname (@parameter datatype --optional)
-- AS
--  BEGIN
--   Statement(s)
--  END

CREATE Procedure sp_Productlist
AS 
 BEGIN
  SELECT Name as productName,
       Listprice
  From Production.Product
  Order by 1
 END

---calling proc
EXEC sp_Productlist

---Modifying Proc to accept input parameter;
ALTER Proc sp_Productlist (@minprice FLOAT)
 AS
  BEGIN
   SELECT Name as productName,
       Listprice
  From Production.Product
  WHERE Listprice >= @minprice
  Order by 1
  END

  EXEC sp_Productlist 3000

  ---Modifying Proc to accept multiple input parameter;
ALTER Proc sp_Productlist (@minprice FLOAT, @maxprice FLOAT)
 AS
  BEGIN
   SELECT Name as productName,
       Listprice
  From Production.Product
  WHERE Listprice between @minprice and @maxprice
  Order by 1
  END

EXEC sp_Productlist 2000,3200
