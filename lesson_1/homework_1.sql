-- 2. Вывести название и стоимость товаров от 20 EUR.
  SELECT 
      ProductName,
      Price
FROM  Products
WHERE
      Price >= 20

-- 3. Вывести страны поставщиков. (может где-то подвох? Выглядит просто ;-))
SELECT Country FROM Suppliers

-- 4. В упорядоченном по стоимости виде вывести название и стоимость товаров со скидкой в 9% от всех поставщиков, кроме поставщика 1.

SELECT ProductName, 
		   Price * .91 AS Price_low
FROM   Products
WHERE NOT 
	     SupplierID = 1
ORDER BY Price ASC


-- 5. Вывести контактные имена клиентов, кроме тех, что из France и USA.

SELECT   ContactName 
FROM     Customers
WHERE NOT
        Country IN ('France', 'USA')
