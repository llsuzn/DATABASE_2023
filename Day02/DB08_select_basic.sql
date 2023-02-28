-- Active: 1677572639056@@127.0.0.1@3306@sqldb
-- 사용 데이터베이스 변경
USE homeplus;

-- 한 문장 끝은 ;으로 마침
SELECT * FROM indextbl;
-- 위의 명령어랑 똑같은 내용 
SELECT * FROM homeplus.indextbl;

-- homeplus_user은 접근이 안된다....homeplus_user는 homeplus에만 접근이 가능하기 때문
-- 다른 DB 테이블에서 데이터를 가져오려면
SELECT * FROM employees.titles;

-- 필요한 컬럼만 가져오려면
SELECT first_name, last_name FROM indextbl;

-- SQLDB를 사용
USE sqldb;

-- 조건절 검색
SELECT userID
	 , name
     , birthYear
     , height 
  FROM usertbl 
 WHERE name = '김경호';

-- 관계 연산자
SELECT *
  FROM usertbl
 WHERE birthYear >= 1970
   AND height >= 182;

-- 사이의 값을 조회
SELECT * 
  FROM usertbl
 WHERE height >= 180
   AND height <= 183;

SELECT * 
  FROM usertbl
 WHERE height BETWEEN 180 AND 183;
 
-- IN 연산자 
SELECT *
  FROM usertbl
 WHERE addr = '경북' OR addr = '경남' OR addr = '전남';

SELECT *
  FROM usertbl
 WHERE addr IN('경북','경남','전남');
 
-- 문자열 검색 - 뉴스 본문안에서 일정단어를 검색 ( % , _ ) 와 같이 사용
SELECT * 
  FROM usertbl
 WHERE name LIKE '%김%'
    OR name LIKE '이__';

--  SubQuery
SELECT name
	 , height
  FROM usertbl
 WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');
 
-- 정렬 ORDER BY : default ASC
-- 내림차순 : DESC
SELECT NAME
     , birthYear
     , height
  FROM usertbl
 WHERE birthYear > 1069
 ORDER BY birthYear DESC,height ASC;

-- 중복제거 / 중복 제거할 칼럼만
SELECT DISTINCT birthYear
  FROM usertbl;
  
--  LIMIT 갯수 제한
USE homeplus;
-- 상위 5개만 나옴
SELECT * FROM indextbl
 LIMIT 5;
 
USE sqlDB; 
-- 조회화면서 새로운 테이블 생성
CREATE TABLE elec_buytbl_new
SELECT num 
	 , prodName
     , price
  FROM buytbl
 WHERE groupName = '전자'; 