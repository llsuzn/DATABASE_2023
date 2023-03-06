USE bookrentalshop;

-- 1번 문제
SELECT CONCAT(LEFT(Names,1),',',RIGHT(Names,2)) AS '회원명'
	 , SUBSTRING(Addr,4,4) AS '주소'
     , Mobile AS '폰번호'
     , UPPER(Email) AS '이메일'
  FROM membertbl
 ORDER BY Names DESC; 

-- 2번 문제
SELECT d.Names AS '장르'
	 , b.Author AS '작가'
     , b.Names AS '책제목'
  FROM bookstbl AS b
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 ORDER BY d.Names,b.Author ASC;

-- 3번 문제
INSERT INTO divtbl
(Division,Names)
VALUES
('I002','네트워크');

-- 4번 문제
UPDATE membertbl
   SET Levels = 'D'
     , Mobile = '010-9839-9999' 
 WHERE Names = '성명건'; 

-- 5번 문제
SELECT IFNULL(divtbl.Names,'--총합--') AS '장르' 
	  , CONCAT(bb.총합,'원') AS '장르별 총합계'
  FROM (
		SELECT b.Division, FORMAT(SUM(b.Price),0) AS '총합'
		  FROM bookstbl AS b
         GROUP BY b.Division
         WITH ROLLUP
        ) bb
ORDER BY 장르 ASC;