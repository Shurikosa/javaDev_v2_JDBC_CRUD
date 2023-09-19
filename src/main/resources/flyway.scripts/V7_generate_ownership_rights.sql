DELIMITER //
CREATE PROCEDURE generateOwnershipRights()
BEGIN
	DECLARE iterator INT DEFAULT 0;
    DECLARE currentMemberId INT DEFAULT 102;
    DECLARE currentFlatId INT DEFAULT 1;
    WHILE iterator < 100 DO
		INSERT INTO Ownership_rights (member_id, flat_id) VALUES
        (currentMemberId, currentFlatId);
       SET currentFlatId = currentFlatId + 1;
       SET currentMemberId = currentMemberId + 1;
       SET iterator = iterator + 1;
	END WHILE;
END;

CALL generateOwnershipRights();