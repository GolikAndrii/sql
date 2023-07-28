-- 1. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT   ProductName, 
         Price * 1.1 AS Price_usd
FROM     Products
JOIN     OrderDetails ON Products.ProductID=OrderDetails.ProductID
ORDER BY Price DESC
LIMIT 1
-- ###############################################################################
	

-- 2. Вывести два самых дорогих товара из категории Beverages из USA

SELECT ProductName, CategoryName, Country, Price -- для наглядности вывожу Название товара, Категорию, Страну и Цену
FROM Products
JOIN Suppliers ON Suppliers.SupplierID=Products.SupplierID
JOIN Categories ON Categories.CategoryID=Products.CategoryID
WHERE Suppliers.Country='USA' AND Categories.CategoryName='Beverages'
ORDER BY Price DESC
-- ###############################################################################


	
-- 3. Удалить товары с ценой от 5 до 25 EUR

DELETE FROM Products
WHERE Price 
BETWEEN 5 AND 25
-- ###############################################################################

	
  
-- 4. Вывести список стран, которые поставляют морепродукты

SELECT   Country 
FROM     Suppliers
JOIN     Products ON Suppliers.SupplierID=Products.SupplierID
JOIN     Categories ON Categories.CategoryID=Products.CategoryID
WHERE    Categories.CategoryName='Seafood'
-- ###############################################################################

	
  
-- 5. Очистить поле ContactName у всех клиентов не из China
	
UPDATE    Customers
SET 
	  CustomerName=''
WHERE NOT Country='China'  -- у нас нет совсем такой страны ))) Поэтому UPDATE происходит у всех клиентов ;-)
-- ###############################################################################



-- 6. Вывести информацию о товарах с ценой от 10 до 150 EUR, которые были поставлены из Japan:
--     * название_товара
--     * цена_товара
--     * цена_со_скидкой_15_процентов
--     * название_поставщика

SELECT 	ProductName, 
		    Price, 
        Price * 0.85 AS Price_low, 
        SupplierName
FROM    Products
JOIN    Suppliers ON Suppliers.SupplierID=Products.SupplierID
WHERE 	Suppliers.Country='Japan' 
  AND   Price BETWEEN 10 AND 150 
-- ###############################################################################
	
  

-- 7. Вывести заказы клиентов из USA, Germany, UK:
--   * номер_заказа
--   * полное_имя_клиента
--   * страна_клиента
--   * имя_менеджера
--   * фамилия_менеджера

SELECT   OrderID, ContactName, Country, FirstName, LastName
FROM     Orders
JOIN     Customers ON Customers.CustomerID=Orders.CustomerID
JOIN     Employees ON Employees.EmployeeID=Orders.EmployeeID
WHERE    Customers.Country IN ('USA', 'Germany', 'UK')
-- ###############################################################################
