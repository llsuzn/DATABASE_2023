-- 변수 사용
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar1;
SET @myVar2 = '가수이름 ==>' ;

SELECT @myVar2,name
  FROM usertbl
 WHERE height > 170; 
 
SELECT name, height + @myVar1
  FROM usertbl;	
  
-- 형변환
-- 숫자를 문자로
SELECT CAST(birthYear AS CHAR) FROM usertbl;
SELECT CAST(CONVERT(birthYear , CHAR) AS SIGNED INTEGER) FROM usertbl;

-- 문자를 숫자로 (X) 
SELECT CAST(addr AS decimal) FROM usertbl;
-- 이건 가능함
SELECT CAST('1000' AS decimal);  

-- 암시적 형변환
SELECT 200 + 300;
-- CONCAT : 문자열 합치기
SELECT CONCAT('HELLO','WORLD');
SELECT CONCAT(200,'300'); -- MySQL 이외에서는 '200300' 나옴

SELECT 4 = 2; -- False 여서 0 출력


/* 내장함수 리스트*/
-- 흐름함수
SELECT IF(100>200, '참','거짓') AS '100>200';

SELECT IFNULL(NULL,'널입니다');
-- NULL은 계산이 안된다(NULL + 10 = NULL)
SELECT IFNULL(NULL,0) + 100; -- NULL이 들어있다면 0으로 바꾼후 100을 더해주자

SELECT NULLIF(100,100); -- 두 수가 같다면 NULL, 다르면 첫번째 값이 나옴

-- 쿼리 작성시 많이 사용
SELECT name
     , birthYear
     , addr
     , CASE addr
       WHEN '서울' THEN '수도권'
       WHEN '경기' THEN '수도권'
       WHEN '부산' THEN '광역권'
       WHEN '한양' THEN '조선권'
       ELSE '지역권' END AS '권역'
  FROM usertbl;

-- 문자열 함수
SELECT ASCII('A'), CHAR(65), ASCII('a');
SELECT ASCII('안'); -- 한글은 사용하면 안됨

-- CHAR_LENGTH(글자길이),LENGTH(바이트)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
-- UTF-8
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다'); -- 한글은 한 글자당 3바이트

SELECT REPLACE('Hello World','Hello','Byebye');
-- 데이터베이스는 인덱스를 1부터 시작
SELECT INSTR('안녕하세요, 여러분','여'); -- 1 2 3 4 5 6 7 8(여)
-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3), RIGHT('ABCDEFGHIJKLMN',3);
-- UPPER, LOWER
SELECT UPPER('Hello World'), LOWER('Hello World');
-- LTRIM, RTRIM, TRIM
SELECT LTRIM('          Hello World!          ') AS 'ltrim'
     , RTRIM('          Hello World!          ') AS 'rtrim'
     , TRIM('          Hello World!          ') AS 'trim';
     
-- 'Hello' * 3
SELECT REPEAT('Hello',3);

-- substring
SELECT SUBSTRING('대한민국만세',3,2);

/* 수학함수 */
-- 절댓값
SELECT ABS(-10);
-- 올림 내림 반올림
SELECT CEILING(4.3),FLOOR(4.9),ROUND(4.4);
-- 나머지
SELECT MOD(157,10);
-- RANDOM (0부터 1사이의 소수점 나옴)
SELECT RAND(),FLOOR(1 + (RAND() * 6)); -- 주사위놀이
-- 날짜 및 시간함수
SELECT NOW(); -- 현재 날짜
SELECT ADDDATE('2023-03-02',INTERVAL 10 DAY); 
SELECT YEAR(NOW());
SELECT DATE(NOW());
SELECT TIME(NOW());
SELECT DAYOFWEEK(NOW()); # 1(일) ~ 7(토)
SELECT LAST_DAY('2023-02-01');


/*시스템함수*/
SELECT USER();
SELECT DATABASE();
-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET price = price * 2;
SELECT ROW_COUNT();
SELECT VERSION();