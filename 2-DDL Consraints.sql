CREATE DATABASE Sales;
USE Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,                
    Customer_name VARCHAR(100) NOT NULL,     
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE            
);

select * from Orders;

ALTER TABLE Orders ADD order_quantity INT;

RENAME TABLE Orders TO Sales_Orders;

select * from Sales_Orders;

INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
(1, 'Alice', 'Electronics', 'Smartphone', '1234567890', 1),
(2, 'Bob', 'Books', 'Novel', '1234567891', 2),
(3, 'Charlie', 'Clothing', 'Jacket', '1234567892', 1),
(4, 'Diana', 'Groceries', 'Rice', '1234567893', 5),
(5, 'Eve', 'Electronics', 'Laptop', '1234567894', 1),
(6, 'Frank', 'Books', 'Dictionary', '1234567895', 3),
(7, 'Grace', 'Clothing', 'T-shirt', '1234567896', 2),
(8, 'Henry', 'Groceries', 'Milk', '1234567897', 10),
(9, 'Ivy', 'Books', 'Notebook', '1234567898', 4),
(10, 'Jack', 'Electronics', 'Headphones', '1234567899', 1);

SELECT Customer_name, Ordered_item FROM sales_orders;

UPDATE sales_orders
SET Ordered_item = 'Tablet'
WHERE Order_Id = 1;

DROP TABLE sales_orders;

drop database sales;