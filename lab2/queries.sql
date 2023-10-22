SELECT count(*) FROM Products 
WHERE UnitPrice < 10 OR UnitPrice > 20

SELECT max(UnitPrice) FROM Products
WHERE UnitPrice < 20

SELECT min(UnitPrice), avg(UnitPrice), max(UnitPrice)
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

SELECT ProductName, UnitPrice
FROM Products
HAVING UnitPrice > avg(UnitPrice)

SELECT productid, SUM(quantity) AS total_quantity
FROM orderhist
GROUP BY productid

SELECT OrderID, max(UnitPrice) as max_price
FROM [Order Details]
GROUP BY OrderID
ORDER BY max_price DESC

SELECT productid, max(UnitPrice) as max_price, min(UnitPrice) as min_price
FROM [Order Details]
GROUP BY productid
ORDER BY max_price DESC

SELECT ShipVia, count(*)
FROM Orders
GROUP BY ShipVia

SELECT Suppliers.CompanyName, COUNT(*)
FROM Orders
INNER JOIN Suppliers ON Orders.ShipVia = Suppliers.SupplierID
WHERE YEAR(OrderDate) = 1997
GROUP BY Suppliers.CompanyName
ORDER BY COUNT(*) DESC

SELECT OrderID, COUNT(*)
FROM [Order Details]
GROUP BY OrderID
HAVING COUNT(*) > 5
SELECT * FROM [Order Details] WHERE OrderID = 11077

SELECT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID
HAVING COUNT(*) > 8

SELECT productid, orderid, SUM(quantity) AS total_quantity
FROM orderhist
GROUP BY productid, orderid
WITH ROLLUP
ORDER BY productid, orderid

SELECT NULL, NULL, SUM(quantity) AS total_quantity
FROM orderhist

SELECT LastName, FirstName, DATEDIFF(year, HireDate, GETDATE())
FROM Employees

SELECT TOP 1 FirstName, LEN(FirstName)
FROM Employees
ORDER BY 2

SELECT EmployeeID, COUNT(1) AS suma, MIN(OrderDate) AS najstarsze
FROM Orders
GROUP BY EmployeeID
ORDER BY EmployeeID

SELECT COUNT(1)
FROM Orders
WHERE DATEDIFF(day, RequiredDate, ShippedDate) > 0

SELECT OrderID, SUM(UnitPrice * quantity * discount)
FROM [Order Details]
GROUP BY OrderID