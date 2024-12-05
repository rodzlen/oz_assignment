-- day06
use db_test;
-- 
insert into users(first_name, last_name, email, password, address, contact, gender, is_staff) values
	('kim', 'hweesu', 'oz1@oz.com','asdasd', '인천광역시','01012341234','male', True),
	('e', 'hweesu', 'oz2@oz.com','aszccqw', '광주광역시','01012311231','male', True),
	('kyu', 'hweesu', 'oz3@oz.com','as12312dasd', '대전광역시','0109874383','male', True),
	('yun', 'hweesu', 'oz4@oz.com','affqw', '성남시','01012344566','male', True),
	('young', 'hweesu', 'oz5@oz.com','dargrreg', '서울특별시','01093938475','male', True),
	('chris', 'hweesu', 'oz6@oz.com','wefsd', '인천광역시','01012312323','male', True),
	('grave', 'hweesu', 'oz7@oz.com','zxcf', '광주광역시','01012741234','male', True),
	('in', 'hweesu', 'oz8@oz.com','12412ewadas', '서울턱별시','01012348234','male', True),
	('yeon', 'hweesu', 'oz9@oz.com','q123dad', '하와이','01015341234','male', True),
	('park', 'hweesu', 'oz10@oz.com','123adw', '오즈특별','01012311234','male', True);

INSERT INTO stores (name, address, contact, is_active) VALUES
('Downtown Store', '100 Market St', '111-222-3333', TRUE),
('Uptown Store', '200 Hill St', '222-333-4444', TRUE),
('West Side Store', '300 River Rd', '333-444-5555', TRUE),
('East Side Store', '400 Lake Blvd', '444-555-6666', TRUE),
('South Side Store', '500 Valley Ln', '555-666-7777', TRUE),
('North Side Store', '600 Mountain Rd', '666-777-8888', TRUE),
('Central Store', '700 Plaza Ave', '777-888-9999', TRUE),
('Harbor Store', '800 Ocean Dr', '888-999-0000', TRUE),
('Airport Store', '900 Runway Rd', '999-000-1111', TRUE),
('Suburban Store', '1000 Elm Grove', '000-111-2222', TRUE);

INSERT INTO employees (code, type, user_id, store_id, is_active) VALUES
(101, 'staff', 2, 1, TRUE),
(102, 'manager', 3, 1, TRUE),
(103, 'staff', 4, 2, TRUE),
(104, 'manager', 5, 2, TRUE),
(105, 'staff', 6, 3, TRUE),
(106, 'manager', 7, 3, TRUE),
(107, 'staff', 8, 4, TRUE),
(108, 'manager', 9, 4, TRUE),
(109, 'staff', 10, 5, TRUE),
(110, 'manager', 1, 5, TRUE);

INSERT INTO suppliers (name, address, contact, is_active) VALUES
('Supplier A', '50 Industrial Ave', '333-444-5555', TRUE),
('Supplier B', '60 Tech Park', '444-555-6666', TRUE),
('Supplier C', '70 Commerce St', '555-666-7777', TRUE),
('Supplier D', '80 Factory Rd', '666-777-8888', TRUE),
('Supplier E', '90 Warehouse Ln', '777-888-9999', TRUE),
('Supplier F', '100 Supply Blvd', '888-999-0000', TRUE),
('Supplier G', '110 Logistics Ave', '999-000-1111', TRUE),
('Supplier H', '120 Distribution Rd', '000-111-2222', TRUE),
('Supplier I', '130 Depot St', '111-222-3333', TRUE),
('Supplier J', '140 Storage Ln', '222-333-4444', TRUE);

INSERT INTO raw_materials (name, price) VALUES
('Flour', 10.50),
('Sugar', 15.30),
('Butter', 20.00),
('Eggs', 5.00),
('Milk', 8.00),
('Yeast', 12.00),
('Salt', 3.50),
('Chocolate', 25.00),
('Vanilla', 18.00),
('Baking Powder', 7.00);

INSERT INTO products (name, price, description) VALUES
('Red Bean Bread', 2.50, 'Sweet bread with red bean filling'),
('Custard Bread', 3.00, 'Soft bread with creamy custard'),
('Chocolate Croissant', 4.00, 'Flaky croissant with chocolate'),
('Butter Roll', 1.50, 'Simple buttery bread roll'),
('Milk Bun', 2.00, 'Soft bun with milk flavor'),
('Egg Tart', 3.50, 'Crispy tart filled with egg custard'),
('Choco Muffin', 4.50, 'Rich chocolate muffin'),
('Vanilla Cake', 20.00, 'Delicious vanilla sponge cake'),
('Salt Bread', 2.00, 'Savory bread with sea salt'),
('Fruit Danish', 5.00, 'Danish pastry with mixed fruits');


INSERT INTO stocks (raw_material_id, pre_quantity, quantity, change_type, store_id) VALUES
(1, 100, 200, 'IN', 1),
(2, 50, 100, 'IN', 1),
(3, 30, 60, 'IN', 2),
(4, 20, 40, 'IN', 2),
(5, 10, 20, 'IN', 3),
(6, 15, 30, 'IN', 3),
(7, 8, 16, 'IN', 4),
(8, 12, 24, 'IN', 4),
(9, 25, 50, 'IN', 5),
(10, 18, 36, 'IN', 5);
INSERT INTO order_records (employee_id, supplier_id, raw_material_id, quantity) VALUES
(1, 1, 1, 50),
(2, 2, 2, 30),
(3, 3, 3, 20),
(4, 4, 4, 40),
(5, 5, 5, 25),
(6, 6, 6, 15),
(7, 7, 7, 35),
(8, 8, 8, 10),
(9, 9, 9, 45),
(10, 10, 10, 50);

INSERT INTO sales_records (user_id, store_id, is_refund) VALUES
(1, 1, FALSE),
(2, 2, FALSE),
(3, 3, TRUE),
(4, 4, FALSE),
(5, 5, TRUE),
(6, 1, FALSE),
(7, 2, TRUE),
(8, 3, FALSE),
(9, 4, FALSE),
(10, 5, TRUE);

INSERT INTO sales_items (sales_record_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 5),
(5, 5, 4),
(6, 6, 6),
(7, 7, 3),
(8, 8, 2),
(9, 9, 1),
(10, 10, 7);

-- 시그니처 붕어
INSERT INTO products (name, price, description) VALUES
('생각붕어빵', 2.50, '생강생각 붕어빵~')

-- 직원 직급 바꾸
update employees  set store_id = 5, type = 'staff' where id = 1;
select * from employees
	where id = 1;

update employees  set store_id = 7, type = 'manager' where id = 2;
select * from employees
	where id = 2;







