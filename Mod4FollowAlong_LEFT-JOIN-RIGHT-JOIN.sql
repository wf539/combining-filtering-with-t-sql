USE [Northwind];
GO

--Set Customer ID to NULL, re-execute query
UPDATE [Orders]
SET 
	[CustomerID] = NULL
WHERE
	[OrderID] = 10248;

SELECT
	P.[ProductName],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;

--LEFT JOIN Customers
SELECT
	P.[ProductName],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
LEFT JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;

--LEFT JOIN Customers and add data from Customers which match JOIN criteria
SELECT
	P.[ProductName],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price],
	C.*
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
LEFT JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;


--Restore CustID, then, re-execute query
UPDATE [Orders]
SET 
	[CustomerID] = N'VINET'
WHERE
	[OrderID] = 10248;

SELECT
	P.[ProductName],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price],
	C.*
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
LEFT JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;

SELECT
	P.[ProductName],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;

USE [pubs];
GO

--Return all rows
SELECT
*
FROM [authors] AS A
LEFT JOIN [titleauthor] AS TA ON A.[au_id] = TA.[au_id]
LEFT JOIN [titles] AS T ON TA.[title_id] = T.[title_id]

--Exclude Authors with books
SELECT
*
FROM [authors] AS A
LEFT JOIN [titleauthor] AS TA ON A.[au_id] = TA.[au_id]
LEFT JOIN [titles] AS T ON TA.[title_id] = T.[title_id]
WHERE
	TA.[au_id] IS NULL

--Return all titleauthor rows, with matching rows from authors
SELECT
*
FROM [titleauthor] AS TA
RIGHT JOIN [authors] AS A ON A.[au_id] = TA.[au_id]

--Exclude Authors with books
SELECT
*
FROM [titleauthor] AS TA
RIGHT JOIN [authors] AS A ON A.[au_id] = TA.[au_id]
WHERE
	TA.[au_id] IS NULL