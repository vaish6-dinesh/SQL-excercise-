-- Dealing with null values
-- is null 

use Vaish

select * from customer
select *, isnull(cname,'missing') as new_cm from customer

create table product(
PROD_ID varchar(15)not null,
P_NAME varchar(15) not null,	
PRICE int,	
ENTRY_DATE date)

insert into product
select 'AE2015','MOTOG',12999,'09-12-2014'
union select 'AE2017','MOTOG',19999,'12-25-2014'
union select 'AE2019','SNOTE',28170,'08-10-2014'
union select 'AE2021','GNEXUS',29990,NULL
union select 'AE2013','HTCM8',40199,NULL

select * from product

update product
set ENTRY_DATE = isnull(ENTRY_DATE,getdate())

-- nullif() statement

select nullif(10,10)

select * from Scty_Tran 

create table contact(
CUST_ID INT NOT NULL,
EMAIL_ID varchar(30),	
PHONE_NO Bigint)

insert into contact
select 128732,'gurup@gmail.com',9431096321
union select 129476,NULL,9980201394
union select 129522,NULL,9364217623
union select 130179,'rajnair@gmail.com',9746127331
union select 130181,'ajay@gmail.com',9196321783

-- Coalesce() statement

select coalesce(null,'benf2',null,'RBI')

-- write sql query to have cust_id and primary mode of contact
-- email should be first level of contact, whenever email is null
-- then we should have phone no as the primary mode of contact

select cust_id, coalesce(email_id,cast(phone_no as varchar(10))) as PMOC from contact












