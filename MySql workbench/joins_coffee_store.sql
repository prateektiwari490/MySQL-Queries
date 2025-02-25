use coffee_store;

select* from products;
select* from orders;

-- inner join
select products.name, orders.order_time from orders
inner join products on orders.product_id = products.id;

select p.name,p.price, o.order_time from orders o
join products p on o.product_id = p.id
where product_id = 5
order by o.order_time;

-- left join
update orders
set customer_id = null
where id = 1;

select o.id, c.phone_number,c.last_name,o.order_time from orders o
left join customers c on o.customer_id = c.id
order by o.order_time
limit 10;

select o.id, c.phone_number,c.last_name,o.order_time from customers c
left join orders o on c.id = o.customer_id
order by o.order_time
limit 10;

-- right join
select o.id, c.phone_number,c.last_name,o.order_time from customers c
right join orders o on c.id = o.customer_id
order by o.order_time
limit 10;

select o.id, c.phone_number,c.last_name,o.order_time from orders o
right join customers c on o.customer_id = c.id
order by o.order_time
limit 10;

update orders
set customer_id = 1
where id = 1;

-- joing more than two tables
select* from products;
select* from orders;
select* from customers;

select p.name, p.price,c.first_name, c.last_name, o.order_time from products p
join orders o on p.id = o.product_id
join customers c on c.id = o.customer_id
where c.last_name = 'Martin'
order by o.order_time;

-- Excercise
select o.id,c.phone_number from orders o
join customers c on o.customer_id = c.id
where o.product_id = 4;

select p.name,o.order_time from orders o
join products p on o.product_id = p.id
where p.name = 'Filter'
and o.order_time between '2017-01-15'  and '2017-02-14';

select p.name,p.price,o.order_time from orders o
join products p on o.product_id = p.id
join customers c on o.customer_id = c.id
where c.gender = 'F'
and o.order_time between '2017-01-01'  and '2017-01-31';