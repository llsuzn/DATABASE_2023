CREATE VIEW uv_usertbl
AS 
	SELECT u.userID
		 , u.name
         , u.birthYear
         , u.addr
      FROM usertbl AS u;
      
SELECT * FROM uv_usertbl       