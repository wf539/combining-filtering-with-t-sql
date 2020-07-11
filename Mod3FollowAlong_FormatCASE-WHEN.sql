USE [Northwind];
GO

SELECT
*
FROM [dbo].[Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]

--SELECT 
--	[OrderDate]
--	, [ShippedDate]
--FROM [dbo].[Orders]
--WHERE
--	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
--	OR
--	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

/* Please provide a report with

Northwind rep
Company name
Company contact
Date ordered
Date shipped
If not yet fulfilled, it should say 'pending shipment

*/

--Keeping * in SELECT to see all fields
--without alias: which Table is being referenced?
SELECT
	Employees.[EmployeeID],
	Orders.[EmployeeID], *
FROM [Employees]
JOIN [Orders] ON Employees.[EmployeeID] = Orders.[EmployeeID]
JOIN [Customers] ON Customers.[CustomerID] = Orders.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--shorter alias
SELECT
	E.[EmployeeID],
	O.[EmployeeID], *
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--add column alias
SELECT
	E.[EmployeeID] AS EmployeesEmployeeID,
	O.[EmployeeID] AS OrdersEmployeeID, *
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--add first name, last name, company name, required date, shipped date and Table aliases
--verify 41 records are returned
SELECT
	E.[FirstName],
	E.[LastName],
	C.[CompanyName],
	O.[RequiredDate],
	O.[ShippedDate],
	E.[EmployeeID] AS EmployeesEmployeeID,
	O.[EmployeeID] AS OrdersEmployeeID, *
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--Begin formatting

SELECT
	--E.[FirstName],
	--E.[LastName],
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])), --Trim leading and traing spaces, and then Concatenate with separator
	C.[CompanyName],
	O.[RequiredDate],
	O.[ShippedDate],
	E.[EmployeeID] AS EmployeesEmployeeID,
	O.[EmployeeID] AS OrdersEmployeeID, *
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])),
	C.[CompanyName],
	C.[ContactName],
	--O.[OrderDate],
	CONVERT(VARCHAR, O.[OrderDate], 101), --Formatted Order date
	O.[ShippedDate]
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--
SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])),
	C.[CompanyName],
	C.[ContactName],
	CONVERT(VARCHAR, O.[OrderDate], 101),
	--O.[ShippedDate]
	FORMAT(O.[ShippedDate], N'MMM dd, yyyy') --Formatted Shipped date
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--
SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])),
	C.[CompanyName],
	C.[ContactName],
	CONVERT(VARCHAR, O.[OrderDate], 101),
	FORMAT(O.[ShippedDate], N'MMM dd, yyyy'),
	DATEDIFF(d, O.[OrderDate], O.[ShippedDate])	--formatted interval count
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--Give columns an alias
SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])) AS [Northwind Representative],
	C.[CompanyName] AS [Company name],
	C.[ContactName] AS [Contact name],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	FORMAT(O.[ShippedDate], N'MMM dd, yyyy') AS [Shipped date],
	DATEDIFF(d, O.[OrderDate], O.[ShippedDate])	AS [Number of days to ship]
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--CASE WHEN FAILS without data type conversion
SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])) AS [Northwind Representative],
	C.[CompanyName] AS [Company name],
	C.[ContactName] AS [Contact name],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	FORMAT(O.[ShippedDate], N'MMM dd, yyyy') AS [Shipped date],
	--DATEDIFF(d, O.[OrderDate], O.[ShippedDate])	AS [Number of days to ship]
	CASE
		WHEN DATEDIFF(d, O.[OrderDate], O.[ShippedDate]) IS NOT NULL THEN
		DATEDIFF(d, O.[OrderDate], O.[ShippedDate])
		ELSE N'Pending payment'
		END AS [Number of days to ship]
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--CASE WHEN
SELECT
	TRIM(CONCAT_WS(' ', E.[FirstName], E.[LastName])) AS [Northwind Representative],
	C.[CompanyName] AS [Company name],
	C.[ContactName] AS [Contact name],
	CONVERT(VARCHAR, O.[OrderDate], 101) AS [Order date],
	FORMAT(O.[ShippedDate], N'MMM dd, yyyy') AS [Shipped date],
	CASE
		WHEN DATEDIFF(d, O.[OrderDate], O.[ShippedDate]) IS NOT NULL THEN
		CAST(DATEDIFF(d, O.[OrderDate], O.[ShippedDate]) AS VARCHAR)
		ELSE N'Pending payment'
		END AS [Number of days to ship]
FROM [Employees] AS E
JOIN [Orders] AS O ON E.[EmployeeID] = O.[EmployeeID]
JOIN [Customers] AS C ON C.[CustomerID] = O.[CustomerID]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;