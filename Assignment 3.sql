create table cust_info(
custid	int	not null,
cname	varchar(10)	not null,
orderid	int not null,
prodid	varchar(10)	not null)

insert into cust_info
values (101,'Ajay',128732,'HB305'),
(102,'Reena',105649,'KA209'),
(101,'Ajay',128732,'HB305'),
(103,'Rakesh',134579,'AG202'),
(105,'Neetha',125768,'AE109'),
(107,'Anita',131274,'GK305'),
(101,'Ajay',128732,'HB305'),
(102,'Reena',105649,'KA209'),
(106,'Romi',132174,'EA102'),
(103,'Rakesh',134579,'AG202')

select * from cust_info

select cust_id, count(cust_id) as count_cust-id
from cust_info
group by cust_id
having count(cust_id) > 1