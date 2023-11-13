-- 1.1
SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS sales_worth
FROM [Order Details]
GROUP BY OrderID
ORDER BY 2 DESC

-- 1.2
SELECT TOP 10 OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS sales_worth
FROM [Order Details]
GROUP BY OrderID
ORDER BY 2 DESC

-- 2.1
SELECT ProductID, SUM(Quantity) AS suma
FROM [Order Details]
WHERE ProductID < 3
GROUP BY ProductID

-- SELECT ProductID, SUM(Quantity)
-- FROM [Order Details]
-- GROUP BY ProductID
-- HAVING ProductID < 3

-- 2.2
SELECT ProductID, SUM(Quantity) AS suma
FROM [Order Details]
GROUP BY ProductID
ORDER BY 2

-- 2.3
SELECT OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS sales_worth
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(Quantity) > 250

-- 3.1
SELECT
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS employee,
    COUNT(Orders.OrderID)
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY CONCAT(Employees.FirstName, Employees.LastName)

-- 3.2
SELECT Shippers.CompanyName, SUM(Orders.Freight)
FROM Shippers
INNER JOIN Orders ON Shippers.ShipperID = Orders.ShipVia
GROUP BY Shippers.CompanyName

-- 3.3
SELECT Shippers.CompanyName, SUM(Orders.Freight)
FROM Shippers
INNER JOIN Orders ON Shippers.ShipperID = Orders.ShipVia
WHERE YEAR(Orders.ShippedDate) BETWEEN 1996 AND 1997
GROUP BY Shippers.CompanyName

-- 4.1
SELECT
    CONCAT(Employees.FirstName, ' ', Employees.LastName) AS employee,
    YEAR(Orders.OrderDate) AS rok,
    MONTH(Orders.OrderDate) AS miesiac,
    COUNT(Orders.OrderID) AS zamowienia
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY
    CONCAT(Employees.FirstName, ' ', Employees.LastName),
    YEAR(Orders.OrderDate),
    MONTH(Orders.OrderDate)
-- WITH ROLLUP
ORDER BY 1, 2, 3, 4

-- 4.2
SELECT
    Categories.CategoryName,
    MIN(Products.UnitPrice) AS min_price,
    MAX(Products.UnitPrice) AS max_price
FROM Categories
INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName