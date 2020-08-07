--7

create table patient(
NAME varchar(10),
CITY Varchar (20),	
GENDER varchar (5),	
AGE int,
WEIGHT float,	
HEIGHT float,	
Admission_Date date,	
Discharge_Date date)

insert into patient
select 'Alfred','Chicago','M',14,69,112.5,'01-15-2008','01-20-2008'
union select 'Alice','New York','F',13,56.5,84,'02-17-2008','02-25-2008'
union select 'Barbara','California','F',13,65.3,98,'07-22-2008','08-10-2008'
union select 'Carol','Las Vegas','F',14,62.8,102.5,'04-07-2008','04-15-2008'
union select 'Henry','Chicago','M',14,63.5,102.5,'11-10-2008','12-01-2008'
union select 'James','New York','M',12,57.3,83,'10-30-2008','11-11-2008'
union select 'Jane','California','F',12,59.8,84.5,'05-12-2008','06-12-2008'
union select 'Janet','Las Vegas','F',15,62.5,112.5,'06-10-2008','07-14-2008'
union select 'Jeffrey','Chicago','M',13,62.5,84,'05-05-2008','05-18-2008'
union select 'John','New York','M',12,59,99.5,'12-27-2008','01-05-2009'
union select 'Joyce','California','F',11,51.3,50.5,'02-17-2008','02-28-2008'

--8

Select name from patient

Select GENDER from patient

--9

select sum(weight) as sum_weight from patient

select avg(HEIGHT) as avg_height from patient where GENDER = 'F' and AGE > 13  


--10

select NAME,AGE,CITY from patient where CITY in ('Chicago','New York','California')

select NAME,AGE,CITY from patient where CITY like '%a%'

--11

begin transaction

update patient
set HEIGHT = 90 where AGE = 14

rollback

--12

select dateadd(day,15,Discharge_Date)as follow_date from patient 
select datediff(day,Admission_Date,Discharge_Date) as diff_bw_AD_DD from patient

--13

insert into patient patient_id
substring(NAME,1,3)