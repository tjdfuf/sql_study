

-- DML : 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE
-- R(조회)/   C       U      D (갱신)

INSERT INTO board
    (bno, title, content, writer, reg_date)
VALUES
    (1, '제목이야~', '랄랄라~~', '둘리', SYSDATE + 1);
    
-- title NN(NOT NULL) 제약조건 위반 -- 삽입실패
INSERT INTO board
    (bno, content, writer)
VALUES
    (2, '하하호호~~', '마이콜');
    
-- FK의 UNIQUE 제약 조건 위반
INSERT INTO board
    (bno, title, writer)
VALUES
    (1, '하하호호~~~', '마이콜');    
    
    
INSERT INTO board
    (bno, title, writer)
VALUES
    (2, '하하호호히히~~~', '짹짹이');    
    
-- 컬럼을 지정하지 않아도 되지만, 모든 컬럼의 값을 지정해야되고 순서는 생성 순서대로 지정해야된다. 
-- 실무에서는 이 방법을 사용하지 않는다.
INSERT INTO board
VALUES
    (3, '제목제목~~~~', '짹짹이', '내용내용', SYSDATE + 30);    
    
    
-- 데이터 수정
UPDATE board
SET title = '수정된 제목이야~'  -- 바꿀 컬럼과 값
WHERE bno = 3;  -- 어떤 것을 바꿀지
    
UPDATE board
SET writer = '수정맨'
    , content = '메롱메롱메 fix'
WHERE bno = 2;
    
-- WHERE절 생략시
UPDATE board
SET writer = '나쁜놈';


-- 데이터 삭제
DELETE FROM board
WHERE bno = 1;

-- 전체 데이터 삭제
-- 1. WHERE절을 생략한 DELETE절 (롤백가능, 수동커밋 기능, 로그남기기 가능)
DELETE FROM board;

-- 2. TRUNCATE TABLE (롤백 불가능, 자동커밋, 로그를 남길 수 없음, 테이블 생성 초기상태로 복귀)
TRUNCATE TABLE board;

-- 3. DROP TABLE (롤백 불가능, 자동 커밋, 로그를 남길수 없음, 테이블 구조가 완전 삭제됨)
DROP TABLE board;
    
    
    
COMMIT;  -- 영구적으로 확정 시키고 싶다.
ROLLBACK;  -- 되돌리기  

SELECT * FROM board;..0













