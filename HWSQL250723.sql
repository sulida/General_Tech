--Home work SQL
--
--1. Вывести информацию о заказах клиентов не из Germany и не из China

SELECT * FROM [Orders]
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
WHERE Country NOT IN ("Germany", "China")

--2. Вывести два самых дорогих товара из категории Beverages

SELECT * FROM [Products]
JOIN Categories ON Categories.CategoryID= Products.CategoryID
WHERE CategoryName = 'Beverages'
ORDER BY Price Desc
LIMIT 2

--3. Удалить поставщиков из China

DELETE  FROM [Suppliers]
WHERE Country = 'China'

--4. Вывести все заказы клиента 10, которые повезет Federal Shipping

SELECT * FROM [Orders]
JOIN Customers ON Customers.CustomerID= Orders.CustomerID
JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID
WHERE Customers.CustomerID = 10
AND Shippers.ShipperName = 'Federal Shipping'



--5. Вывести два самых дорогих напитка из UK

SELECT * FROM [Products]
JOIN Categories ON Categories.CategoryID= Categories.CategoryID
JOIN Suppliers ON Suppliers.SupplierID=Suppliers.SupplierID
WHERE Suppliers.Country = 'UK'
AND Categories.CategoryName = 'Beverages'
ORDER BY Price DESC
LIMIT 2

--6. Вывести страны-поставщики напитков

SELECT Country FROM [Suppliers]
JOIN Products ON Products.SupplierID=Suppliers.SupplierID

WHERE Products.CategoryID = 1