

--Практическое задание по теме “Транзакции, переменные, представления”
--1-е задание.
START TRANSACTION;
INSERT INTO sample.users (name, age) 
  SELECT name, age FROM shop.users WHERE id = 1;
  DELETE FROM shop.users WHERE id = 1;
COMMIT;   


--2-е задание
CREATE VIEW product_and_catalog AS
SELECT p.name 'products' ,c.name 'catalog' FROM products p
LEFT JOIN catalogs c ON p.catalog_id = c.id;


--Практическое задание по теме “Администрирование MySQL” 
--1-е задание.

CREATE USER 'shop_read'@'localhost' IDENTIFIED BY '123';
GRANT SELECT ON shop.* TO 'shop_read'@'localhost'; --задать права только на выборку.

CREATE USER 'shop'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON shop .* TO 'shop'@'localhost'; --задать все права для бд shop.
FLUSH PRIVILEGES; -- для обновления прав

--2-е задание.
CREATE TABLE accounts (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(50),
 password VARCHAR(20)
 );
 INSERT INTO accounts (name,password) VALUES ('Oleg','123'),('Mash','321');
 ------------------------------------------------------------------------------
CREATE OR REPLACE VIEW username AS
    SELECT a.id, a.name FROM accounts a; 
SELECT * FROM username;

SELECT Host, User FROM mysql.user;

DROP USER IF EXISTS 'user_read';
CREATE USER 'user_read';
GRANT SELECT ON shop.username TO 'user_read';

SELECT Host, User FROM mysql.user;


--Практическое задание по теме “Хранимые процедуры и функции, триггеры"
-- 1-е задание.
CREATE FUNCTION hello()
RETURNS TINYTEXT
 BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
	 WHEN hour BETWEEN 12 AND 17 THEN 
	  RETURN "Good afternoon";
	 WHEN hour BETWEEN 18 AND 23 THEN
	  RETURN "Good evning";
	 WHEN hour BETWEEN 0 AND 5 THEN
	  RETURN "Good night";
	 WHEN hour BETWEEN  6 AND 11 THEN
	  RETURN "Good morning";
 END CASE;
END