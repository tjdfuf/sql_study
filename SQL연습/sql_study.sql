
-- DDL : 데이터 정의어
-- CREATE, ALTER, DROP, RENAME, TRUNCATE

DROP TABLE board;
DROP TABLE reply;

-- CRAETE TABLE : 테이블을 생성
CREATE TABLE board (
    bno NUMBER(10)                  -- 게시글 번호 / NOT NULL: 무조건 있어야되는것. UNIQUE: 유일한것 
    , title VARCHAR2(200) NOT NULL  -- 제목
    , writer VARCHAR2(40) NOT NULL  -- 글쓴이
    , content CLOB                  -- 글 내용
    , reg_date DATE DEFAULT SYSDATE -- 작성일 / DEFAULT SYSDATE: 현재 날짜 적힘
    , view_count NUMBER(10) DEFAULT 0  -- 조회수
); -- SQL은 실행시 ;단위로 실행. 전체실행X

-- ALTER : 데이터베이스의 구조를 변경

-- PK 설정 / 이대로 외워야됌. 처음 테이블을 만들 때 하는것이 좋으나 혹시나 안했다면 이렇게 추가.
ALTER TABLE board
ADD CONSTRAINT pk_board_bno
PRIMARY KEY (bno);

-- 데이터 추가
INSERT INTO board
    (bno, title, writer, content)
VALUES
    (1, '안녕?', '꾸꾸까까', '아하하하하하 ㅋㅋㅋ');
    
INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '맛있는 점심', '하하호호');

COMMIT;


SELECT * FROM board;

-- 연관관계 설정
-- 게시물과 댓글의 관계
--   1  :  M

-- 댓글 테이블 생성
CREATE TABLE REPLY (
    rno NUMBER(10)
    , r_content VARCHAR2(400)
    , r_writer VARCHAR2(40) NOT NULL
    , bno NUMBER(10) -- 연관관계설정시 부모의 PK를 가지고 있어야됌.
    , CONSTRAINT pk_reply_rno PRIMARY KEY (rno) -- PK 설정
);



-- 외래키 설정 (FOREIGN KEY) : 테이블 간의 관계 제약 설정
ALTER TABLE reply 
ADD CONSTRAINT fk_reply_bno
FOREIGN KEY (bno)
REFERENCES board (bno);


-- 컬럼 변경
-- 컬럼 추가
ALTER TABLE reply
ADD (r_reg_date DATE DEFAULT SYSDATE);


SELECT * FROM reply;

-- 컬럼 제거
ALTER TABLE board
DROP COLUMN view_count;

-- 컬럼 수정
ALTER TABLE board
MODIFY (title VARCHAR2(500));

SELECT * FROM board;

-- 테이블 삭제
DROP TABLE reply; -- 테이블 구조 삭제
TRUNCATE TABLE board; -- 테이블 내부 전체 삭제 - 롤백 불가

SELECT * FROM board;

    
















