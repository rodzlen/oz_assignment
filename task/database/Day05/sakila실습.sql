-- sakila 
use sakila;
-- 특정 배우가 출연한 영화 목록 조회 
select title from film f
	join film_actor fa on f.film_id = fa.film_id
    join actor a on fa.actor_id = a.actor_id
    where a.first_name ='johnny'and a.last_name ="lollobrigida"
    group by title;
    
-- 모든 카테고리와 해당 카테고리의 영화 수 조회 
select name, count(fc.film_id) from category c
	join film_category fc on c.category_id = fc.category_id
    join film f on f.film_id = fc.film_id 
    group by name;
    
-- 특정 고객의 대여 기록 조회 id =5
   select rental_date, f.title from rental r
   	join customer c on r.customer_id = c.customer_id
   	join inventory i on i.inventory_id = r.inventory_id
   	join film f on i.film_id = f.film_id
   	where c.customer_id = 5
   	order by rental_date desc;
   	
-- 가장 최근에 추가된 영화 10개 제목을 조회
select title from film
	order by release_year desc, title limit 10;

-- '문제: 'ACADEMY DINOSAUR' 영화에 출연한 모든 배우의 이름을 조회하시오.'
select first_name, last_name from actor a
	join film_actor fa on a.actor_id = fa.actor_id
	join film f on fa.film_id = f.film_id
	where f.title = 'academy dinosaur';
	
-- 'ACADEMY DINOSAUR' 영화를 대여한 모든 고객의 이름을 조회하시오.
select first_name, last_name from customer c
	join rental r on r.customer_id = c.customer_id
	join inventory i on r.inventory_id = i.inventory_id 
	join film f on i.film_id = f.film_id
	where f.title = "academy dinosaur";

--  각 고객별로 가장 최근에 대여한 영화의 제목을 조회하시오.
select c.customer_id as id, c.first_name nam, c.last_name name,r.rental_date date,f.title
	from film f
	join inventory i on f.film_id = i.film_id
	join rental r on i.inventory_id = r.inventory_id
	join customer c on r.customer_id = c.customer_id
	where r.rental_date = (select max(rental_date) date 
		from rental r2 where r.customer_id = r2.customer_id)
	order by id;

-- 각 영화별 평균 대여 기간을 일 단위로 계산하시오.
SELECT f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) as avg_rental_period
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title;

-- 가장 많이 대여된 영화의 제목과 대여 횟수를 조회하시오.
SELECT f.title, COUNT(r.rental_id) as rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 1;

-- 각 카테고리별 평균 대여 요금을 계산하시오.
SELECT c.name, AVG(f.rental_rate) as average_rental_rate
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

-- 각 월별로 총 매출액을 계산하시오.
SELECT YEAR(p.payment_date) as year, MONTH(p.payment_date) as month, SUM(p.amount) as total_sales
FROM payment p
GROUP BY YEAR(p.payment_date), MONTH(p.payment_date);

-- 각 배우별로 출연한 영화 수를 계산하시오.
SELECT a.first_name, a.last_name, COUNT(fa.film_id) as number_of_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name;

-- 가장 많은 수익을 낸 영화의 제목과 수익을 조회하시오.
SELECT f.title, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.title
ORDER BY total_revenue DESC
LIMIT 1;

-- 평균 대여 요금보다 높은 요금의 영화 제목과 요금을 조회하시오.
SELECT f.title, f.rental_rate
FROM film f
WHERE f.rental_rate > (SELECT AVG(rental_rate) FROM film);

-- 가장 많은 영화를 대여한 고객의 이름과 대여 횟수를 조회하시오.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC
LIMIT 1;

-- 배우 'PENELOPE GUINESS'가 출연한 영화 중 가장 많이 대여된 영화의 제목과 대여 횟수를 조회하시오.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS'
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 1;

-- 'film' 테이블에 'New Adventure Movie'라는 새로운 영화를 추가하시오.
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
VALUES ('New Adventure Movie', 'A thrilling adventure of the unknown', 2023, 1, 3, 4.99, 120, 19.99, 'PG', 'Trailers,Commentaries');

-- 고객 ID가 5인 고객의 주소를 '123 New Address, New City'로 변경하시오.
UPDATE customer
SET address_id = (SELECT address_id FROM address WHERE address = '123 New Address, New City')
WHERE customer_id = 5;

-- 대여 ID가 200인 대여 기록의 상태를 'returned'로 변경하시오.
UPDATE rental
SET return_date = NOW()
WHERE rental_id = 200;

-- 배우 ID가 10인 배우의 정보를 삭제하시오. foreign key락 
DELETE FROM actor
WHERE actor_id = 10;

-- 