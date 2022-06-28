

CREATE TABLE ���ں�����_93 (
    ���� DATE
    , ����� NUMBER(5)
);

INSERT INTO ���ں�����_93 VALUES ('2015-11-01', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-02', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-03', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-04', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-05', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-06', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-07', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-08', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-09', 1000);
INSERT INTO ���ں�����_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM ���ں�����_93;


-- ���� 1
SELECT A.����, SUM(A.�����) AS ���������
FROM ���ں�����_93 A
GROUP BY A.����
ORDER BY A.����;

-- ���� 2
SELECT B.����, SUM(B.�����) AS ���������
FROM ���ں�����_93 A JOIN ���ں�����_93 B ON (A.���� >= B.����)
GROUP BY B.����
ORDER BY B.����
;


SELECT A.����, A.�����, B.����, B.����� AS ���������
FROM ���ں�����_93 A JOIN ���ں�����_93 B ON (A.���� >= B.����)
--GROUP BY B.����
ORDER BY B.����
;

-- ���� 3
SELECT A.����, SUM(B.�����) AS ���������
FROM ���ں�����_93 A JOIN ���ں�����_93 B ON (A.���� >= B.����)
GROUP BY A.����
ORDER BY A.����
;

-- ���� 4


-- 86��
drop table ȸ���⺻����_86;
drop table ȸ��������_86;
CREATE TABLE ȸ���⺻����_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE ȸ��������_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE ȸ��������_86
ADD CONSTRAINT fk_user_id  -- �̸�
FOREIGN KEY (user_id) -- ���
references ȸ���⺻����_86 (user_id); -- ��� �������

INSERT INTO ȸ���⺻����_86 VALUES ('abc01');
INSERT INTO ȸ���⺻����_86 VALUES ('abc02');
INSERT INTO ȸ���⺻����_86 VALUES ('abc03');
COMMIT;

INSERT INTO ȸ��������_86 VALUES ('abc01');
INSERT INTO ȸ��������_86 VALUES ('abc02');
INSERT INTO ȸ��������_86 VALUES ('abc03');
COMMIT;

SELECT * FROM ȸ���⺻����_86;
SELECT * FROM ȸ��������_86;


-- ���� 1
SELECT user_id FROM ȸ���⺻����_86
MINUS
SELECT user_id FROM ȸ��������_86
;


-- ���� 2
SELECT user_id FROM ȸ���⺻����_86
UNION ALL
SELECT user_id FROM ȸ��������_86
;


-- ���� 3
SELECT user_id FROM ȸ���⺻����_86
INTERSECT
SELECT user_id FROM ȸ��������_86
;

SELECT A.user_id 
FROM ȸ���⺻����_86 A 
JOIN ȸ��������_86 B 
ON A.user_id = B.user_id
;

-- ���� 4
SELECT user_id FROM ȸ���⺻����_86
INTERSECT
SELECT user_id FROM ȸ��������_86
;

SELECT user_id FROM ȸ���⺻����_86
UNION
SELECT user_id FROM ȸ��������_86
;


-- 72��
DROP TABLE ��;
DROP TABLE �ܸ���;
DROP TABLE OS;

CREATE TABLE OS (
    OSID NUMBER(4) PRIMARY KEY
    , OS�� VARCHAR2(100)    
);

CREATE TABLE �ܸ��� (
    �ܸ���_ID NUMBER(5) PRIMARY KEY
    , �ܸ���� VARCHAR2(100)
    , OSID NUMBER(4)
);

ALTER TABLE �ܸ���
ADD CONSTRAINT fk_OSID
FOREIGN KEY (OSID)
REFERENCES OS (OSID)
;

CREATE TABLE �� (
    ����ȣ NUMBER(5) PRIMARY KEY
    , ���� VARCHAR2(100)
    , �ܸ���_ID NUMBER(5)
);

ALTER TABLE ��
ADD CONSTRAINT fk_�ܸ���_ID
FOREIGN KEY (�ܸ���_ID)
REFERENCES �ܸ��� (�ܸ���_ID)
;

INSERT INTO OS VALUES (100, 'Android');
INSERT INTO OS VALUES (200, 'IOS');
INSERT INTO OS VALUES (300, 'Bada');

INSERT INTO �ܸ��� VALUES (1000, 'A1000', 100);
INSERT INTO �ܸ��� VALUES (2000, 'B2000', 100);
INSERT INTO �ܸ��� VALUES (3000, 'C3000', 200);
INSERT INTO �ܸ��� VALUES (4000, 'D3000', 300);

