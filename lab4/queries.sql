USE Library
-- list of people who live in AZ and have more
-- than 2 children in the library
SELECT firstname, lastname, COUNT(*) as kids
FROM member 
INNER JOIN adult
ON member.member_no = adult.member_no
INNER JOIN juvenile
ON member.member_no = juvenile.adult_member_no
WHERE state = 'AZ'
GROUP BY firstname, lastname, member.member_no
HAVING COUNT(*) > 2
ORDER BY 3 DESC, 2, 1


-- as above, but show also people from CA
-- that have more than 3 kids in the library
SELECT firstname, lastname, COUNT(*) as kids, adult.state
FROM member 
INNER JOIN adult
ON member.member_no = adult.member_no
INNER JOIN juvenile
ON member.member_no = juvenile.adult_member_no
WHERE state = 'AZ'
GROUP BY firstname, lastname, adult.state, member.member_no
HAVING COUNT(*) > 2
UNION
SELECT firstname, lastname, COUNT(*) as kids, adult.state
FROM member 
INNER JOIN adult
ON member.member_no = adult.member_no
INNER JOIN juvenile
ON member.member_no = juvenile.adult_member_no
WHERE state = 'CA'
GROUP BY firstname, lastname, adult.state, member.member_no
HAVING COUNT(*) > 3
ORDER BY 3 DESC, 4, 2, 1

USE Northwind
SELECT * FROM Orders

SELECT Orders.OrderID, CompanyName, SUM(Quantity) as suma
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Orders.OrderID, CompanyName
HAVING SUM(Quantity) > 250
ORDER BY 3 DESC

SELECT Orders.OrderID, CompanyName, 
FirstName, LastName,
SUM(ROUND(Quantity * UnitPrice * (1 - Discount), 2)) as suma
FROM Orders
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Orders.OrderID, CompanyName, FirstName, LastName
HAVING SUM(Quantity) > 250
ORDER BY 5 DESC

-- SELECT CategoryName, SUM(Quantity)
SELECT Orders.OrderID,
ROUND(SUM(Quantity * [Order Details].UnitPrice * (1 - Discount)) + Freight, 2)
FROM Orders
INNER JOIN [Order Details]
ON [Order Details].OrderID = Orders.OrderID
GROUP BY Orders.OrderID, Freight
ORDER BY 2 DESC
-- ORDER BY SUM(Quantity) DESC


SELECT CompanyName, COUNT(*)
FROM Orders
INNER JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE YEAR(ShippedDate) = 1997
GROUP BY CompanyName
ORDER BY 2 DESC

