-- 갱신
use classicmodels;

-- 1
update customers set addressLine1 = "예술회관4번출구"
where customerName = '김휘수';

-- 2 
update products set buyPrice = 400
	where productname in ('포크레인' , '스파크');
-- 3
update employees set jobtitle = "임원"
	where lastname = '휘수';
	
-- 4 
update offices set phone = '12-1213-12'
	where state = '인천';

-- 5
update orders set status = "배송중"
	where orderDate = '2023-12-05';
	
-- 6 
update orderdetails set quantityordered = 3
	where ordernumber = 100;
	
-- 7 
update payments set amount = 10
	where customernumber = 1000;
	
-- 8 
update productlines set textDescription = "테무산입니다."
	where productLine = "포크";
	
-- 9 
update customers set email = "qkqh@qkqhqkqh.qkqh"
	where customername = "김휘수";
	
-- 10 
update products set buyprice = 30
	where productcode in ('1','3');
	