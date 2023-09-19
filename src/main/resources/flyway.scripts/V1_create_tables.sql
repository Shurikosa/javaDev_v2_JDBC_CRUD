CREATE DATABASE IF NOT EXISTS OSBB;

USE OSBB;

CREATE TABLE Buildings (
building_id INT NOT NULL AUTO_INCREMENT,
building_adress VARCHAR(120) NOT NULL,
PRIMARY KEY (building_id)
);

CREATE TABLE Flats (
flat_id INT NOT NULL AUTO_INCREMENT,
building_id INT NOT NULL,
flat_number INT NOT NULL,
area_m2 INT NOT NULL,
PRIMARY KEY (flat_id),
FOREIGN KEY (building_id) REFERENCES Buildings(building_id)
);

CREATE TABLE OSBB_members_roles (
role_id INT NOT NULL AUTO_INCREMENT,
roles ENUM('учасник', 'працівник', 'член правління', 'голова') NULL DEFAULT 'учасник',
PRIMARY KEY (role_id)
);

CREATE TABLE OSBB_members (
member_id INT NOT NULL AUTO_INCREMENT,
role_id INT NOT NULL,
first_name VARCHAR(45),
second_name VARCHAR(45),
email VARCHAR(60),
PRIMARY KEY (member_id),
FOREIGN KEY (role_id) REFERENCES OSBB_members_roles(role_id)
);

CREATE TABLE Residents (
resident_id INT NOT NULL AUTO_INCREMENT,
member_id INT NOT NULL,
flat_id INT NOT NULL,
car_access BOOLEAN,
PRIMARY KEY (resident_id),
FOREIGN KEY (member_id) REFERENCES OSBB_members(member_id),
FOREIGN KEY (flat_id) REFERENCES Flats(flat_id)
);

CREATE TABLE Ownership_rights(
ownership_id INT NOT NULL AUTO_INCREMENT,
member_id INT NOT NULL,
flat_id INT NOT NULL,
PRIMARY KEY (ownership_id),
FOREIGN KEY (member_id) REFERENCES OSBB_members(member_id),
FOREIGN KEY (flat_id) REFERENCES Flats(flat_id)
);