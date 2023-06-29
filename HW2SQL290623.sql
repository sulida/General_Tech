
--1. Вывести телефоны всех поставщиков, кроме тех, что из Germany и France.
SELECT Phone
FROM [Suppliers]
WHERE
NOT Country IN ('Germany', 'France')

--2. Добавить два произвольных товара.
INSERT INTO [Products] (ProductName)
VALUES (' '), (' ')

--3. Удалить поставщиков из USA и Germany.
DELETE FROM [Suppliers]
WHERE
Country IN ('Germany', 'USA')

--4. Вывести все товары до 20 EUR из категорий 3 и 6 по убыванию цены.
SELECT * FROM [Products]
WHERE
 Price <= 20
 AND
 CategoryID IN (3, 6)
 ORDER BY Price DESC

--5. Вывести номера трех последних заказов.
SELECT * FROM [Orders]
ORDER BY OrderDate DESC
LIMIT 3