

CREATE TABLE 일자별매출_93 (
    일자 DATE
    , 매출액 NUMBER(5)
);

INSERT INTO 일자별매출_93 VALUES ('2015-11-01', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-02', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-03', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-04', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-05', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-06', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-07', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-08', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-09', 1000);
INSERT INTO 일자별매출_93 VALUES ('2015-11-10', 1000);
COMMIT;

SELECT * FROM 일자별매출_93;


-- 보기 1
SELECT A.일자, SUM(A.매출액) AS 누적매출액
FROM 일자별매출_93 A
GROUP BY A.일자
ORDER BY A.일자;

-- 보기 2
SELECT B.일자, SUM(B.매출액) AS 누적매출액
FROM 일자별매출_93 A JOIN 일자별매출_93 B ON (A.일자 >= B.일자)
GROUP BY B.일자
ORDER BY B.일자
;


SELECT A.일자, A.매출액, B.일자, B.매출액 AS 누적매출액
FROM 일자별매출_93 A JOIN 일자별매출_93 B ON (A.일자 >= B.일자)
--GROUP BY B.일자
ORDER BY B.일자
;

-- 보기 3
SELECT A.일자, SUM(B.매출액) AS 누적매출액
FROM 일자별매출_93 A JOIN 일자별매출_93 B ON (A.일자 >= B.일자)
GROUP BY A.일자
ORDER BY A.일자
;

-- 보기 4


-- 86번
drop table 회원기본정보_86;
drop table 회원상세정보_86;
CREATE TABLE 회원기본정보_86 (
    user_id VARCHAR2(200) PRIMARY KEY
);

CREATE TABLE 회원상세정보_86 (
    user_id VARCHAR2(200)
    
);
ALTER TABLE 회원상세정보_86
ADD CONSTRAINT fk_user_id  -- 이름
FOREIGN KEY (user_id) -- 어디에
references 회원기본정보_86 (user_id); -- 어떤걸 대상으로

INSERT INTO 회원기본정보_86 VALUES ('abc01');
INSERT INTO 회원기본정보_86 VALUES ('abc02');
INSERT INTO 회원기본정보_86 VALUES ('abc03');
COMMIT;

INSERT INTO 회원상세정보_86 VALUES ('abc01');
INSERT INTO 회원상세정보_86 VALUES ('abc02');
INSERT INTO 회원상세정보_86 VALUES ('abc03');
COMMIT;

SELECT * FROM 회원기본정보_86;
SELECT * FROM 회원상세정보_86;


-- 보기 1
SELECT user_id FROM 회원기본정보_86
MINUS
SELECT user_id FROM 회원상세정보_86
;


-- 보기 2
SELECT user_id FROM 회원기본정보_86
UNION ALL
SELECT user_id FROM 회원상세정보_86
;


-- 보기 3
SELECT user_id FROM 회원기본정보_86
INTERSECT
SELECT user_id FROM 회원상세정보_86
;

SELECT A.user_id 
FROM 회원기본정보_86 A 
JOIN 회원상세정보_86 B 
ON A.user_id = B.user_id
;

-- 보기 4
SELECT user_id FROM 회원기본정보_86
INTERSECT
SELECT user_id FROM 회원상세정보_86
;

SELECT user_id FROM 회원기본정보_86
UNION
SELECT user_id FROM 회원상세정보_86
;


-- 72번
DROP TABLE 고객;
DROP TABLE 단말기;
DROP TABLE OS;

CREATE TABLE OS (
    OSID NUMBER(4) PRIMARY KEY
    , OS명 VARCHAR2(100)    
);

CREATE TABLE 단말기 (
    단말기_ID NUMBER(5) PRIMARY KEY
    , 단말기명 VARCHAR2(100)
    , OSID NUMBER(4)
);

ALTER TABLE 단말기
ADD CONSTRAINT fk_OSID
FOREIGN KEY (OSID)
REFERENCES OS (OSID)
;

CREATE TABLE 고객 (
    고객번호 NUMBER(5) PRIMARY KEY
    , 고객명 VARCHAR2(100)
    , 단말기_ID NUMBER(5)
);

ALTER TABLE 고객
ADD CONSTRAINT fk_단말기_ID
FOREIGN KEY (단말기_ID)
REFERENCES 단말기 (단말기_ID)
;

INSERT INTO OS VALUES (100, 'Android');
INSERT INTO OS VALUES (200, 'IOS');
INSERT INTO OS VALUES (300, 'Bada');

