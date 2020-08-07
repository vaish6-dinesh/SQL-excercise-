use Vaish

-- 1. Create Scty_Tran table

create table Scty_Tran(
Scty_code Varchar(10) Not Null,
Tran_id Varchar(10) Not Null,
Trade_date Date Not Null,
Broker Varchar(15),
Entry_date Date Not Null)

-- 2. Insert 10 Records in Security, Scty_Price and Scty_Tran Tables.

insert into Security
select 'ICIC201','ICICI','ICICI Bank','MA304IC',247382,'Mumbai','04-25-1989'
union select 'HDFC305','HDFC','HDFC Bank','K0102HD',543917,'kolkata','06-07-1991'
union select 'HUL109','HUL','HUL Ltd','k0197HL',189732,'kolkata','01-01-1995'
union select 'Ran208','Ranbaxy','Ranbaxy Ltd','HY249Ra',547892,'Hyderabad','07-25-1999'
union select 'HCL205','HCL','HCL Tech Ltd','DL203HC',184732,'Delhi','08-10-1999'
union select 'Inf409','Infosys','Infosys Ltd','PU305IF',187934,'Pune','02-15-1981'
union select 'TCS103','TCS','Tcs Ltd','MU108TC',198463,'Mumbai','09-13-2001'
union select 'Mar408','Marico','Marico Ltd','k0103Ma',154788,'kolkata','04-15-1988'
union select 'Inc501','Cements','India cements Ltd','ch503Ic',189742,'chennai','06-18-1995'
union select 'WIP309','WIPRO','Wipro Tech Ltd','BA209WP',154386,'Bangalore','06-19-1987'

insert into SCTY_PRICE
select 'Mar408','07-05-2009',1257.39,'PKR',0.7	
union select 'HDFC305','07-15-2013',1187.15,'INR',1		
union select 'HUL109','03-23-2013',20,'USD',100		
union select 'ICIC201','06-24-2012',50,'GBP',150		
union select 'INC501','01-10-2011',15,'SGD',50		
union select 'INF409','04-01-2012',25,'USD',100		
union select 'HCL205','07-17-2013',487.39,'INR',1		
union select 'Ran208','05-11-2008',112,'CHF',80		
union select 'TCS103','09-08-2007',114,'AUD',90		
union select 'WIP309','10-05-2008',120,'AUD',90	

insert into Scty_Tran
select 'HCL205','II207','07-18-2013','IIFL','07-18-2013'	
union select 'HDFC305','II109','07-17-2013','IIFL','07-19-2013'	
union select 'HUL109','HD305','03-29-2013','HDFC','03-29-2013'	
union select 'ICIC201','IC409','06-27-2012','ICICI','06-27-2012'	
union select 'Inc501','RM308','01-15-2011','Rmoney','01-16-2011'	
union select 'Inf409','Re107','01-05-2013','Religare','01-05-2013'	
union select 'Mar408','HD507','07-07-2009','HDFC','07-08-2009'	
union select 'Ran208','sk308','05-15-2008','Sharekhan','05-16-2008'	
union select 'Tcs103','RM305','09-10-2007','Rmoney','09-11-2007'	
union select 'WIP309','AX508','10-08-2008','Axis','10-08-2008'	

-- 3. Perform Select Statement on all 3 tables.

select * from security

select * from SCTY_PRICE

select * from Scty_Tran

-- 4. Select first 3 records from Security Table.

select top 3* from security

-- 5. Select those records from Security Table for which following condition is matched:
-- I. Scty_code is equal to HCL205

select * from Security where Scty_code = 'HCL205'

-- II. Date_inc is greater than 31st December 1994

select * from Security where Date_inc >= '12-31-1994'

-- III. Sedol_code is from 180000 to 199999

select * from security where Sedol_code between 180000 and 199999

-- IV. Head_office is present in Kolkata, Delhi and Bangalore

select * from security where Head_office in ('Kolkata','Delhi','Bangalore')

-- V. Head_office is not present in Kolkata, Delhi and Bangalore

select * from security where Head_office not in ('Kolkata','Delhi','Bangalore')

-- VI. Scty_code starts with H

Select * from security where Scty_code like 'H%'

-- VII. Sec_Name ends with C

Select * from security where Sec_Name like '%C'

-- VIII. Scty_code has C in it

Select * from security where Scty_code like '%C%'

-- IX. Sec_Name has i in it

Select * from security where Sec_Name like '%i%'

-- X. Sec_Name has i as second character in it

Select * from security where Sec_Name like '_i%'

-- XI. Sec_Name has i has second last character in it

Select * from security where Sec_Name like '%i_'

-- XII. Start with any of A to K and has C as second character

Select * from security where Sec_Name like '[A-K]C%'

-- XIII. Start with other than A to K and has C as second character

Select * from security where Sec_Name not like '[A-K]C%'

-- 6. Select those records from Scty_Price Table for which following condition is matched:
-- I. Calculate New Market Price as 10% increase in the existing Market Price

select MKT_PRICE * 1.1 as MKT_INC from SCTY_PRICE

-- 7. Update Scty_code in Scty_tran Table whose Broker is ICICI, change Scty_code to ICICI201

select * from Scty_Tran
update Scty_Tran set Scty_code = 'ICICI201' where Broker = 'ICICI'

-- 8. Update Tran_id in Scty_tran Table whose Scty_code is HCL205 and Trade_date is 10-Aug-1999, Change Tran_id to 197643

update Scty_Tran set Tran_id = '197643' where Scty_code = 'HCL205' and Trade_date = '10-Aug-1999'

-- 9. Delete record from Scty_Price Table whose currency is PKR, use commit to make the change permanent.

BEGIN TRAN
	delete from SCTY_PRICE where Currency = 'PKR' 
COMMIT TRAN

select * from SCTY_PRICE

-- 10. Delete record from Scty_Tran Table where entry_date is from 01-Jun-2012 to 31-Jul-2013,
-- use rollback to revert back the changes.

begin transaction
delete from Scty_Tran where Entry_date between '01-Jun-2012' and '31-Jul-2013'
rollback
select * from Scty_Tran

-- 11. What is the difference between Delete and Truncate. Show this with the help of an example.

/* 

Delete Statement: Triggers will work with delete statement and removes data row-by-row.

Truncate Statement: Triggers will not work with delete statement and will remove data from table in one single shot.

*/

-- EXAMPLE WITH DELETE STATEMENT

CREATE TABLE Employee(
Empid int NOT NULL primary key,
Name nchar(10) NULL,
City nchar(10) NULL
)

insert into Employee values (1,'Shweta','Pune') ,(2,'Stella','Hydrabad')

select * from Employee

BEGIN TRANSACTION
DELETE from Employee where Empid='1'
SELECT * from Employee
ROLLBACK TRANSACTION
SELECT * from employee

--(2 row(s) affected)

-- EXAMPLE WITH TRUNCATE STATEMENT

begin transaction
truncate table Employee 
select * from Employee
ROLLBACK TRANSACTION
select * from Employee

--(2 row(s) affected)