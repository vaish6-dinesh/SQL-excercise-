--Data Manupilation Language(DML)

-- Commands
	-- Insert
	-- Select
	-- Update
	-- Delete

-- Delete specific record from the table based on the commands

-- Truncate removes the records without any constaints 

-- Filter clauses

	-- WHERE
	-- GROUP BY
	-- HAVING
	-- ORDER BY

/* Insert Syntax
	SYNTAX:
	INSERT INTO table_name(cname1, cname2,cname3..)
	SELECT value1, value2, value3,…
				OR
	INSERT INTO table_name
	SELECT value1, value2, value3,…
				OR
	INSERT INTO table_name
	SELECT value1, value2, value3,…
	UNION SELECT value1, value2, value3,…
	
	SYNTAX:
	INSERT INTO table_name(cname1, cname2,cname3..)
	VALUES (value1, value2, value3,…)
				OR
	INSERT INTO table_name
	VALUES (value1, value2, value3,…)
				OR
	INSERT INTO table_name
	VALUES (value1, value2, value3,…),
			(value1, value2, value3,…) */
use Vaish

create table customer(
CID varchar(10) primary key,
CNAME varchar(10),
LOCATION varchar(15),
ORDERID int not null,
ORDERDATE date,
PRICEPAID float)

insert into customer
SELECT 'AE2015','AJAY','BANGALORE',125732,'04-06-2016',30500
UNION SELECT 'CQ2097','REENA','HYDERABAD',129463,'01-05-2016',25999
UNION SELECT 'GZ1085','RAKESH','CHENNAI',128314,'12-03-2015',40500
UNION SELECT 'BA1035','RASHID','KOLKATA',126599,'07-25-2015',18200
UNION SELECT 'MQ1284','MEERA','BANGALORE',121281,'02-08-2016',15000
UNION SELECT 'IA1019','GURU','MUMBAI',126433,'03-05-2015',38250

-- SELECT STATEMENT

/* SELECT STATEMENT COMPONENTS

	SYNTAX:
	SELECT         Column_name/Column_list/
    FROM	        Table_name
    ON	      	Join_Condition
    WHERE	        Condition
    GROUP BY     Column_name/Column_list
    HAVING        Sql_expression
    ORDER BY     Column_name/Column_list */

/* PROCESSING ORDER OF SELECT STATEMENT

	1. FROM
	2. ON
	3. JOIN
	4. WHERE
	5.GROUP BY
	6. HAVING
	7. SELECT
	8. DISTINCT
	9. ORDER BY
	10. TOP
 */

--Retrive all records

select * from customer

--Retrive all records which have bangolore location

select * from customer where LOCATION = 'Bangalore'

--Retrive all records for bangalore, chennai and mumbai location

select * from customer where LOCATION in ('Bangalore','Chennai','Mumbai')

--Retrive all records for not in bangalore, chennai and mumbai location

select * from customer where LOCATION not in ('Bangalore','Chennai','Mumbai')

--Retrive all records for price paid is greater than or equal to 20000

select * from customer where PRICEPAID >= 20000

--Retrive all records for price paid is greater than or equal to 15000 and less than or equal to 30000

select * from customer where PRICEPAID >= 15000 and PRICEPAID <= 30000

--Retrive all records for which orderdate lies from 01-jul-2015 to 31-dec-2015

select * from customer where ORDERDATE between '01-jul-2015' and '31-dec-2015'

--Retrive all records for price paid is not equal to 

select * from customer where PRICEPAID <> 15000

--	Patern Matching
--	Retrieve all the records cname

Select * from customer where CNAME like 'R%'

-- cname ends with A

Select * from customer where CNAME like '%A'

-- cname has S

Select * from customer where CNAME like '%S%'

-- cname has e as second character

Select * from customer where CNAME like '_E%'

-- location has A as second last character

Select * from customer where LOCATION like '%A_'

-- location has any character from A-H at starting postion

Select * from customer where LOCATION like '[A-H]%'

-- location does not have any character from A-H at starting postion

Select * from customer where LOCATION like '[^A-H]%'

-- location has any character from P-T at second last postion

Select * from customer where LOCATION like '%[P-T]_'

-- To find the 10% increase in price paid

select PRICEPAID * 1.1 as TEN_PCT from customer

select PRICEPAID,PRICEPAID + 1000 as INC_PRICE from customer

-- To display the unique values without duplicates

select distinct location from customer

-- Order by order date in ascending order

select * from customer order by ORDERDATE

select * from customer order by ORDERDATE desc

-- Order by pricepaid and location

select * from customer order by LOCATION,PRICEPAID

-- display top 3 records from customer

select top 3* from customer

-- display top 2 records who have paid high price

select top 2 pricepaid from customer order by PRICEPAID desc

-- Insterting few more columns

insert into customer(CID, ORDERID)
select 'PP2015', 125793
union select 'GA2017',125765

select * from customer order by LOCATION desc

-- UPDATE STATEMENT

/* UPDATE:
	SYNTAX:
	UPDATE  table_name
	SET         column_name1 = value1,
		           column_name2 = value2,
		           column_name3 = value3,…
	[WHERE    condition]
*/

update customer set LOCATION = 'PUNE', PRICEPAID = 12500

rollback

select * from customer where CID = 'GA2017'

begin transaction

update customer set LOCATION = 'PUNE', PRICEPAID = 12500

select * from customer

-- DELETE STATEMENT
	
/*	SYNTAX:
	DELETE   FROM  table_name
			
				OR

	DELETE  FROM table_name
	WHERE  condition
*/

delete from customer
where ORDERDATE between '01-jul-2015' and '31-dec-2015'

rollback