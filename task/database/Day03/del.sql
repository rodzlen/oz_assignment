-- 민혁놈 정보 삭제
DELETE FROM employees WHERE name = '민혁';

-- 모든 직원을 position으로 그룹화 하여 각 직책의 평균 연봉을 계산
SELECT position, avg(salary) FROM employees GROUP BY position;

-- employees 테이블 삭제 
drop table employees;