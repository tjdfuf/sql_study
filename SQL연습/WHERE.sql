

-- WHERE 조건절 : 조회 결과 행을 제한하는 조건절
-- 성별으로 조회
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd = 2 
; 

-- PK로 WHERE절 동등조건을 만들면 반드시 단일행이 조회된다.
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE emp_no = 1000000003 -- 직원코드로 조회
;  


-- 비교 연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de >= '19900101'
    AND birth_de <= '19991231'
;

-- BETWEEN 연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

-- NOT BETWEEN 연산자
SELECT
    emp_no, emp_nm, birth_de, tel_no
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;


-- OR 연산자
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd = '100004' 
    OR dept_cd = '100006'
;

-- IN 연산자
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd IN ('100004', '100006')
;

-- NOT IN 연산자
SELECT
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN ('100004', '100006')
;

-- LIKE 연산자
-- 검색시 사용
-- 와일드 카드 랩핑 (% : 0글자 이상, _ : 1 단 1글자만)
SELECT
    emp_no, emp_nm
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

SELECT
    emp_no, emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%용인%'
;

-- 성씨가 김씨이면서, 부서가 100003, 100004, 100006번 중에 하나이면서, 
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
SELECT
    emp_no, emp_nm, birth_de, dept_cd
FROM tb_emp
WHERE 1 = 1 
    AND emp_nm LIKE '김%'
    AND dept_cd IN ('100003','100004','100006')
    AND birth_de BETWEEN '19900101' AND '19991231'
;-- 뒤 조건들을 모두 AND로 편하게 설정하고 
 -- 싶기 때문에 맨 처음 조건을 무조건 가능한 식으로 설정

-- 부정 일치 비교 연산자
-- !=, ^=, <>, 앞쪽에 NOT (oracle에서는 <>이 기호를 제일 많이 쓴다.)
SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd != 2 
;

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd ^= 2
;

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE sex_cd <> 2 
; 

SELECT
    emp_no, emp_nm, addr, sex_cd
FROM tb_emp
WHERE NOT sex_cd = 2 
; 

-- 성별코드가 1이 아니면서 성씨가 이씨가 아닌 사람들의
-- 사번, 이름, 성별코드를 조회하세요.

SELECT
    emp_no, emp_nm, sex_cd
FROM tb_emp
WHERE 1 = 1
    AND sex_cd <> 1
    AND emp_nm NOT LIKE '이%'
; 

-- null값 조회
SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE 1 = 1
    AND direct_manager_emp_no IS NULL
;

SELECT
    emp_no, emp_nm, direct_manager_emp_no
FROM tb_emp
WHERE 1 = 1
    AND direct_manager_emp_no IS NOT NULL
;

-- 연산자 우선순위 : NOT > AND > OR
-- 사원정보 중에 김씨이면서 수원 또는 일산에 사는 사원들의 정보
SELECT
    emp_no
    , emp_nm
    , addr
FROM tb_emp
WHERE 1 = 1
    AND emp_nm LIKE '김%'
    AND (addr LIKE '%수원%' OR addr LIKE '%일산%')
;







