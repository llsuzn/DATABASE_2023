DELIMITER $$
CREATE PROCEDURE IFPROC()
BEGIN
	DECLARE var1 INT;
    SET var1 = 100;
    
    IF var1 = 100 THEN
    BEGIN
		SELECT '100입니다';
    END;
    ELSE
    BEGIN
		SELECT '100이 아닙니다';
    END;
    END IF;
END $$

