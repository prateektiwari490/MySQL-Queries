show databases;

create database coffee_store;

use coffee_store;
show tables;

-- SQL for creating the coffee_store database

CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30),
	price DECIMAL(3,2),
	coffee_origin VARCHAR(30)
);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender ENUM('M','F'),
	phone_number VARCHAR(11)
);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
	product_id INT,
	customer_id INT,
	order_time DATETIME,
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);
