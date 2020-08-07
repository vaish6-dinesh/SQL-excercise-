-- 1.	Find out total market price and average market price using scty_price table.

select sum(mkt_price) as total_mkt_price , avg(mkt_price) as avg_mkt_price from SCTY_PRICE

-- 2.	Find out total market price and average market price for each currency using scty_price table.

select Currency, sum(mkt_price) as total_mkt_price , avg(mkt_price) as avg_mkt_price from SCTY_PRICE
group by currency

-- 3.	Find out count of scty_code for each broker using scty_tran table.

select broker, count(scty_code) as total_rows from Scty_Tran group by Broker

-- 4.	Find out total market price and average market price for each currency for which average market price is greater than 100.

select currency, sum(mkt_price) as total_mkt_price , avg(mkt_price) as avg_mkt_price from SCTY_PRICE
group by currency having avg(mkt_price) < 100

-- 5.	Find out total market price and average market price for each currency for which total market price less than 100 and currency are AUD,GBP and USD.

select currency, sum(mkt_price) as total_mkt_price , avg(mkt_price) as avg_mkt_price from SCTY_PRICE
group by currency having avg(mkt_price) < 100 and Currency in ('AUD','GBP','USD')