-- 읽기 
use classicmodels;

-- 1
select * from customers;

-- 2 
select * from products;

-- 3 
select firstName, lastName, jobTitle from employees;

-- 4 
select city, addressLine1, addressLine2 from offices;

-- 5
select * from orders
order by orderDate desc limit 10;

-- 6
select * from orderdetails
WHERE orderNumber = 223;
-- 7
select * from payments
	WHERE customerNumber = 1000;
-- 8
select textDescription from productlines;

-- 9 
select customerName from customers
	WHERE city = '인천';
	
-- 10
select productname from products
	where buyPrice >= 500;
	
