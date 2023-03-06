-- BookRentalShop 연습
USE bookrentalshop;
SELECT * FROM membertbl;

-- 서브쿼리 : 한 컬럼당 하나씩 실행/비교 -> 속도가 느리다
SELECT b.Author AS '저자' -- 1
--     , b.Division AS '장르' -- 2
     , (SELECT Names 
          FROM divtbl 
         WHERE Division = b.Division) AS '장르' -- 2' : 서브쿼리
     , b.Names AS '책제목' -- 3
     , b.ISBN -- 4
     , b.Price AS '금액' -- 5
  FROM bookstbl AS b
 ORDER by 3; -- 3 : '책제목' or b.Names /  default : ASC ... 숫자로 적는걸 권장하진 않음
 
-- 조인 : 키 끼리 비교/정렬 -> 속도 빠름 ... 사용 권장
SELECT b.Author AS '저자'
  -- , b.Division 
     , d.Names AS '장르'
     , b.Names AS '책제목'
     , b.ISBN
     , b.Price AS '금액'
  FROM bookstbl AS b
  INNER JOIN divtbl AS d
     ON b.Division = d.Division
  ORDER BY b.Names;     
  
-- 서브쿼리 사용법
-- 장르로 그룹핑
SELECT (SELECT Names 
          FROM divtbl 
         WHERE Division = bb.Division) AS '장르'
	   , bb.총합
  FROM (
		SELECT b.Division
			 , SUM(b.Price) AS '총합'
		  FROM bookstbl AS b
		 GROUP BY b.Division
		) AS bb;

-- 내부조인 
SELECT m.Names '이름'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalDate AS '대여일자'
     , IFNULL(r.returnDate,'미반납') AS '반납일자' -- 데이터 형이 VARCHAR이여서 '미반납' 가능
     , r.bookIdx 
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
 INNER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 INNER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
 INNER JOIN divtbl AS d
    ON b.Division = d.Division;
 
-- 외부조인
-- KEY는 PK 이기 때문에 NOT NULL이여야 하는데 NULL값이 있다면 OUTER JOIN이다
SELECT m.Names '이름'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , r.rentalIdx
     , r.rentalDate AS '대여일자'
     , r.returnDate AS '반납일자'
     , r.bookIdx 
     , b.Names AS '책제목'
     , d.Names AS '장르'
     , b.Price AS '금액'
  FROM membertbl AS m
-- 부모테이블이 membertbl이기 때문에 LEFT JOIN 해야함  
  LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
  LEFT OUTER JOIN bookstbl AS b
    ON r.bookIdx = b.bookIdx
  LEFT OUTER JOIN divtbl AS d
    ON b.Division = d.Division
 WHERE r.rentalIdx IS NULL;    

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 