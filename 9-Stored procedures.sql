-- Create Database
CREATE DATABASE EmployeeDB;

-- Select the Database
USE EmployeeDB;

-- Create Worker Table
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

select * from Worker;

-- Stored Procedure to Add a New Record
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Procedure Call
CALL AddWorker(1, 'Alice', 'Smith', 60000, '2023-06-15 08:00:00', 'Engineering');

-- Retrieve Salary for a Worker by ID

DELIMITER $$

CREATE PROCEDURE GetSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure Call
SET @p_Salary = 0;
CALL GetSalary(1, @p_Salary);
SELECT @p_Salary AS Salary;

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(2, 'Bob', 'Johnson', 45000, '2021-07-20 10:30:00', 'Finance'),
(3, 'Carol', 'Williams', 75000, '2020-11-01 08:45:00', 'Engineering'),
(4, 'David', 'Brown', 50000, '2019-09-10 12:00:00', 'HR'),
(5, 'Eve', 'Davis', 67000, '2023-01-05 11:15:00', 'Research'),
(6, 'Frank', 'Miller', 48000, '2022-05-12 14:30:00', 'Finance'),
(7, 'Grace', 'Wilson', 72000, '2021-03-18 09:45:00', 'Engineering'),
(8, 'Hank', 'Moore', 53000, '2020-08-25 13:00:00', 'HR'),
(9, 'Ivy', 'Taylor', 59000, '2023-02-14 10:00:00', 'Marketing'),
(10, 'Jack', 'Anderson', 62000, '2021-06-30 08:30:00', 'Research');


-- Update Department for a Worker by ID

DELIMITER $$

CREATE PROCEDURE UpdateDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END $$

DELIMITER ;

-- Procedure Call
CALL UpdateDepartment(1, 'Research');

-- Get Worker Count in a Department
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure Call
SET @p_WorkerCount = 0;
CALL GetWorkerCountByDepartment('Engineering', @p_WorkerCount);
SELECT @p_WorkerCount AS WorkerCount;

-- Get Average Salary in a Department
DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;

-- Procedure Call
SET @p_AvgSalary = 0;
CALL GetAvgSalaryByDepartment('Engineering', @p_AvgSalary);
SELECT @p_AvgSalary AS AvgSalary;





