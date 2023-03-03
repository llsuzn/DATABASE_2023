-- 쇼핑몰에 가입하고 물건을 한 번도 구매하지 않은 회원까지 모두 출력
SELECT u.*
	 , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u
  LEFT OUTER JOIN buytbl AS b
  ON u.userID = b.userID
WHERE b.userID IS NULL;  

-- 학생중에 동아리에 가입하지 않은 학생
SELECT s.stdName, s.addr
	 , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
	ON s.stdName = j.stdName
  LEFT OUTER JOIN clubtbl AS c
    ON c.clubName = j.clubName
 UNION -- 두 쿼리 결과를 합쳐준다 
-- 학생중에 아무도 가입하지 않은 동아리
SELECT s.stdName, s.addr
	 , j.num, c.clubName, c.roomNo
  FROM stdtbl AS s
  LEFT OUTER JOIN stdclubtbl AS j
	ON s.stdName = j.stdName
 RIGHT JOIN clubtbl AS c
    ON c.clubName = j.clubName;    
    
    
    
SELECT name
     , height
  FROM usertbl
 WHERE height NOT IN  ( SELECT height
						  FROM usertbl	
						 WHERE name LIKE '김경호%');