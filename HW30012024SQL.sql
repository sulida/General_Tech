-- 1.Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)
SELECT  OrderDetails.OrderID, (OrderDetails.Quantity*Products.Price) AS order_cost
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.OrderID
HAVING order_cost > 5000

--
-- 2.Вывести страны, в которые было отправлено 3 и более заказов
SELECT Customers.Country,  COUNT(*) AS total_orders FROM OrderDetails
JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
HAVING total_orders >= 3
--
--3. Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS total_quantity FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.ProductID
ORDER BY total_quantity DESC
LIMIT 10
--
-- 4.Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT Orders.EmployeeID, ROUND(SUM(Products.Price*OrderDetails.Quantity*0.05), 2) AS salary FROM OrderDetails
JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID

GROUP BY Orders.EmployeeID