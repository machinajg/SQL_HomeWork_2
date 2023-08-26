DROP DATABASE IF EXISTS seminar_2_homework;
CREATE DATABASE IF NOT EXISTS seminar_2_homework;
USE seminar_2_homework;
CREATE TABLE IF NOT EXISTS sales (
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    order_date DATE,
    count_product INT UNSIGNED
);
SELECT * FROM sales;
INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT id, count_product,
CASE
		WHEN count_product < 100 THEN 'Маленький заказ'
		WHEN 100 < count_product < 300 THEN 'Средний заказ'
		WHEN count_product > 300 THEN 'Большой заказ'
	END AS 'Тип заказа'
FROM sales;

CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id VARCHAR (5),
    amount FLOAT UNSIGNED,
    order_status TEXT
);
DESC orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT *,
CASE
	WHEN order_status  = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS 'full_order_status'
FROM orders;

/* Чем 0 отличается от NULL? *
0 - это число, а NULL - незаполненныое значение в таблице */