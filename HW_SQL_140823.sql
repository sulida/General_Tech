-- Вывести ко-во поставщиков не из UK и не из China

SELECT COUNT (*) FROM [Suppliers]

WHERE Country NOT IN ('UK', 'China')

-- Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT AVG (Price) , COUNT (*) FROM [Products]

WHERE CategoryID IN (3,5)

-- Вывести общую сумму проданных товаров
SELECT SUM(Products.Price* OrderDetails.Quantity) FROM [Products]

JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID

-- Вывести ко-во стран, которые поставляют напитки
SELECT COUNT (Suppliers.Country) FROM [Suppliers]

JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Products ON Suppliers.SupplierID = Suppliers.SupplierID

WHERE Categories.CategoryName = 'Beverages'

-- Вывести сумму, на которую было отправлено товаров клиентам в USA
SELECT SUM(Products.Price * OrderDetails.Quantity) FROM [Products]
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Customers ON Orders.CustomerID =Customers.CustomerID 
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID

WHERE Customers.Country = 'USA' 
