-- INNER JOIN
SELECT s.stdName, s.addr, c.clubName, t.roomNo
  FROM stdtbl AS s
  JOIN stdclubtbl AS c
    ON s.stdName = c.stdName
  JOIN clubtbl AS t
    ON c.clubName = t.clubName;
    
-- INNER JOIN의 약식버전    
SELECT u.*
	 , b.prodName
     , b.groupName
     , b.price
     , b.amount
  FROM usertbl AS u, buytbl AS b
  WHERE u.userID = b.userID;      