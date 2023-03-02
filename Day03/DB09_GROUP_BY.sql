-- 집계함수를 사용하기 위해서 / 그룹핑
USE sqldb;

-- GROUP BY 에 작성된 컬럼명만 SELECT에 쓸 수 있음
SELECT userID AS '아이디' /*GROUP BY에 적혀있어서 가능... " * " 은 사용 불가능*/
	 , SUM(price) AS '구매가격'  /* 원래있던 테이블의 컬럼이 아니라 새로 만들어진 컬럼이여서 사용이 가능해짐 ... price만 쓰면 오류생김 */ 	
     , AVG(amount) AS '평균구매개수'
  FROM buytbl
 GROUP BY userID;
 
 SELECT userID AS '아이디' 	
     , AVG(amount) AS '평균구매개수'
  FROM buytbl
 GROUP BY userID; 
 
 -- HAVING
SELECT userID
	 , SUM(price * amount) AS '총액'
  FROM buytbl
 GROUP BY userID
 HAVING SUM(price * amount) >= 1000; 
 -- HAVINIG은 집계함수등의 결과값을 조건으로 필터링하기 위함,,그룹바이 뒤에 써야한다...
 SELECT userID
	 , SUM(price * amount) AS '총액'
  FROM buytbl
 GROUP BY userID
 HAVING 총액 >= 1000; 
 
 -- ROLLUP 전체합계
  SELECT userID AS '아이디' 	
     , SUM(price * amount) AS '총액'
  FROM buytbl
 GROUP BY userID 
  WITH ROLLUP;
  
  
 