-- INSERT
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('LSJ','이수진',1999,'부산','010','12345678','160','2023-03-02');

INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('LGS','이규수',1997,'대구',NULL,NULL,NULL,NULL);

INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM','손흥민',1991,'서울');

-- 컬럼 순서는 잘 지켜야한다
INSERT INTO usertbl VALUES
('SJW','손정웅',1969,'서울','010','55664433','176',NULL);

-- AUTO INSERTMENT의 경우 필드값을 입력하지 않아도 됨
INSERT INTO buytbl
(userID,prodName,groupName,price,amount)
VALUES
('LSJ','노트북','전자',5000000,1);


