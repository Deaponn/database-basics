SELECT CompanyName, Address FROM Customers
SELECT LastName, HomePhone FROM Employees
SELECT ProductName, UnitPrice FROM Products
SELECT CategoryName, Description FROM Categories
SELECT CompanyName, HomePage FROM Suppliers

SELECT count(*) 
FROM Employees 
WHERE Country = 'USA' 

SELECT CompanyName, Address 
FROM Customers 
WHERE City = 'London'

SELECT CompanyName, Address 
FROM Customers 
WHERE Country = 'France' OR Country = 'Spain'

SELECT ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 20 AND 30

SELECT ProductName, UnitPrice 
FROM Products 
WHERE CategoryID = 6

SELECT SupplierID FROM Suppliers 
WHERE CompanyName = 'Tokyo Traders'
SELECT ProductName, UnitsInStock FROM Products 
WHERE SupplierID = 4

SELECT ProductName 
FROM Products 
WHERE UnitsInStock = 0

SELECT CompanyName 
FROM Customers 
WHERE CompanyName LIKE '%Restaurant%'

SELECT ProductName FROM Products 
WHERE QuantityPerUnit LIKE '%bottle%'

SELECT Title FROM Employees 
WHERE LastName LIKE '[B-L]%'

SELECT Title FROM Employees 
WHERE LastName LIKE 'B%' OR LastName LIKE 'L%'

SELECT CategoryName FROM Categories 
WHERE Description LIKE '%,%'

SELECT CompanyName FROM Customers 
WHERE CompanyName LIKE '%store%'

SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice NOT BETWEEN 10 AND 20

SELECT OrderID, OrderDate, CustomerID, shippeddate FROM Orders 
WHERE (ShippedDate IS NULL 
OR ShippedDate > GetDate())
AND ShipCountry = 'Argentina'

SELECT CompanyName, Country FROM Customers 
ORDER BY Country, CompanyName

SELECT CategoryID, ProductName, UnitPrice 
FROM Products ORDER BY 1, 3 DESC

SELECT CompanyName, Country FROM Customers 
WHERE Country in ('Italy', 'Japan') 
ORDER BY CompanyName

--can use COALESCE or CONCAT also
SELECT ISNULL(Phone, '') + ', ' + ISNULL(Fax, '') AS ContactInfo 
FROM Suppliers