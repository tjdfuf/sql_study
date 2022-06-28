

-- DML : ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE
-- R(��ȸ)/   C       U      D (����)

INSERT INTO board
    (bno, title, content, writer, reg_date)
VALUES
    (1, '�����̾�~', '������~~', '�Ѹ�', SYSDATE + 1);
    
-- title NN(NOT NULL) �������� ���� -- ���Խ���
INSERT INTO board
    (bno, content, writer)
VALUES
    (2, '����ȣȣ~~', '������');
    
-- FK�� UNIQUE ���� ���� ����
INSERT INTO board
    (bno, title, writer)
VALUES
    (1, '����ȣȣ~~~', '������');    
    
    
INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '����ȣȣ����~~~', '±±��');    
    
-- �÷��� �������� �ʾƵ� ������, ��� �÷��� ���� �����ؾߵǰ� ������ ���� ������� �����ؾߵȴ�. 
-- �ǹ������� �� ����� ������� �ʴ´�.
INSERT INTO board
VALUES
    (3, '��������~~~~', '±±��', '���볻��', SYSDATE + 30);    
    
    
-- ������ ����
UPDATE board
SET title = '������ �����̾�~'  -- �ٲ� �÷��� ��
WHERE bno = 3;  -- � ���� �ٲ���
    
UPDATE board
SET writer = '������'
    , content = '�޷ո޷ո� fix'
WHERE bno = 2;
    
-- WHERE�� ������
UPDATE board
SET writer = '���۳�';


-- ������ ����
DELETE FROM board
WHERE bno = 1;

-- ��ü ������ ����
-- 1. WHERE���� ������ DELETE�� (�ѹ鰡��, ����Ŀ�� ���, �α׳���� ����)
DELETE FROM board;

-- 2. TRUNCATE TABLE (�ѹ� �Ұ���, �ڵ�Ŀ��, �α׸� ���� �� ����, ���̺� ���� �ʱ���·� ����)
TRUNCATE TABLE board;

-- 3. DROP TABLE (�ѹ� �Ұ���, �ڵ� Ŀ��, �α׸� ����� ����, ���̺� ������ ���� ������)
DROP TABLE board;
    
    
    
COMMIT;  -- ���������� Ȯ�� ��Ű�� �ʹ�.
ROLLBACK;  -- �ǵ�����  

SELECT * FROM board;..0













