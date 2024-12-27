-- Create the database
CREATE DATABASE Product;

-- Switch to the Product database
USE Product;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(10),
    Country VARCHAR(100)
);

-- Inserting sample data into the Customer table
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St', 'San Francisco', 'California', '94102', 'US'),
(3, 'Emily', 'Jones', 'emily.jones@example.com', '555-123-4567', '789 Pine St', 'New York', 'New York', '10001', 'US'),
(4, 'Michael', 'Brown', 'michael.brown@example.com', '666-789-0123', '101 Maple St', 'Chicago', 'Illinois', '60601', 'US'),
(5, 'Sarah', 'Davis', 'sarah.davis@example.com', '777-345-6789', '202 Birch St', 'Miami', 'Florida', '33101', 'US'),
(6, 'David', 'Wilson', 'david.wilson@example.com', '888-456-1234', '303 Cedar St', 'Houston', 'Texas', '77001', 'US'),
(7, 'Laura', 'Taylor', 'laura.taylor@example.com', '999-567-8901', '404 Elm St', 'Austin', 'Texas', '73301', 'US'),
(8, 'James', 'Anderson', 'james.anderson@example.com', '111-234-5678', '505 Fir St', 'Seattle', 'Washington', '98101', 'US');


select * from Customer;

-- Inserting 4 more rows with UK as the country
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(9, 'Olivia', 'Martinez', 'olivia.martinez@example.co.uk', '555-987-6543', '10 Downing St', 'London', 'England', 'SW1A 2AA', 'UK'),
(10, 'William', 'Thomas', 'william.thomas@example.co.uk', '555-876-1234', '20 Baker St', 'London', 'England', 'W1U 8ED', 'UK'),
(11, 'Sophia', 'Jackson', 'sophia.jackson@example.co.uk', '555-765-4321', '30 Regent St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(12, 'Benjamin', 'White', 'benjamin.white@example.co.uk', '555-654-3210', '40 Oxford St', 'Bristol', 'England', 'BS1 4PF', 'UK');


-- Create the customer_info view
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

-- Select data from the customer_info view
SELECT * FROM customer_info;

-- Create the US_Customers view
CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'US';

-- Select data from the US_Customers view
SELECT * FROM US_Customers;

-- Create the Customer_details view
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;

-- Select data from the Customer_details view
SELECT * FROM Customer_details;

-- Update phone numbers of customers who live in California
UPDATE Customer
SET Phone_no = '325-436-7091'  -- Replace 'NewPhoneNumber' with the actual number
WHERE State = 'California';

-- Verify the update
SELECT * FROM Customer_details;

-- Count the number of customers in each state, only showing states with more than 5 customers
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- Count the number of customers in each state from the Customer_details view
SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;

-- Select all columns from the Customer_details view, sorted by state in ascending order
SELECT * FROM Customer_details
ORDER BY State ASC;







