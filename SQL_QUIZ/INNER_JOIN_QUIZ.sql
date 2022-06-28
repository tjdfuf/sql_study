SELECT * FROM employees;
SELECT * FROM departments;
-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    a.employee_id 사번
    , a.first_name
    , a.last_name
    , a.department_id
    , b.department_name
FROM employees A
INNER JOIN departments B
ON A.department_id = B.department_id
ORDER BY a.employee_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    a.employee_id 사번
    , a.first_name
    , a.last_name
    , department_id
    , b.department_name
FROM employees A
NATURAL JOIN departments B
-- department_id와 manager_id 2개가 적용되고있음
ORDER BY a.employee_id
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    a.employee_id 사번
    , a.first_name
    , a.last_name
    , department_id
    , B.department_name
FROM employees A
INNER JOIN departments B
USING (department_id)
ORDER BY a.employee_id
;

SELECT * FROM locations;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    a.employee_id 사번
    , a.first_name
    , B.department_name
    , c.city
FROM employees A
INNER JOIN departments B
ON a.department_id = b.department_id
INNER JOIN locations C
ON b.location_id = c.location_id
ORDER BY a.employee_id
;
















