
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

-- Distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

-- First names and last names from the Persons table 
SELECT Fname, Lname FROM Persons;
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- All persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- Countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

-- Persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- All persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- all countries with a population between 5 lakhs and 20 lakhs:
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';


INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(11, 'Spain', 47351567, 505992),
(12, 'Italy', 60317116, 301340),
(13, 'Mexico', 128932753, 1964375),
(14, 'Japan', 125836021, 377975),
(15, 'South Korea', 51780579, 100210);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Carlos', 'Lopez', 47351567, 4.0, 11, 'Spain'),
(12, 'Giovanni', 'Rossi', 60317116, 3.9, 12, 'Italy'),
(13, 'Maria', 'Gomez', 128932753, 4.5, 13, 'Mexico'),
(14, 'Hiroshi', 'Tanaka', 125836021, 4.6, 14, 'Japan'),
(15, 'Jin', 'Park', 51780579, 4.7, 15, 'South Korea'),
(16, 'Ana', 'Martinez', 47351567, 3.8, 11, 'Spain'),
(17, 'Luigi', 'Bianchi', 60317116, 4.3, 12, 'Italy'),
(18, 'Satoshi', 'Yamamoto', NULL, 4.8, NULL, NULL),
(19, 'Emma', 'Wilson', NULL, 4.2, NULL, NULL),
(20, 'James', 'Smith', NULL, 3.6, NULL, NULL);


-- INNER JOIN
SELECT P.Id AS Person_Id, P.Fname, P.Lname, C.Country_name, C.Population
FROM Persons P
INNER JOIN Country C ON P.Country_Id = C.Id;

-- LEFT JOIN
SELECT P.Id AS Person_Id, P.Fname, P.Lname, C.Country_name, C.Population
FROM Persons P
LEFT JOIN Country C ON P.Country_Id = C.Id;

-- RIGHT JOIN
SELECT P.Id AS Person_Id, P.Fname, P.Lname, C.Country_name, C.Population
FROM Persons P
RIGHT JOIN Country C ON P.Country_Id = C.Id;

-- all distinct country names from both the 
SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

-- all country names from both the Country and Persons tables, including duplicates
SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

-- Round the ratings of all persons to the nearest integer in the Persons table
SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;








