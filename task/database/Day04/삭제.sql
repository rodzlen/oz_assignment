-- 삭제 
use classicmodels;

-- 1
delete from customers where customername = "김휘수";

-- 2
delete from products where productname = '포크레인';

-- 3 
delete from employees where lastname = "휘수";

-- 4
delete from offices where city = "인천";

-- 5
delete from orders where ordernumber = 1024;

-- 6
delete from orderdetails where ordernumber = 1024;

-- 7 
delete from payments where customernumber =1024;

-- 8
delete from productlines where  productLine = '포크';

-- 9 
delete from customers where city ="인천";

-- 10
delete from products where productscale = "big";