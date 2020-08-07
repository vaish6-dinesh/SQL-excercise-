use Vaish

create table Security(
Scty_code Varchar(10) Primary Key,
Sec_name Varchar(10) Not Null,
Company Varchar(20) Not Null,
Tin_Number Varchar(12) Unique, 
Sedol_code int,
Head_office Varchar(15) Not Null,
Date_inc Date)

create table SCTY_PRICE(
Sec_id Varchar(10) Foreign Key references security(Scty_code),
Prc_date Date Not Null,
Mkt_Price float Not Null, 
Currency Varchar(10) Not Null, 
Pricing_factor float)

alter table security
alter column Sedol_code int not null

alter table SCTY_PRICE
add constraint Pricing_factor_def default 1 for Pricing_factor