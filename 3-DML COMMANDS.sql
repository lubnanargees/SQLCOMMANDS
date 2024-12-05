CREATE DATABASE Manager;
USE Manager;

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary FLOAT NOT NULL
);

select * from Managers;

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-05-15', 44, 'M', 'IT', 30000),
(2, 'Aaliya', 'Khan', '1985-11-20', 39, 'F', 'HR', 25000),
(3, 'Michael', 'Smith', '1990-08-12', 34, 'M', 'Finance', 40000),
(4, 'Samantha', 'Jones', '1975-03-10', 49, 'F', 'IT', 27000),
(5, 'David', 'Taylor', '1992-06-18', 32, 'M', 'Marketing', 22000),
(6, 'Emily', 'Brown', '1988-09-25', 36, 'F', 'IT', 35000),
(7, 'Daniel', 'Wilson', '1995-01-14', 29, 'M', 'Operations', 20000),
(8, 'Sophia', 'Davis', '1993-04-22', 31, 'F', 'HR', 24000),
(9, 'Chris', 'Moore', '1982-07-30', 42, 'M', 'Finance', 37000),
(10, 'Olivia', 'Johnson', '1987-02-05', 37, 'F', 'IT', 31000);

SELECT First_name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

SELECT * FROM Managers 
WHERE First_name != 'Aaliya';

SELECT * FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

SELECT * FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;