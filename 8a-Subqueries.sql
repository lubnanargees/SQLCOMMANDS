
-- CREATE DATABASE
CREATE DATABASE Countrypeople;
USE Countrypeople;

-- CREATE TABLES
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area FLOAT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

desc Country;
desc Persons;

select * from Country;
select * from Persons;

-- Insert data into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'India', 1380004385, 3287263),
(4, 'Australia', 25499884, 7692024),
(5, 'UK', 67886011, 243610),
(6, 'Germany', 83783942, 357022),
(7, 'France', 65273511, 551695),
(8, 'Brazil', 212559417, 8515767),
(9, 'China', 1439323776, 9596961),
(10, 'Russia', 145912025, 17098242);

-- Insert data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 331000000, 4.8, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 4.5, 2, 'Canada'),
(3, 'Raj', 'Kumar', 1380004385, 3.8, 3, 'India'),
(4, 'Emily', 'Clark', 25499884, 4.7, 4, 'Australia'),
(5, 'Tom', 'Brown', 67886011, 3.9, 5, 'UK'),
(6, 'Alice', 'Green', 83783942, 4.1, 6, 'Germany'),
(7, 'Marie', 'Dupont', 65273511, 4.3, 7, 'France'),
(8, 'Carlos', 'Silva', 212559417, 3.5, 8, 'Brazil'),
(9, 'Li', 'Wei', 1439323776, 4.9, 9, 'China'),
(10, 'Ivan', 'Petrov', 145912025, 4.2, 10, 'Russia');


-- Add a new column called DOB in the Persons table with data type DATE
ALTER TABLE Persons ADD DOB DATE;

SET SQL_SAFE_UPDATES = 0;

-- insert DOB to persons table
UPDATE Persons
SET DOB = CASE 
    WHEN Id = 1 THEN '1990-05-14'
    WHEN Id = 2 THEN '1985-08-20'
    WHEN Id = 3 THEN '1992-11-30'
    WHEN Id = 4 THEN '1980-04-25'
    WHEN Id = 5 THEN '1995-07-10'
    WHEN Id = 6 THEN '1988-03-18'
    WHEN Id = 7 THEN '1975-09-05'
    WHEN Id = 8 THEN '2000-12-15'
    WHEN Id = 9 THEN '1999-06-22'
    WHEN Id = 10 THEN '1983-01-11'
END;


-- a user-defined function to calculate age using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END;
//

DELIMITER ;

-- a SELECT query to fetch the age of all persons using the function
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age FROM Persons;

####### SUBQUERIES

-- Find the number of persons in each country:
SELECT Country_name, 
       (SELECT COUNT(*) FROM Persons P WHERE P.Country_name = C.Country_name) AS Number_of_Persons
FROM Country C;

-- Find the number of persons in each country sorted from high to low:
SELECT Country_name, 
       (SELECT COUNT(*) FROM Persons P WHERE P.Country_name = C.Country_name) AS Number_of_Persons
FROM Country C
ORDER BY Number_of_Persons DESC;

-- Find out the average rating for persons in respective countries if the average is greater than 3.0
SELECT Country_name, 
       (SELECT AVG(Rating) FROM Persons P WHERE P.Country_name = C.Country_name) AS Average_Rating
FROM Country C
WHERE (SELECT AVG(Rating) FROM Persons P WHERE P.Country_name = C.Country_name) > 3.0;

-- Find the countries with the same rating as the USA
SELECT Country_name
FROM Country
WHERE Country_name IN (
    SELECT Country_name
    FROM Persons
    WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA' LIMIT 1)
);

-- Select all countries whose population is greater than the average population of all nations
SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);















