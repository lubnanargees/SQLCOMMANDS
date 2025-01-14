USE EmployeeDB;

-- Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES
(1, 'Alice', 'Math', 5, 50000.00),
(2, 'Bob', 'Science', 8, 55000.00),
(3, 'Carol', 'English', 12, 60000.00),
(4, 'David', 'History', 7, 52000.00),
(5, 'Eve', 'Physics', 10, 58000.00),
(6, 'Frank', 'Chemistry', 3, 48000.00),
(7, 'Grace', 'Biology', 6, 53000.00),
(8, 'Hank', 'Computer Science', 4, 49000.00);

select * from teachers;

-- Create before_insert_teacher Trigger
 
 DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

-- After Insert Trigger to Log Insertions

CREATE TABLE teacher_log (
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

-- Before Delete Trigger for Experience Constraint

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with experience greater than 10 years';
    END IF;
END $$

DELIMITER ;
-- After Delete Trigger to Log Deletions

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;


