use Vaish

create table stores(
storeid int,
sname varchar(15),
location varchar(30))

alter table STORES
alter column storeid int not null

alter table stores 
add constraint pk_storeid primary key(storeid)

