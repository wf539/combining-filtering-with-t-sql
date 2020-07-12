USE [pubs];
GO

--Return all rows
SELECT
*
FROM [authors] AS A
LEFT JOIN [titleauthor] AS TA ON A.[au_id] = TA.[au_id]
LEFT JOIN [titles] AS T ON TA.[title_id] = T.[title_id]

--FULL JOIN example
SELECT
*
FROM [authors] AS A
FULL JOIN [titleauthor] AS TA ON A.[au_id] = TA.[au_id]
FULL JOIN [titles] AS T ON TA.[title_id] = T.[title_id]

USE [Northwind];
GO

SELECT
	C.[CompanyName],
	O.[OrderID]
FROM [Customers] AS C
FULL JOIN [Orders] AS O ON C.[CustomerID] = O.[CustomerID]
ORDER BY
	[OrderID]