use cinema_booking_system;
select* from customers;

-- count function
select count(*) from customers;

select count(first_name) from customers;

select count(*) from customers
where last_name = 'Smith';

select count(*) from customers
where first_name is null;

-- sum function
select* from  rooms;

select sum(no_seats) from rooms;

select sum(no_seats) from rooms
where id > 1;

-- min and max
select* from films;

select max(length_min) from films;

select min(length_min) from films;

-- Average
select* from films;

select avg(length_min) from films;

select avg(length_min) from films
where length_min > 120;

-- Excercise1
-- how many bookings did customers id 10 make in october 2017
select* from customers;
select* from bookings;

select count(*) from bookings 
where customer_id = 10;

-- count the number of screenings for Blade Runner 2049 in october 2017

select count(*) from screenings s
join films f on s.film_id = f.id
where f.name = 'Blade Runner 2049';

-- count the number of unique customers who made a bookings for october 2017

select count(distinct(customer_id)) from bookings;

-- Group By

select* from bookings;

select customer_id, count(id) from bookings
group by customer_id;

select customer_id,screening_id, count(id) from bookings
group by customer_id,screening_id;

select f.name, s.start_time, c.first_name,c.last_name, count(b.id) from films f
join screenings s on f.id = s.film_id
join bookings b on s.id = b.screening_id
join customers c on b.customer_id = c.id
group by f.name,c.last_name,c.first_name,s.start_time
order by s.start_time;

-- Having Clause

select customer_id,screening_id, count(id) from bookings
group by customer_id,screening_id
having customer_id = 10;

-- Excercise 2
-- select the customer id and count the number of reserved seats grouped by customer for october 2017
select* from reserved_seat,bookings;
show tables;

select b.customer_id, count(rs.seat_id) from bookings b
join reserved_seat rs on b.id = rs.booking_id
group by b.customer_id;

-- select the filme name and count the number of screening for each film that is over two hour long

select f.name, f.length_min, count(s.id) from films f
join screenings s on f.id = s.film_id
group by f.name,f.length_min
having f.length_min > 120;

-- Non Corelated sub queries

select id, start_time from screenings 
where film_id in
	(select id from films 
    where length_min > 120);
    
select id from films 
where length_min > 120;

select* from customers;
select* from bookings;

select first_name, last_name, email from customers
where id in 
(select customer_id from bookings
where screening_id = 1);

select customer_id from bookings
where screening_id = 1;

select* from reserved_seat;

select avg(no_seats), max(no_seats) from 
(select booking_id, count(seat_id) as no_seats from reserved_seat
group by booking_id) b;

-- Corelated Sub queries
select screening_id, customer_id from bookings
order by screening_id;

select screening_id, customer_id,
(select count(seat_id) 
from reserved_seat 
where booking_id = b.id)
from bookings b
order by screening_id;