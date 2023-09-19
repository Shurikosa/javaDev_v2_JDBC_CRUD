DELIMITER //
CREATE PROCEDURE generateResidents()
BEGIN
	DECLARE iterator INT DEFAULT 0;
    DECLARE currentMemberId INT DEFAULT 102;
    DECLARE currentFlatId INT DEFAULT 1;
    WHILE iterator < 100 DO
		INSERT INTO Residents (member_id, flat_id, car_access) VALUES
        (currentMemberId, currentFlatId, (CASE WHEN RAND() > 0.5 THEN TRUE ELSE FALSE END));
       SET currentFlatId = currentFlatId + 1;
       SET currentMemberId = currentMemberId + 1;
       SET iterator = iterator + 1;
	END WHILE;
END;

CALL generateResidents();