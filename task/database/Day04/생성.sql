-- 생성 문제
use classicmodels;

-- 1 
insert into customers(customerNumber, customerName, contactLastName, contactFirstName,phone, addressLine1, addressLine2, city, state, postalCode,country,creditLimit) values(1000, '김휘수','휘수','김',01082843436,'인천광역시','미추홀구','미추홀구','인천',1233,'대한민국',50000);
select * from customers
	where customerName = "김휘수";
	
-- 2
insert into products(productcode,productname,productScale,productVendor,productDescription,quantityinStock,buyPrice,msrp) values (1000,"포크레인","대형","벤더","머리쥐어짜내서 만드는 설명",3,15000,1300);

-- 3 
insert into employees(employeeNumber, lastName, firstName, extension, email,jobtitle) values (
	20000, '휘수','김', '머고', 'asd@asd.com','백엔드' );

-- 4 
insert into offices values(
	'NewYork', '인천','123-34456-23','주소1','주소2','광역시','한국','12312','응');

-- 5 
INSERT  INTO  orders values(
	1024, '2023-12-05','2024-12-05','2024-10-13','배송중','잘 가고있어요',1000);
-- 6 
insert into orderdetails values (
	1024, 1000,	1000,1500,3);
-- 7
insert into payments values (
	1000, 1000,'2023-12-05',3);
-- 8
insert into productlines values('vhzm','뭐이간','ㅁㄴㅇ','');

-- 9 
insert into customers(customerNumber, customerName, contactLastName, contactFirstName,phone, addressLine1,
	addressLine2, city, state, postalCode,country,creditLimit) values(
	1001, '김휘수','휘수','김',01082843436,'대전광역','유성','미추홀구','대전',1233,
	'대한민국',50000);
-- 10
insert into products(productcode,productname,productScale,
productVendor,productDescription,quantityinStock,buyPrice,msrp) values (
1001,"스파크","초대형","벤더","머리쥐어짜내서 만드는 설명",3,15000,1300);

-- 중급
-- 1
insert into customers(customerNumber, customerName, contactLastName, contactFirstName,phone, addressLine1,
	addressLine2, city, state, postalCode,country,creditLimit) values(
	1002, '김휘수','휘수','김',01082843436,'대전광역','유성','미추홀구','대전',1233,
	'대한민국',50000),(
	1003, '김휘수','휘수','김',01082843436,'대전광역','유성','미추홀구','대전',1233,
	'대한민국',50000);
-- 2
insert into products(productcode,productname,productScale,
productVendor,productDescription,quantityinStock,buyPrice,msrp) values (
1002,"스파크","초대형","벤더","머리쥐어짜내서 만드는 설명",3,15000,1300),(
1003,"스파크","초대형","벤더","머리쥐어짜내서 만드는 설명",3,15000,1300);

-- 3
insert into employees(employeeNumber, lastName, firstName, extension, email,jobtitle) values (
	20002, '휘수2','김말이', '머고1', 'a123sd@asd.com','백엔드' ),(
	20001, '휘수','치', '머고2', 'as1d@asd.com','백엔드' );

-- 4
INSERT  INTO  orders values(
	1025, '2023-12-05','2024-12-05','2024-10-13','배송중','잘 가고있어요',1002);

insert into orderdetails values (1025, 1000,1000,1500,3);

-- 5 
insert into payments values (
	1001, 1001,'2023-12-05',3),(
	1002, 1002,'2023-12-05',3);
-- 6
insert into customers(customerNumber, customerName, contactLastName, contactFirstName,phone, addressLine1,
	addressLine2, city, state, postalCode,country,creditLimit) values(
	1070, '김휘수','휘수','김',01082843436,'대전광역','유성','미추홀구','대전',1233,
	'대한민국',50000);
insert into  orders values(
	1050, '2023-12-05','2023-12-06','2024-10-13', '배송중', ' ', 1070);

-- 7
insert into employees(employeeNumber, lastName, firstName, extension, email,jobtitle) values (
	20004, '휘수2','김말이', '머고1', 'a123sd@asd.com','백엔드' );
update employees set jobtitle= '사장' where employeeNumber= 20004; 

-- 8 





