-- zad 4
-- a)
SELECT EmpA.FirstName, EmpA.LastName, EmpA.EmployeeID, 
ROUND(SUM(ROUND(Quantity * UnitPrice * (1 - Discount), 2)), 2) AS [wartosc zamowien]
FROM Employees AS EmpA
INNER JOIN Employees AS EmpB ON EmpA.EmployeeID = EmpB.ReportsTo
INNER JOIN Orders ON EmpA.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY EmpA.EmployeeID, EmpA.FirstName, EmpA.LastName
ORDER BY 3

-- b)
SELECT EmpA.FirstName, EmpA.LastName, EmpA.EmployeeID, 
ROUND(SUM(ROUND(Quantity * UnitPrice * (1 - Discount), 2)), 2) AS [wartosc zamowien]
FROM Employees AS EmpA
LEFT JOIN Employees AS EmpB ON EmpA.EmployeeID = EmpB.ReportsTo
INNER JOIN Orders ON EmpA.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE EmpB.EmployeeID IS NULL
GROUP BY EmpA.EmployeeID, EmpA.FirstName, EmpA.LastName
ORDER BY 3

