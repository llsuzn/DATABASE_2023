-- JION(조인)
# INNER JOIN
SELECT b.num, b.userID, b.prodName
     , u.name, u.addr, u.birthYear
  FROM buytbl AS b
 INNER JOIN usertbl AS u
    ON b.userID = u.userID -- PK를 ON에 쓰는게 중요함
 ORDER BY b.num DESC;
-- WHERE u.userID = 'JYP';   
 
 
    