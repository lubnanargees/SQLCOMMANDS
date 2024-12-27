
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


-- the first three characters of Country_name from the Country table
SELECT SUBSTRING(Country_name, 1, 3) AS First_Three_Chars FROM Country;

--  Concatenate first name and last name from the Persons table
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons;

-- Count the number of unique country names from the Persons table
SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Names FROM Persons;

-- the maximum population from the Country table
SELECT MAX(Population) AS Max_Population FROM Country;

--  the minimum population from the Persons table
SELECT MIN(Population) AS Min_Population FROM Persons;

-- Insert 2 new rows to the Persons table with Lname as NULL
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(21, 'Chris', NULL, 12345678, 4.0, 1, 'USA'),
(22, 'Anna', NULL, 9876543, 3.8, 2, 'Canada');

-- Count rows where Lname is NULL:
SELECT COUNT(*) AS Null_Lname_Count FROM Persons WHERE Lname IS NULL;

-- the number of rows in the Persons table
SELECT COUNT(*) AS Total_Rows FROM Persons;

-- the population of the Country table for the first 3 rows
SELECT Population FROM Country LIMIT 3;

-- 3 random rows from the Country table
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

-- all persons ordered by their rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

-- the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name;

-- countries in the Persons table with a total population greater than 50,000
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- the total number of persons and average rating for each country, 
-- but only for countries with more than 2 persons, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;







