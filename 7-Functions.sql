-- 7-Functions

-- Consider the Country table and Persons table that you created earlier and perform the following: 

USE population;

-- 1. Add a new column called DOB in Persons table with data type as Date. 

ALTER TABLE Persons ADD COLUMN DOB DATE;

SELECT * FROM Country;
SELECT * FROM Persons;

UPDATE Persons
SET DOB = '1990-07-25'
WHERE Id = 1;
UPDATE Persons
SET DOB = '1989-01-15'
WHERE Id = 2;
UPDATE Persons
SET DOB = '1987-06-17'
WHERE Id = 3;
UPDATE Persons
SET DOB = '1986-08-21'
WHERE Id = 4;
UPDATE Persons
SET DOB = '1995-03-21'
WHERE Id = 5;
UPDATE Persons
SET DOB = '1982-09-23'
WHERE Id = 6;
UPDATE Persons
SET DOB = '1970-05-03'
WHERE Id = 7;
UPDATE Persons
SET DOB = '1980-01-01'
WHERE Id = 8;
UPDATE Persons
SET DOB = '1969-03-07'
WHERE Id = 10;
UPDATE Persons
SET DOB = '1984-02-17'
WHERE Id = 12;
UPDATE Persons
SET DOB = '1984-02-17'
WHERE Id = 12;
UPDATE Persons
SET DOB = '1983-02-27'
WHERE Id = 13;
UPDATE Persons
SET DOB = '1988-07-07'
WHERE Id = 14;
UPDATE Persons
SET DOB = '1990-12-17'
WHERE Id = 15;
UPDATE Persons
SET DOB = '1984-09-17'
WHERE Id = 16;
UPDATE Persons
SET DOB = '1985-02-17'
WHERE Id = 17;
UPDATE Persons
SET DOB = '1963-01-09'
WHERE Id = 18;
UPDATE Persons
SET DOB = '1999-09-13'
WHERE Id = 19;
UPDATE Persons
SET DOB = '2000-02-13'
WHERE Id = 21;
UPDATE Persons
SET DOB = '1985-09-27'
WHERE Id = 22;
UPDATE Persons
SET DOB = '1988-06-18'
WHERE Id = 20;

-- 2. Write a user-defined function to calculate age using DOB. 

DELIMITER //

CREATE FUNCTION Age(DOB DATE) 
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    IF (MONTH(DOB) > MONTH(CURDATE())) 
    OR (MONTH(DOB) = MONTH(CURDATE()) 
    AND DAY(DOB) > DAY(CURDATE())) 
    THEN
        SET age = age - 1;
    END IF;
    RETURN age;
END //

DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 

SELECT Id, Fname, Lname, DOB, Age(DOB) AS Age, Country_name
FROM Persons;

-- 4. Find the length of each country name in the Country table. 

SELECT Country_name, LENGTH(Country_name) AS Country_Name_Length
FROM Country;

DELIMITER //
CREATE FUNCTION CountryNameLength(Country_name varchar(50))
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
RETURN LENGTH(Country_name);
END //
DELIMITER ;

SELECT Country_name, CountryNameLength(Country_name) AS Length FROM Country;

-- 5. Extract the first three characters of each country's name in the Country table. 

SELECT Country_name, SUBSTR(Country_name, 1, 3) AS First_Three_Chars
FROM Country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.

SELECT Country_name, LOWER(Country_name) AS Lower
FROM Country;

SELECT Country_name, UPPER(Country_name) AS UPPER
FROM Country;