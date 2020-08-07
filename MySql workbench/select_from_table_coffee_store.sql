use coffee_store;

-- select statement

select* from customers;
select last_name from customers;
select last_name,phone_number from customers;

-- where clauses
select* from products
where coffee_origin = 'Columbia';

select* from products
where price = 3.00
and coffee_origin = 'Columbia';

select* from products
where price = 3.00
or coffee_origin = 'Columbia';

-- equality symbol
select* from products
where price > 3.00;

-- null values
select* from customers
where phone_number is null;

select* from customers
where phone_number is not null;

-- Excercise 1
select* from customers;
select first_name,phone_number from customers
where gender = 'F'
and last_name = 'Bluth';

select* from products;
select name from products
where price > 3.00
or coffee_origin = 'Sri Lanka';

select* from customers
where gender = 'M'
and phone_number is null;

-- In, not in
select* from customers
where last_name in ('Taylor','Bluth','Armstrong');

select* from customers
where first_name not in ('Katie','John','George');

-- between
select* from orders;
select* from customers;

select product_id,customer_id,order_time from orders
where order_time between '2017-01-01' and '2017-01-07';

select product_id,customer_id,order_time from orders
where customer_id between 5 and 10;

select* from customers
where last_name between 'A' and 'L';

-- Like
select* from products
where price like '3.%5';

select* from customers
where last_name like 'W%';

select* from customers
where first_name like '%o%';

select* from customers
where first_name like '_o_';

-- Order By
select* from products
order by price ASC;

select* from products
order by price desc;

select* from customers
order by last_name asc;

select* from orders
where customer_id = 1
order by order_time asc;

-- Excercise 2
select name, price from products
where coffee_origin in ('Columbia','Indonesia')
order by name;

select* from orders
where customer_id in (2,4,6,8)
and order_time between '2017-02-01' and '2017-02-28';

select first_name, phone_number from customers
where last_name like '%ar%';

-- Distinct
select distinct coffee_origin from products;

select distinct customer_id,product_id from orders
where order_time between '2017-02-01' and '2017-02-28';

-- limits
select* from customers
limit 5 offset 4;

select* from customers
order by last_name
limit 10;

-- column name alias
select name as coffee, price, coffee_origin as country from products;

select* from products;

-- Excercise 3
select distinct last_name from customers
order by last_name;

select* from orders
where customer_id = 1
and order_time between '2017-02-01' and '2017-02-28'
limit 3;

select name, price as retial_price, coffee_origin from products;