INSERT INTO �� VALUES (11000, 'ȫ�浿', 1000);
INSERT INTO �� VALUES (12000, '������', null);
INSERT INTO �� VALUES (13000, '�̼���', null);
INSERT INTO �� VALUES (14000, '���߱�', 3000);
INSERT INTO �� VALUES (15000, '��浿', 4000);
INSERT INTO �� VALUES (16000, '�̴��', 4000);
COMMIT;

SELECT * FROM OS;
SELECT * FROM �ܸ���;
SELECT * FROM ��;


SELECT
    A.����ȣ
    , A.����
    , B.�ܸ���_ID
    , B.�ܸ����
    , C.OSID
    , C.OS��
FROM �� A 
LEFT OUTER JOIN �ܸ��� B
ON (A.����ȣ IN (11000, 12000) AND A.�ܸ���_ID = B.�ܸ���_ID)
LEFT OUTER JOIN OS C
ON (B.OSID = C.OSID)
ORDER BY A.����ȣ
;


-- #91��
DROP TABLE �μ�_91;

-- ���̺� �ۼ�
-- �μ����̺�
CREATE TABLE �μ�_91 (
 �μ��ڵ� VARCHAR2(20),
 �μ��� VARCHAR2(100),
 �����μ��ڵ� VARCHAR2(20),
 CONSTRAINT pk_�μ�_91 PRIMARY KEY(�μ��ڵ�)
);

-- fk ����
ALTER TABLE �μ�_91 
ADD CONSTRAINT fk_�����μ��ڵ�_91 
FOREIGN KEY (�����μ��ڵ�)
REFERENCES �μ�_91 (�μ��ڵ�);

INSERT INTO �μ�_91 VALUES(100, '�ƽþƺ�', NULL);
INSERT INTO �μ�_91 VALUES(110, '�ѱ�����', 100);
INSERT INTO �μ�_91 VALUES(111, '��������', 110);
INSERT INTO �μ�_91 VALUES(112, '�λ�����', 110);
INSERT INTO �μ�_91 VALUES(120, '�Ϻ�����', 100);
INSERT INTO �μ�_91 VALUES(121, '��������', 120);
INSERT INTO �μ�_91 VALUES(122, '����ī����', 120);
INSERT INTO �μ�_91 VALUES(130, '�߱�����', 100);
INSERT INTO �μ�_91 VALUES(131, '����¡����', 130);
INSERT INTO �μ�_91 VALUES(132, '����������', 130);
INSERT INTO �μ�_91 VALUES(200, '����������', NULL);
INSERT INTO �μ�_91 VALUES(210, '����������', 200);
INSERT INTO �μ�_91 VALUES(211, '���帮������', 210);
INSERT INTO �μ�_91 VALUES(212, '�׶󳪴�����', 210);
INSERT INTO �μ�_91 VALUES(220, '������������', 200);
INSERT INTO �μ�_91 VALUES(221, '����������', 220);
INSERT INTO �μ�_91 VALUES(222, '�׶󳪴�����', 220);

COMMIT;

-- ���� ���̺�
DROP TABLE ����_91;
CREATE TABLE ����_91(
�μ��ڵ� VARCHAR2(20),
����� NUMBER(20));

INSERT INTO ����_91 VALUES(111,1000);
INSERT INTO ����_91 VALUES(112,2000);
INSERT INTO ����_91 VALUES(121,1500);
INSERT INTO ����_91 VALUES(122,1000);
INSERT INTO ����_91 VALUES(131,1500);
INSERT INTO ����_91 VALUES(132,2000);
INSERT INTO ����_91 VALUES(211,2000);
INSERT INTO ����_91 VALUES(212,1500);
INSERT INTO ����_91 VALUES(221,1000);
INSERT INTO ����_91 VALUES(222,2000);
COMMIT;

SELECT * FROM �μ�_91;
SELECT * FROM ����_91;

-- ���� 1��
SELECT A.�μ��ڵ�, A.�μ���, A.�����μ��ڵ�, B.�����, LVL
FROM (
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY PRIOR �����μ��ڵ� = �μ��ڵ�
    UNION
    SELECT �μ��ڵ�, �μ���, �����μ��ڵ�, LEVEL AS LVL
    FROM �μ�_91
    START WITH �μ��ڵ� = '120'
    CONNECT BY �����μ��ڵ� = PRIOR �μ��ڵ�) A
LEFT OUTER JOIN ����_91 B
ON (A.�μ��ڵ� = B.�μ��ڵ�)
ORDER BY A.�μ��ڵ�
;


















