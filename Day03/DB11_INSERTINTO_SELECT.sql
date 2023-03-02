-- INSERT INTO SELECT
-- usertbl에서 네가 컬럼 값을 가져와서 전부 usertbl_bak의 삽입
INSERT INTO usertbl_bak (userID,name,birthYear,addr)
SELECT userID,name,birthYear,addr FROM usertbl;