INSERT INTO 단말기 VALUES (1000, 'A1000', 100);
INSERT INTO 단말기 VALUES (2000, 'B2000', 100);
INSERT INTO 단말기 VALUES (3000, 'C3000', 200);
INSERT INTO 단말기 VALUES (4000, 'D3000', 300);

INSERT INTO 고객 VALUES (11000, '홍길동', 1000);
INSERT INTO 고객 VALUES (12000, '강감찬', null);
INSERT INTO 고객 VALUES (13000, '이순신', null);
INSERT INTO 고객 VALUES (14000, '안중근', 3000);
INSERT INTO 고객 VALUES (15000, '고길동', 4000);
INSERT INTO 고객 VALUES (16000, '이대로', 4000);
COMMIT;

SELECT * FROM OS;
SELECT * FROM 단말기;
SELECT * FROM 고객;


SELECT
    A.고객번호
    , A.고객명
    , B.단말기_ID
    , B.단말기명
    , C.OSID
    , C.OS명
FROM 고객 A 
LEFT OUTER JOIN 단말기 B
ON (A.고객번호 IN (11000, 12000) AND A.단말기_ID = B.단말기_ID)
LEFT OUTER JOIN OS C
ON (B.OSID = C.OSID)
ORDER BY A.고객번호
;


-- #91번
DROP TABLE 부서_91;

-- 테이블 작성
-- 부서테이블
CREATE TABLE 부서_91 (
 부서코드 VARCHAR2(20),
 부서명 VARCHAR2(100),
 상위부서코드 VARCHAR2(20),
 CONSTRAINT pk_부서_91 PRIMARY KEY(부서코드)
);

-- fk 선언
ALTER TABLE 부서_91 
ADD CONSTRAINT fk_상위부서코드_91 
FOREIGN KEY (상위부서코드)
REFERENCES 부서_91 (부서코드);

INSERT INTO 부서_91 VALUES(100, '아시아부', NULL);
INSERT INTO 부서_91 VALUES(110, '한국지사', 100);
INSERT INTO 부서_91 VALUES(111, '서울지점', 110);
INSERT INTO 부서_91 VALUES(112, '부산지점', 110);
INSERT INTO 부서_91 VALUES(120, '일본지사', 100);
INSERT INTO 부서_91 VALUES(121, '도쿄지점', 120);
INSERT INTO 부서_91 VALUES(122, '오사카지점', 120);
INSERT INTO 부서_91 VALUES(130, '중국지사', 100);
INSERT INTO 부서_91 VALUES(131, '베이징지점', 130);
INSERT INTO 부서_91 VALUES(132, '상하이지점', 130);
INSERT INTO 부서_91 VALUES(200, '남유럽지부', NULL);
INSERT INTO 부서_91 VALUES(210, '스페인지사', 200);
INSERT INTO 부서_91 VALUES(211, '마드리드지점', 210);
INSERT INTO 부서_91 VALUES(212, '그라나다지점', 210);
INSERT INTO 부서_91 VALUES(220, '포루투갈지사', 200);
INSERT INTO 부서_91 VALUES(221, '리스본지점', 220);
INSERT INTO 부서_91 VALUES(222, '그라나다지점', 220);

COMMIT;

-- 매출 테이블
DROP TABLE 매출_91;
CREATE TABLE 매출_91(
부서코드 VARCHAR2(20),
매출액 NUMBER(20));

INSERT INTO 매출_91 VALUES(111,1000);
INSERT INTO 매출_91 VALUES(112,2000);
INSERT INTO 매출_91 VALUES(121,1500);
INSERT INTO 매출_91 VALUES(122,1000);
INSERT INTO 매출_91 VALUES(131,1500);
INSERT INTO 매출_91 VALUES(132,2000);
INSERT INTO 매출_91 VALUES(211,2000);
INSERT INTO 매출_91 VALUES(212,1500);
INSERT INTO 매출_91 VALUES(221,1000);
INSERT INTO 매출_91 VALUES(222,2000);
COMMIT;

SELECT * FROM 부서_91;
SELECT * FROM 매출_91;

-- 보기 1번
SELECT A.부서코드, A.부서명, A.상위부서코드, B.매출액, LVL
FROM (
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY PRIOR 상위부서코드 = 부서코드
    UNION
    SELECT 부서코드, 부서명, 상위부서코드, LEVEL AS LVL
    FROM 부서_91
    START WITH 부서코드 = '120'
    CONNECT BY 상위부서코드 = PRIOR 부서코드) A
LEFT OUTER JOIN 매출_91 B
ON (A.부서코드 = B.부서코드)
ORDER BY A.부서코드
;


















