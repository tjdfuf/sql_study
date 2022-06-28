

-- ������� ���, �̸�, �ּ�, �μ���
SELECT
    E.emp_no
    , E.emp_nm
    , E.addr
    , D.dept_nm
FROM tb_emp E
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
;

-- ���� ���� �׽�Ʈ ������
CREATE TABLE TEST_A ( -- �Խù�
    id NUMBER(10) PRIMARY KEY  -- �Խù� ��ȣ
    , content VARCHAR2(200)  -- �Խù� ����
);
CREATE TABLE TEST_B ( -- ���
    b_id NUMBER(10) PRIMARY KEY  -- ��� ��ȣ
    , reply VARCHAR2(100) -- ��� ����
    , a_id NUMBER(10) -- �ش� �Խù� ��ȣ
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);
COMMIT;

SELECT * FROM test_a;
SELECT * FROM test_b;

-- Cartesion Product(Cross Join) : JOIN ������ �������� ������ ��� ����� ���� �� �����ش� (a*b�� ������ŭ)
SELECT 
    *
FROM test_a, test_b
;

-- INNER JOIN(EQUI JOIN�� �� ����) : ���� ���ǿ� ��Ī�Ǵ� �͸� �ɷ��ִ� ��
SELECT 
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id  -- JOIN ����
;

SELECT 
    A.id
    , A.content
    , B.reply
FROM test_a A, test_b B
WHERE A.id = B.a_id  -- JOIN ����
;


-- �ڰ��� ���� ���̺�
SELECT * FROM tb_emp_certi;
SELECT * FROM tb_certi;

-- ����� �����ȣ�� ��� �ڰ����� ��ȸ�ϰ� ����
SELECT 
    tec.emp_no
    , tc.certi_nm
FROM tb_emp_certi TEC, tb_certi TC
WHERE TEC.certi_cd = tc.certi_cd
;


-- ����� �����ȣ�� ����̸��� ��� �ڰ������� ��ȸ�ϰ� ����
SELECT
    A.emp_no
    , C.emp_nm
    , B.certi_nm
FROM tb_emp_certi A, tb_certi B, tb_emp C
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
ORDER BY A.emp_no, B.certi_cd
;

-- ����� �����ȣ�� ����̸��� �μ��̸��� ��� �ڰ������� ��ȸ�ϰ� ����
SELECT
    A.emp_no
    , C.emp_nm
    , B.certi_nm
    , C.dept_cd
    , D.dept_nm
FROM tb_emp_certi A
    , tb_certi B
    , tb_emp C
    , tb_dept D
WHERE A.certi_cd = B.certi_cd
    AND A.emp_no = C.emp_no
    AND C.dept_cd = D.dept_cd
ORDER BY A.emp_no, B.certi_cd
;

-- �μ��� �� �ڰ��� ��� ���� ��ȸ
SELECT
    b.dept_cd
    , COUNT(A.certi_cd) "�μ��� �ڰ��� ��"
    , c.dept_nm
FROM tb_emp_certi A, tb_emp B, tb_dept C
WHERE A.emp_no = B.emp_no
    AND b.dept_cd = c.dept_cd
GROUP BY b.dept_cd, c.dept_nm
ORDER BY B.dept_cd
;


-- # INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���ΰ����Դϴ�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

-- ���νÿ� ����� �����ȣ, �����, �ּ�, �μ��ڵ�, �μ����� ��ȸ�ϰ� �ʹ�.
SELECT 
    A.emp_no
    , A.emp_nm
    , A.addr
    , A.dept_cd
    , b.dept_nm
FROM tb_emp A, tb_dept B
WHERE A.addr LIKE '%����%'
    AND A.dept_cd = B.dept_cd
    AND A.emp_nm LIKE '��%'
ORDER BY A.emp_no
;


-- JOIN ON (ANSI ǥ�� ����)
-- 1. FROM�� ��, WHERE �� ��
-- 2. JOIN Ű���� �ڿ��� ������ ���̺���� ���
-- 3. ON Ű���� �ڿ��� ���� ������ ���
-- 4. ���� ���� ������(ON��) �Ϲ� ���� ������ (WHERE��)�� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��ϸ� JOIN ������ �������̳� ���������� ���� �߰� ������ ����
SELECT 
    A.emp_no
    , A.emp_nm
    , A.addr
    , A.dept_cd
    , b.dept_nm
FROM tb_emp A 
INNER JOIN tb_dept B  -- JOIN�̶�� ���� �տ� INNER�� �����Ǿ ������ ����
ON A.dept_cd = B.dept_cd
WHERE A.addr LIKE '%����%' 
    AND A.emp_nm LIKE '��%'
ORDER BY A.emp_no
;

-- 1980���� ������� ���, �����, �μ���, �ڰ�����, ������ڸ� ��ȸ
SELECT
    E.emp_no, E.emp_nm, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E, tb_dept D, tb_emp_certi EC, tb_certi C
WHERE E.dept_cd = D.dept_cd
    AND EC.certi_cd = C.certi_cd
    AND E.emp_no = EC.emp_no
    AND E.birth_de BETWEEN '19800101' AND '19891231'
;

SELECT
    E.emp_no, E.emp_nm, E.birth_de, D.dept_nm, C.certi_nm, EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D 
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


-- JOIN ON �������� ī�׽þ� �� �����
SELECT
    *
FROM test_a A
CROSS JOIN test_b B
;


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�,
--    ALIAS�� ���̺���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� N�� �̻��̸� ���� ������ N���� ó���˴ϴ�. (N > 1)

-- ��� ���̺�� �μ� ���̺��� ����
SELECT
    A.emp_no
    , A.emp_nm
    , dept_cd -- NATURAL JOIN�� �� �տ� ��Ī�� ���̸� �ȵȴ�.
    , B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
--ON A.dept_cd = B.dept_cd
;



-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
--    ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ����������
--    �ο��� �� �ֽ��ϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.

SELECT
    A.emp_no
    , A.emp_nm
    , dept_cd -- USING �� �� �տ� ��Ī�� ���̸� �ȵȴ�.
    , B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;

SELECT
    *
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;


SELECT
    *
FROM tb_emp A
NATURAL JOIN tb_dept B
;

SELECT
    *
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;



