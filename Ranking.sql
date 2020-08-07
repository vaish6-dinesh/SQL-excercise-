insert into customer
select 'IA1022','RAJ','PUNE',126434,'2015-03-06', 38250
union select 'PP1024','MATHEWS','KOCHI',126435,'2015-02-10',38250
union select 'BA2019','NISHA','CHENNAI',126436,'2016-03-15',38250

select * from customer

-- syntax

-- row_number() over([partition by columname][order by volumnname])
-- this function generate sequencial number based on the column order used in over clause
-- same rank is assigned for matching values or same values in a column and ranks are not consecutive

select *, row_number() over (order by location) as row_no from customer

select *, rank() over (order by pricepaid desc) as RANKING from customer

select *, rank() over (order by location) as RANKING from customer

-- DENSE_RANK() assigns a rank based on the order of column present in the over clause. Same rank is
-- assigned for matching values or same values in a column and ranks consecutive

select *, row_number() over (order by location) as ROW_NO ,
		  rank() over (order by location) as RANKING,
		  dense_rank() over (order by location) as DRANKING from customer

select *, row_number() over (order by pricepaid desc) as ROW_NO ,
		  rank() over (order by pricepaid desc) as RANKING,
		  dense_rank() over (order by pricepaid desc) as DRANKING from customer

-- Partition By

select *,row_number() over (partition by location order by pricepaid desc) as ROW_NO,
		 rank() over (partition by location order by pricepaid desc) as RANKING,
		 dense_rank() over (partition by location order by pricepaid desc) as DRANKING from customer

-- Assignment

select *,rank() over (partition by city order by height desc) as Ranking,
		 dense_rank() over (partition by city order by height desc) as DRanking,
		 row_number() over (partition by city order by height desc) as Row_no from patient

