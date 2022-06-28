

-- # ������ ��������
-- ���������� ��ȸ ����� 1�� ������ ���

-- �μ��ڵ尡 100004���� �μ��� ������� ��ȸ

SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
;

-- ����̸��� '�̳���'�� ����� ���� �ִ� �μ��� ������� ��ȸ
SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = (SELECT dept_cd FROM tb_emp WHERE emp_nm = '�̳���')
;

-- ����̸��� '�̰���'�� ����� ���� �ִ� �μ��� ������� ��ȸ
-- ������ �񱳿�����(=, <>, >, >=, <, <=)�� ������ ���������� ���ؾ� ��.
SELECT
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = (SELECT dept_cd FROM tb_emp WHERE emp_nm = '�̰���')
;


-- 20200525�� ���� �޿��� ȸ����ü�� 20200525��
-- ��ü ��� �޿����� ���� ������� ���� ��ȸ (���, �̸�, �޿�������, �����޿��׼�) ��ȸ
SELECT
    A.emp_no
    , A.emp_nm
    , B.pay_de
    , B.pay_amt
FROM tb_emp A
INNER JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE B.pay_de = '20200525' AND B.pay_amt >= (
    SELECT
    AVG(pay_amt)
    FROM tb_sal_his
    WHERE pay_de = '20200525') 
ORDER BY A.emp_no, B.pay_de
;

-- ȸ�� ��ü 20200525 �޿����
SELECT
    AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525'
;


-- # ������ ��������
-- ���������� ��ȸ �Ǽ��� 0�� �̻��� ��
-- ## ������ ������
-- 1. IN ���������� �������� �������� ����߿� �ϳ��� ��ġ�ϸ� ��
--    EX) salary IN (200, 300, 400) �� �� �ϳ��� salary�� ũ�� ��
--          250 -> 200, 300, 400 �߿� �����Ƿ� FALSE
-- 2. ANY, SOME : ���������� �������� ���������� �˻���� �� �ϳ� �̻� ��ġ�ϸ� ��
--    EX) salary > ANY (200, 300, 400) �� �� �ϳ��� salary�� ũ�� ��
--          250 -> 200���� ũ�Ƿ� TRUE
-- 3. ALL : ���������� �������� ���������� �˻������ ��� ��ġ�ϸ� ��
--    EX) salary > ALL (200, 300, 400) ��� ������ �����Ǿ�� ��
--          250 -> 200���� ũ����, 300, 400���� ũ�������Ƿ� FALSE
-- 4. EXISTS : ���������� �������� ���������� ��� �� �����ϴ� ���� �ϳ��� �����ϸ� ��

-- �ѱ� �����ͺ��̽� ��������� �߱��� �ڰ����� ������ �ִ�
-- ����� �����ȣ�� �̸��� �ѱ� �����ͺ��̽� ��������� �߱��� �ڰ��� ������ ��ȸ
SELECT certi_cd 
FROM tb_certi 
WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
;


SELECT
    A.emp_no
    , A.emp_nm
    , COUNT(B.certi_cd) "�ڰ��� ����"
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
WHERE B.certi_cd IN (
    SELECT certi_cd 
    FROM tb_certi 
    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY A.emp_no, A.emp_nm
ORDER BY A.emp_no
;


SELECT
    A.emp_no
    , A.emp_nm
    , COUNT(B.certi_cd) "�ڰ��� ����"
FROM tb_emp A
JOIN tb_emp_certi B
ON A.emp_no = B.emp_no
WHERE B.certi_cd = ANY (
    SELECT certi_cd 
    FROM tb_certi 
    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY A.emp_no, A.emp_nm
ORDER BY A.emp_no
;


-- EXISTS�� : ���������� �������� ���������� ��� �� �����ϴ� ���� �ϳ��� �����ϸ� ��
-- �ּҰ� ������ �������� �ٹ��ϰ� �ִ� �μ������� ��ȸ (�μ��ڵ�, �μ���)
SELECT emp_no, emp_nm, addr, dept_cd
FROM tb_emp 
WHERE addr LIKE '%����%'
;

SELECT dept_cd, dept_nm
FROM tb_dept
WHERE dept_cd IN ('100009', '100010')
;

SELECT dept_cd, dept_nm
FROM tb_dept 
WHERE dept_cd IN (
                    SELECT dept_cd
                    FROM tb_emp 
                    WHERE addr LIKE '%����%'
                )
;

SELECT 
    1
FROM tb_emp
WHERE addr LIKE '%����%'
;

SELECT A.dept_cd, A.dept_nm
FROM tb_dept A
WHERE EXISTS (
                    SELECT 
                        1
                    FROM tb_emp B
                    WHERE addr LIKE '%����%'
                        AND A.dept_cd = B.dept_cd
                )
;


-- # ���� �÷� ��������
--  : ���������� ��ȸ �÷��� 2�� �̻��� ��������

-- �μ����� 2�� �̻��� �μ��߿��� �� �μ��� ���� �������� ����� �̸� ������ϰ� �μ��ڵ带 ��ȸ

SELECT
    A.emp_no
    , A.emp_nm
    , A.birth_de
    , A.dept_cd
    , B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
    SELECT
        dept_cd, MIN(birth_de)
    FROM tb_emp
    GROUP BY dept_cd
    HAVING COUNT(*) >= 2
)
ORDER BY A.emp_no
;


-- �ζ��� �� �������� (FROM���� ���� ��������)

-- �� ����� ����� �̸��� ��� �޿�����
SELECT
    A.emp_no
    , A.emp_nm
    , AVG(B.pay_amt)
FROM tb_emp A, (
    SELECT
        AVG(pay_amt) AS pay_avg
    FROM tb_sal_his
    GROUP BY emp_no
)
WHERE A.emp_no = B.emp_no
GROUP BY A.emp_no, A.emp_nm
ORDER BY A.emp_no
;


-- ��Į�� �������� (SELECT���� ���� ��������)

-- ����� ���, �����, �μ���, ��������� ��ȸ
SELECT
    A.emp_no
    , A.emp_nm
    , (SELECT B.dept_nm FROM tb_dept B WHERE A.dept_cd = B.dept_cd) AS dept_nm
    , A.birth_de
    , A.sex_cd
FROM tb_emp A





















