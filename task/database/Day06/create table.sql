--  create database db_test;
-- use db_test;
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


CREATE TABLE order_records(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	employee_id INT, -- users 테이블의 id
	supplier_id INT, -- suppliers 테이블의 id
	change_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 변경된 시간
	raw_material_id INT, -- raw_material 테이블의 id
	quantity INT NOT NULL, -- 수량
	create_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
	FOREIGN KEY (employee_id) REFERENCES employees(id),
	FOREIGN KEY (raw_material_id) REFERENCES raw_materials(id),
	FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE sales_records(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	user_id INT, -- users 테이블의 id,
	store_id INT, -- stores 테이블의 id
	is_refund BOOL DEFAULT FALSE, -- 반품하는 것인지 확인하는 컬럼
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (store_id) REFERENCES stores(id)
);

CREATE TABLE sales_items(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	sales_record_id INT, -- sales_records 테이블의 id
	product_id INT, -- products의 id
	quantity INT NOT NULL, -- 수량
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성된 시간
	FOREIGN KEY (sales_record_id) REFERENCES sales_records(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);


