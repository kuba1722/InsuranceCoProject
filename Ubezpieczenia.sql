
 IF EXISTS(select*  from sys.Databases where name = 'TEST')
DROP DATABASE TEST

CREATE DATABASE TEST



USE TEST 

IF OBJECT_ID('TEST.Customer', 'U') IS NOT NULL DROP TABLE TEST.Customer
CREATE TABLE customer (
  customer_id INTEGER NOT NULL Primary key IDENTITY(1,1),
  name VARCHAR(45) unique  NOT NULL,
  phone INTEGER NULL Check(phone>100000000 and phone<999999999),
  email VARCHAR(45) NOT NULL unique CHECK (email LIKE '%_@_%._%'),
  login VARCHAR(20) NOT NULL unique ,
  password VARCHAR(45) NOT NULL ,
);