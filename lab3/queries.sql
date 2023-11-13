-- USE Northwind

SELECT ProductName, UnitPrice, CompanyName
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice BETWEEN 20 AND 30
ORDER BY 2 DESC

SELECT ProductName, UnitsInStock
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE CompanyName = 'Tokyo Traders'
ORDER BY 1 DESC

SELECT Customers.CustomerID, Address, City, Region, PostalCode
FROM Customers LEFT OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID AND YEAR(OrderDate) = 1997
WHERE Orders.CustomerID IS NULL

SELECT CompanyName, Phone
FROM Suppliers INNER JOIN Products
ON Suppliers.SupplierID = Products.SupplierID
WHERE UnitsInStock = 0
ORDER BY 1

-- USE Library

SELECT firstname, lastname, birth_date
FROM Member INNER JOIN juvenile
ON member.member_no = juvenile.member_no

SELECT title, COUNT(1)
FROM title INNER JOIN copy 
ON title.title_no = copy.title_no
WHERE on_loan = 'Y'
GROUP BY title

SELECT in_date, DATEDIFF(DAY, due_date, in_date) AS opoznienie, fine_paid
FROM loanhist INNER JOIN title
ON loanhist.title_no = title.title_no
WHERE title = 'Tao Teh King' AND DATEDIFF(DAY, due_date, in_date) > 0

SELECT isbn
FROM reservation INNER JOIN member
ON reservation.member_no = member.member_no
