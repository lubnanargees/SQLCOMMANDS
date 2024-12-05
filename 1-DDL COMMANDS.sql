create database school;
use school;
CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks FLOAT,
    Grade CHAR(1)
);
desc student;
 select * from STUDENT;
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Alice', 85.5, 'A'),
(2, 'Bob', 78.0, 'B'),
(3, 'Charlie', 92.0, 'A'),
(4, 'Diana', 66.5, 'C');

ALTER TABLE STUDENT ADD Contact VARCHAR(15);
ALTER TABLE STUDENT DROP COLUMN Grade;
RENAME TABLE STUDENT TO CLASSTEN;

 select * from CLASSTEN;

TRUNCATE TABLE CLASSTEN;

DROP TABLE CLASSTEN;

drop database school;