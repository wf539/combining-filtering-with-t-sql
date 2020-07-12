USE [Northwind];
GO

--from previous
SELECT
*
FROM [dbo].[Orders]
JOIN [Order Details] ON [Orders].[OrderID] = [Order Details].[OrderID]
WHERE
	[Orders].[OrderID] = 10248;

--Set aliases
SELECT
*
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]	--INNER JOIN implied
WHERE
	O.[OrderID] = 10248;

--Limit columns returned
SELECT
	O.[OrderDate],
	O.[ShippedDate],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]	--INNER JOIN implied
WHERE
	O.[OrderID] = 10248;


--Apply formatting
SELECT
	CONVERT(VARCHAR, O.[OrderDate], 101),
	CONVERT(VARCHAR, O.[ShippedDate], 101),
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity])
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
WHERE
	O.[OrderID] = 10248;

--Add column labels
SELECT
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	CONVERT(VARCHAR, O.[ShippedDate], 101) AS [Shipped date],
	O.[ShipAddress],
	OD.[UnitPrice],
	OD.[Quantity],
	OD.[Discount],
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
WHERE
	O.[OrderID] = 10248;

--Join Products Table to get Product Name
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
WHERE
	O.[OrderID] = 10248;

--Join Customers Table
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

--Revert, then, re-execute query
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
	(OD.[UnitPrice] * OD.[Quantity]) AS [Total price]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	O.[OrderID] = 10248;