--1 Найти мин/стоимость товаров для каждой категории

SELECT
	        Categories.CategoryName,
          MIN(Products.Price) AS min_price
FROM      Products

JOIN      Categories ON Products.CategoryID=Categories.CategoryID

GROUP BY  Categories.CategoryID
-- ###############################################################################


--2 Вывести ТОП-3 стран по количеству доставленных заказов
	
SELECT
	Country,
	COUNT(*) AS total_orders
FROM Orders

JOIN Customers ON Customers.CustomerID=Orders.CustomerID

GROUP BY Country

ORDER BY total_orders DESC
LIMIT 3
-- ###############################################################################


--3 Вывести названия категорий, в которых более 10 товаров


-- ###############################################################################

--4 Очистить тел/номер поставщикам из USA
--5 Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
--6 Вывести товар, который находится на втором месте по ко-ву заказов
