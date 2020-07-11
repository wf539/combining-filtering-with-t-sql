USE [Northwind];
GO

SELECT
	[OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]
FROM [dbo].[Orders];

--apply filter
SELECT
	[OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]
FROM [dbo].[Orders]
WHERE
	[OrderID] = 10248;

SELECT [OrderID]
      ,[ProductID]
      ,[UnitPrice]
      ,[Quantity]
      ,[Discount]
  FROM [Northwind].[dbo].[Order Details]
  WHERE
	[OrderID] = 10248;

SELECT
*
FROM [dbo].[Orders]
JOIN [Order Details] ON [Orders].[OrderID] = [Order Details].[OrderID]
  WHERE
	[Orders].[OrderID] = 10248;

--SELECT
--	[OrderID],
--	[CustomerID],
--	[EmployeeID],
--	[OrderDate],
--	[RequiredDate],
--	[ShippedDate],
--	[ShipVia],
--	[Freight],
--	[ShipName],
--	[ShipAddress],
--	[ShipCity],
--	[ShipRegion],
--	[ShipPostalCode],
--	[ShipCountry]
--FROM [dbo].[Orders]
--JOIN [Order Details] ON [Orders].[OrderID] = [Order Details].[OrderID];