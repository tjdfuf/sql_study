SELECT * FROM employees;
SELECT * FROM departments;
-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    a.employee_id ���
    , a.first_name
    , a.last_name
    , a.department_id
    , b.department_name
FROM employees A
INNER JOIN departments B
ON A.department_id = B.department_id
ORDER BY a.employee_id
;

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    a.employee_id ���
    , a.first_name
    , a.last_name
    , department_id
    , b.department_name
FROM employees A
NATURAL JOIN departments B
-- department_id�� manager_id 2���� ����ǰ�����
ORDER BY a.employee_id
;

-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    a.employee_id ���
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

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--    join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���
SELECT
    a.employee_id ���
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
















