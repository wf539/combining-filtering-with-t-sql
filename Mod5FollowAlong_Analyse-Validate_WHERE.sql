USE [Northwind];
GO

SELECT 
	[OrderDate]
	, [ShippedDate]
FROM [dbo].[Orders]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL
	OR
	DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--NULL: Absence of value
SELECT
	[OrderDate],
	[ShippedDate],
	*
FROM [dbo].[Orders]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NULL;
	--OR
	--DATEDIFF(d, [OrderDate], [ShippedDate]) > 30;

--Know your data: is it valid?
--Negate NULL
SELECT
	[OrderDate],
	[ShippedDate],
	*
FROM [dbo].[Orders]
WHERE
	DATEDIFF(d, [OrderDate], [ShippedDate]) IS NOT NULL;

--Validate with COUNT

SELECT
	COUNT(*)
FROM [dbo].[Orders]; --should return 830

SELECT
	COUNT(*)
FROM [dbo].[Orders]
WHERE
	[ShippedDate] IS NULL;

SELECT
	COUNT(*)
FROM [dbo].[Orders]
WHERE
	[ShippedDate] IS NOT NULL;

SELECT
	*
FROM [dbo].[Orders]
ORDER BY
	[OrderDate] ASC;

UPDATE [dbo].[Orders]
SET [OrderDate] = N'01/01/1900'
WHERE
	[OrderID] = 10248;

UPDATE [dbo].[Orders]
SET [OrderDate] = N'07/04/1996'
WHERE
	[OrderID] = 10248;