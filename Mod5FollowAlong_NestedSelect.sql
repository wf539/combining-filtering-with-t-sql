USE [Northwind];
GO

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
      ,[Title]
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
  FROM [Northwind].[dbo].[Employees]
  WHERE
	[EmployeeID] = 1
	OR [EmployeeID] = 3
	OR [EmployeeID] = 7
	OR [EmployeeID] = 8; --returns 4 rows

--Equivalent to
SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
      ,[Title]
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
  FROM [Northwind].[dbo].[Employees]
  WHERE
	[EmployeeID] IN (1,3,7,8);

--Invert selection
SELECT [EmployeeID]
      ,[LastName]
      ,[FirstName]
      ,[Title]
      ,[TitleOfCourtesy]
      ,[BirthDate]
      ,[HireDate]
      ,[Address]
      ,[City]
      ,[Region]
      ,[PostalCode]
      ,[Country]
      ,[HomePhone]
      ,[Extension]
      ,[Photo]
      ,[Notes]
      ,[ReportsTo]
      ,[PhotoPath]
  FROM [Northwind].[dbo].[Employees]
  WHERE
	[EmployeeID] NOT IN (1,3,7,8);

	--Example 2
SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]
  WHERE
	[Discontinued] = 1; --returns 8 rows

--Equivalent using IN
SELECT [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
  FROM [Northwind].[dbo].[Products]
  WHERE
	[ProductID] IN (5, 9, 17, 24, 28, 29, 42, 53);

--Get Order details where Product is Discontinued
SELECT [OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[Discount]
  FROM [Northwind].[dbo].[Order Details]
  WHERE
	[ProductID] IN (5, 9, 17, 24, 28, 29, 42, 53);	--returns 228 rows

--Equivalent using a subquery
SELECT [OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[Discount]
  FROM [Northwind].[dbo].[Order Details]
  WHERE
	[ProductID] IN (SELECT
		[ProductID] 
		FROM [Products] 
		WHERE [Discontinued] = 1);

--From previous clip, add ORDER BY criteria
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
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC;

--Test subquery
SELECT
		[ProductID] 
		FROM [Products] 
		WHERE [Discontinued] = 1;

--Equivalent with subquery
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
	OD.[ProductID] IN (
	SELECT
		[ProductID] 
		FROM [Products] 
		WHERE [Discontinued] = 1)
	--DATEPART(YEAR, O.[OrderDate]) < 1999
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --returns 207 rows

--Validate: OrderID 10262 
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
	OD.[ProductID] IN (SELECT
		[ProductID] 
		FROM [Products] 
		WHERE [Discontinued] = 1)
	AND OD.[OrderID] =10262
GROUP BY
	C.[CompanyName]
	,O.[OrderDate]
	,O.[ShippedDate]
	,O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --returns Rattlesnake Canyon Grocery	Jul 22, 1996	Jul 25, 1996	204.00

--Compare values 
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
	--OD.[ProductID] IN (SELECT
	--	[ProductID] 
	--	FROM [Products] 
	--	WHERE [Discontinued] = 1)
	--AND 
	OD.[OrderID] =10262
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --returns Total Rattlesnake Canyon Grocery	Jul 22, 1996	Jul 25, 1996	624.80


SELECT 
	*
  FROM [Northwind].[dbo].[Order Details] AS OD
  JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
  WHERE
	OD.[OrderID] = 10262;

--Qty 12 * 204 = 624
--Query needs to filter on OrderID where products discontinued
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
	OD.[OrderID] IN (
	SELECT
		[OrderID] 
		FROM [Order Details] AS OD
		JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
		WHERE P.[Discontinued] = 1)
	AND 
	OD.[OrderID] =10262
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --Total is correct

--Negate IN, return all orders
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
	OD.[OrderID] NOT IN (
	SELECT
		[OrderID] 
		FROM [Order Details] AS OD
		JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
		WHERE P.[Discontinued] = 1)
	--AND 
	--OD.[OrderID] =10262
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC;  --returns 623 rows. 
							--Add 207 orders with discontinued products: 830 orders QED

--LIKE operator
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
	--OD.[OrderID] NOT IN (
	--SELECT
	--	[OrderID] 
	--	FROM [Order Details] AS OD
	--	JOIN [Products] AS P ON OD.[ProductID] = P.[ProductID]
	--	WHERE P.[Discontinued] = 1)
	C.[CompanyName] LIKE N'Rattlesnake%'
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC;

--LIKE operator
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
	C.[CompanyName] LIKE N'%snake%'
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --also returns 18 rows

--LIKE operator
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
	C.[CompanyName] LIKE N'A%'
GROUP BY
	C.[CompanyName],
	O.[OrderDate],
	O.[ShippedDate],
	O.[OrderID]
ORDER BY
	O.[ShippedDate] DESC; --initial letter only. Reurns 30 rows