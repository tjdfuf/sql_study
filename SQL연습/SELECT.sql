

-- SELECT �⺻
SELECT
    emp_no, emp_nm  -- 2
FROM tb_emp;   -- 1

SELECT
    certi_cd,certi_nm
FROM tb_certi;

SELECT
    *
FROM tb_certi;

SELECT
     emp_nm, emp_no  -- ��ȸ �� �� ������ �� ������� ����(���� �����Ͱ� ����Ǵ°� �ƴ�)
FROM tb_emp;

-- DISTINCT : �ߺ����� �����ϰ� ��ȸ

SELECT ALL  -- SELECT �ڿ� ALL�̶�� �ܾ ��������
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    certi_nm, issue_insti_nm  -- �Ѵ� �����͸� �ɷ���
FROM tb_certi;

-- �� ��Ī (colrum alias) ����
SELECT
    certi_cd AS "�ڰ��� �ڵ�"  -- AS�� �׻� ���� ����, ���Ⱑ ������ "" ��������
    , certi_nm AS �ڰ�����    
    , issue_insti_nm �߱ޱ����
FROM tb_certi;

-- ���ڿ� ���� ������ ||
-- ex) SOLD(1000002) - �ѱ����������
SELECT 
    certi_nm || '('|| certi_cd ||') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;

-- ���� ���̺�(dual) : �ܼ� �������� ��ȸ�� �� ���
SELECT
    3 * 7 AS "���� ���"
FROM dual;

SELECT
    SYSDATE AS "���� �ð�"
FROM dual;
