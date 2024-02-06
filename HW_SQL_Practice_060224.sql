create database webshop;
use webshop;

CREATE TABLE clients (
  id VARCHAR(128) PRIMARY KEY,
  name VARCHAR(128),
  phone VARCHAR(128),
  age INTEGER
);

INSERT INTO clients
VALUES ('1', 'Name1', '123456', 18),
('2', 'Name2', '123654', 75),
('3', 'Name3', '321456', 33);

