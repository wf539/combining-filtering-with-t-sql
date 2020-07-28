USE [Northwind];
GO

SELECT
	C.[CompanyName],
	CONVERT(VARCHAR, O.[OrderDate], 107) AS [Ordered date],
	CASE
		WHEN O.[ShippedDate] IS NOT NULL THEN
		CONVERT(VARCHAR, O.[ShippedDate], 107)
		ELSE N'Pending shipment'
	END AS [Shipped],
	FORMAT(SUM(OD.[Quantity] * OD.[UnitPrice]), 'N', 'en-us') AS [Total]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate]
ORDER BY
	C.[CompanyName];

--Change sort
--Establish founding date
SELECT
	C.[CompanyName],
	CONVERT(VARCHAR, O.[OrderDate], 107) AS [Ordered date],
	CASE
		WHEN O.[ShippedDate] IS NOT NULL THEN
		CONVERT(VARCHAR, O.[ShippedDate], 107)
		ELSE N'Pending shipment'
	END AS [Shipped],
	FORMAT(SUM(OD.[Quantity] * OD.[UnitPrice]), 'N', 'en-us') AS [Total]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate]
ORDER BY
	O.[OrderDate];

--Introduce WHERE
SELECT
	C.[CompanyName],
	CONVERT(VARCHAR, O.[OrderDate], 107) AS [Ordered date],
	CASE
		WHEN O.[ShippedDate] IS NOT NULL THEN
		CONVERT(VARCHAR, O.[ShippedDate], 107)
		ELSE N'Pending shipment'
	END AS [Shipped],
	FORMAT(SUM(OD.[Quantity] * OD.[UnitPrice]), 'N', 'en-us') AS [Total]
FROM [dbo].[Orders] AS O
JOIN [Order Details] AS OD ON O.[OrderID] = OD.[OrderID]
JOIN [Customers] AS C ON O.[CustomerID] = C.[CustomerID]
WHERE
	DATEPART(YEAR, O.[OrderDate]) < 1999
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate];
--ORDER BY
--	O.[OrderDate];