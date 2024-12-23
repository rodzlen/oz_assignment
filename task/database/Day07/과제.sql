--  create database db_test;
 use db_test;
-- 
-- users 테이블 생성
-- create table users(
-- 	id int primary key auto_increment,
-- 	first_name varchar(25),
-- 	last_name varchar(25) not null,
-- 	email varchar(50) not null,
-- 	password varchar(255) not null,
-- 	address varchar(255),
-- 	contact varchar(50),
-- 	gender enum('FEMALE','MALE') not null,
-- 	is_active boolean default True,
-- 	is_staff boolean default false
-- );
-- create table stores(
-- 	id int primary key auto_increment,
-- 	name varchar(50) not null,
-- 	address varchar(255),
-- 	contact varchar(50),
-- 	is_active boolean default True
-- );
-- 
-- create table employees(
-- 	id int primary key auto_increment,
-- 	code int not null unique,
-- 	type enum('staff','manager') not null,
-- 	user_id int,
-- 	store_id int,
-- 	is_active boolean not null default true,
-- 	foreign key (user_id) references users(id) on delete cascade,
-- 	foreign key (store_id) references stores(id) on delete cascade
-- );
-- create table suppliers(
-- 	id int primary key auto_increment,
-- 	name varchar(50) not null,
-- 	address varchar(255),
-- 	contact varchar(50),
-- 	is_active boolean default True
-- );
-- 
-- create table raw_materials(
-- 	id int primary key auto_increment,
-- 	name varchar(50) not null,
-- 	price decimal(10,2) not null
-- );
-- 
-- create table products(
-- 	id int primary key auto_increment,
-- 	name varchar(50) not null,
-- 	price decimal(10,2) not null,
-- 	description text
-- );
-- 
-- CREATE TABLE stocks(
-- 	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
-- 	raw_material_id INT NOT NULL, -- 원재료 id
-- 	pre_quantity INT NOT NULL, -- 이전 재고
-- 	quantity INT NOT NULL, -- 수량
-- 	change_type ENUM('IN', 'OUT', 'RETURNED', 'DISCARDED'), -- 입고(IN) 출고(OUT) 반품(RETURNED) 폐기(DISCARDED)
-- 	store_id INT NOT NULL, -- stors 테이블의 id
-- 	create_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
-- 	FOREIGN KEY (raw_material_id) REFERENCES raw_materials(id),
-- 	FOREIGN KEY (store_id) REFERENCES stores(id)
-- );

-- 
-- CREATE TABLE order_records(
-- 	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
-- 	employee_id INT, -- users 테이블의 id
-- 	supplier_id INT, -- suppliers 테이블의 id
-- 	change_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 변경된 시간
-- 	raw_material_id INT, -- raw_material 테이블의 id
-- 	quantity INT NOT NULL, -- 수량
-- 	create_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
-- 	FOREIGN KEY (employee_id) REFERENCES employees(id),
-- 	FOREIGN KEY (raw_material_id) REFERENCES raw_materials(id),
-- 	FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
-- );
-- 
-- CREATE TABLE sales_records(
-- 	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
-- 	user_id INT, -- users 테이블의 id,
-- 	store_id INT, -- stores 테이블의 id
-- 	is_refund BOOL DEFAULT FALSE, -- 반품하는 것인지 확인하는 컬럼
-- 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
-- 	FOREIGN KEY (user_id) REFERENCES users(id),
-- 	FOREIGN KEY (store_id) REFERENCES stores(id)
-- );
-- 
-- CREATE TABLE sales_items(
-- 	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
-- 	sales_record_id INT, -- sales_records 테이블의 id
-- 	product_id INT, -- products의 id
-- 	quantity INT NOT NULL, -- 수량
-- 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
-- 	FOREIGN KEY (sales_record_id) REFERENCES sales_records(id),
-- 	FOREIGN KEY (product_id) REFERENCES products(id)
-- );
use db_test;

-- 1
select * from users 
	where  (first_name like '%s%' and first_name like '%y')
	or (last_name like '%s%' and last_name like '%y');
-- 2
select u.contact from users u
	join employees e on u.id = e.user_id
	where e.store_id = 5;
-- 3
select * from suppliers s, stores st
order by s.name,st.name;

-- 4
select count(*) from employees
where type = 'staff' or type = 'manager';

-- 5
select u.first_name,u.last_name, s.name as '가게이름' from users u
	join employees e on u.id = e.user_id
	join stores s on s.id = e.store_id
	where e.type = 'manager';

-- 6
select st.name, p.name, count(si.quantity) as '판매수량' from sales_items si
	join sales_records sr on sr.id = si.sales_record_id
	join products p on p.id = si.product_id
	join stores st on sr.store_id = st.id
	group by st.name, p.name;

SELECT sr.store_id, p.name, s.quantity, COUNT(*) as popular
FROM sales_items s
JOIN products p ON s.product_id = p.id
JOIN sales_records sr ON s.sales_record_id = sr.id
GROUP BY sr.store_id, p.name, s.quantity;

-- 7
select r.name , count(DISTINCT s.name ) as '공급업체 수' 
from order_records o
join raw_materials r on o.raw_material_id = r.id
join suppliers s on o.supplier_id = s.id
group by r.name;
	

select r.name, count(distinct s.name) as 공급업체수 from order_records o 
join raw_materials r on o.raw_material_id = r.id
join suppliers s on o.supplier_id = s.id
group by r.name;


