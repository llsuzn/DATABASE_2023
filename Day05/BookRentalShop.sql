-- BookRentalShop 연습
USE bookrentalshop;
SELECT * FROM membertbl;

-- 서브쿼리
SELECT b.Author AS '저자' -- 1
     , b.Division AS '장르' -- 2
     , b.Names AS '책제목' -- 3
     , b.ISBN -- 4
     , b.Price AS '금액' -- 5
  FROM bookstbl AS b
 ORDER by 3; -- 3 : '책제목' or b.Names /  default : ASC