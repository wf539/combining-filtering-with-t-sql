SELECT DATENAME(WEEKDAY, GETDATE());

--Return weekday name
SELECT CONCAT(N'June 25, 2020 is on a ', DATENAME(WEEKDAY, N'06/25/2020'));
/*
	CONCAT links
	DATENAME formats
*/
SELECT CONCAT(
	N'June 25, 2020 is day ', 
	DATENAME(DAYOFYEAR, N'06/25/2020'), 
	N' of the year ', 
	DATENAME(YEAR, N'06/25/2020')
	);

SELECT @@DATEFIRST;


SELECT DATENAME(WEEKDAY, GETDATE()), DATENAME(MONTH, GETDATE()), DATENAME(QUARTER, GETDATE());

SELECT DATEPART(WEEKDAY, GETDATE()), DATEPART(MONTH, GETDATE()), DATEPART(QUARTER, GETDATE());

USE [Northwind];
GO

SELECT
	[OrderID]
	, [CustomerID]
	, [EmployeeID]
	, [OrderDate]
	, [RequiredDate]
	, [ShippedDate]
	, [ShipVia]
	, [Freight]
	, [ShipName]
	, [ShipAddress]
	, [ShipCity]
	, [ShipRegion]
	, [ShipPostalCode]
	, [ShipCountry]
FROM [dbo].[Orders];

--How long did it take from when an order was placed until it shipped?
--Use DATEDIFF

SELECT 
	DATEDIFF(d, [OrderDate], [ShippedDate])
FROM [dbo].[Orders];

--Apply an order
SELECT 
	DATEDIFF(d, [OrderDate], [ShippedDate])
FROM [dbo].[Orders]
ORDER BY
	DATEDIFF(d, [OrderDate], [ShippedDate]);

--Investigate NULLS
SELECT 
	[OrderDate]
	, [ShippedDate]
FROM [dbo].[Orders]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL;


SELECT 
	[OrderDate]
	, [ShippedDate]
FROM [dbo].[Orders]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;