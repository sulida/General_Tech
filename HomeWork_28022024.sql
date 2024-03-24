--В рамках БД "песочница" напишите след/запросы:
--
--Вывести среднюю стоимость товара в категории 1 (проекция: название_категории, сред/стоимость)
SELECT Categories.CategoryName, AVG(Products.Price) AS avg_price
FROM Categories
JOIN Products  ON Products.CategoryID =Categories.CategoryID
WHERE Categories.CategoryID = 1
GROUP BY Categories.CategoryName;

--Вывести телефоны поставщиков (suppliers) и перевозчиков (shippers)
SELECT SupplierName AS Name, Phone
FROM Suppliers
UNION
SELECT ShipperName AS Name, Phone
FROM Shippers;

--Вывести все заказы, добавив поле is_premium, если его доставит перевозчик 3 (ShipperID)
SELECT *,
CASE
WHEN ShipperID = 3 THEN 'Yes'
ELSE 'No'
END AS is_premium
FROM Orders;

--Вывести все товары, причем для товаров от поставщиков 1 и 3 и ценой до 250 EUR добавить скидку в 5.5% (проекция: все поля + поле Price_down)
SELECT *,
CASE
WHEN SupplierID IN (1, 3) AND Price < 250 THEN Price*0.945
ELSE ''
END AS Price_down
FROM Products;

