-- 테이블 생성 퀴리
CREATE TABLE producttbl (
	productname NVARCHAR(20) PRIMARY KEY,
    cost INT NOT NULL,
    makedate DATE,
    company NVARCHAR(20),
    amount INT NOT NULL
);