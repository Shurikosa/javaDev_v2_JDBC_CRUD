DELIMITER //
CREATE PROCEDURE generateMembers()
BEGIN
	DECLARE iterator INT DEFAULT 0;
	WHILE iterator < 100 DO
		INSERT INTO OSBB_members (role_id, first_name, second_name, email)
		SELECT
			(CASE
			WHEN RAND() < 0.1 THEN 3
			ELSE FLOOR(RAND() * 2) + 1
			END) AS role_id,
			(CASE FLOOR(RAND() * 20)
				WHEN 0 THEN 'Марина'
				WHEN 1 THEN 'Сергій'
				WHEN 2 THEN 'Олександр'
				WHEN 3 THEN 'Марія'
				WHEN 4 THEN 'Оксана'
				WHEN 5 THEN 'Роман'
				WHEN 6 THEN 'Юрій'
				WHEN 7 THEN 'Михайло'
				WHEN 8 THEN 'Анатолій'
				WHEN 9 THEN 'Вікторія'
				WHEN 10 THEN 'Галина'
				WHEN 11 THEN 'Віктор'
				WHEN 12 THEN 'Володимир'
				WHEN 13 THEN 'Ігор'
				WHEN 14 THEN 'Данило'
				WHEN 15 THEN 'Лідія'
				WHEN 16 THEN 'Василь'
				WHEN 17 THEN 'Ростислав'
				WHEN 18 THEN 'Олексій'
				WHEN 19 THEN 'Юлія'
			END) AS first_name,
			(CASE FLOOR(RAND() * 25)
				WHEN 0 THEN 'Осаула'
				WHEN 1 THEN 'Терещенко'
				WHEN 2 THEN 'Тіщенко'
				WHEN 3 THEN 'Колот'
				WHEN 4 THEN 'Бойко'
				WHEN 5 THEN 'Зозуля'
				WHEN 6 THEN 'Шуліка'
				WHEN 7 THEN 'Воробей'
				WHEN 8 THEN 'Шевченко'
				WHEN 9 THEN 'Ребровко'
				WHEN 10 THEN 'Швець'
				WHEN 11 THEN 'Лемко'
				WHEN 12 THEN 'Волинець'
				WHEN 13 THEN 'Коновалець'
				WHEN 14 THEN 'Тягнибок'
				WHEN 15 THEN 'Притула'
				WHEN 16 THEN 'Шило'
				WHEN 17 THEN 'Стус'
				WHEN 18 THEN 'Тимощук'
				WHEN 19 THEN 'Вернидуб'
				WHEN 20 THEN 'Вернигора'
				WHEN 21 THEN 'Крутивус'
				WHEN 22 THEN 'Котигорошко'
				WHEN 23 THEN 'Торохтій'
				WHEN 24 THEN 'Литвин'
			END) AS second_name,
			CONCAT(FLOOR(RAND() * 10000), '@example.com') AS email;
		SET iterator = iterator + 1;
	END WHILE;
END//
DELIMITER ;

CALL generateMembers();

INSERT INTO OSBB_members (role_id, first_name, second_name, email) VALUES
(4,'Іван', 'Жуковський', 'ivan@example.com');