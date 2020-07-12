USE [Northwind];
GO

/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT [EmployeeID]
--      ,[LastName]
--      ,[FirstName]
--      ,[Title]
--      ,[TitleOfCourtesy]
--      ,[BirthDate]
--      ,[HireDate]
--      ,[Address]
--      ,[City]
--      ,[Region]
--      ,[PostalCode]
--      ,[Country]
--      ,[HomePhone]
--      ,[Extension]
--      ,[Photo]
--      ,[Notes]
--      ,[ReportsTo]
--      ,[PhotoPath]
--  FROM [Northwind].[dbo].[Employees] AS EMP
--  LEFT JOIN [dbo].[Employees] AS MAN 

  SELECT 
  *
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID]; --9 rows returned

  --Changing LEFT to INNER (remove 'LEFT ') will exclude Andrew Fuller (he's a Manager)
  SELECT 
  *
  FROM [Northwind].[dbo].[Employees] AS EMP
  JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID];	--8 rows returned

  --Revert to LEFT JOIN
  --Limit data returned to resultset
  SELECT 
	EMP.[EmployeeID],
	EMP.[FirstName],
	MAN.[EmployeeID],
	MAN.[FirstName]
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID]; --9 rows returned

  --Add column labels
  SELECT 
	EMP.[EmployeeID] AS [Employee ID],
	EMP.[FirstName] AS [Employee first name],
	MAN.[EmployeeID] AS [Manager ID],
	MAN.[FirstName] AS [Manager first name]
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID];

  --Apply formatting
  SELECT 
	EMP.[EmployeeID] AS [Employee ID],
	CONCAT_WS(N' ', EMP.[FirstName], EMP.[LastName]) AS [Employee],
	MAN.[EmployeeID] AS [Manager ID],
	CONCAT_WS(N' ', MAN.[FirstName], MAN.[LastName]) AS [Manager]
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID];

  --CASE WHEN practice
  SELECT 
	EMP.[EmployeeID] AS [Employee ID],
	CONCAT_WS(N' ', EMP.[FirstName], EMP.[LastName]) AS [Employee],
	MAN.[EmployeeID] AS [Manager ID],
	CASE
		WHEN MAN.[EmployeeID] IS NULL THEN N'No manager'
	ELSE CONCAT_WS(N' ', MAN.[FirstName], MAN.[LastName]) 
	END AS [Manager]
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID];

  --Deal with leading/trailing spaces
  SELECT 
	EMP.[EmployeeID] AS [Employee ID],
	TRIM(CONCAT_WS(N' ', EMP.[FirstName], EMP.[LastName])) AS [Employee],
	MAN.[EmployeeID] AS [Manager ID],
	CASE
		WHEN MAN.[EmployeeID] IS NULL THEN N'No manager'
	ELSE TRIM(CONCAT_WS(N' ', MAN.[FirstName], MAN.[LastName])) 
	END AS [Manager]
  FROM [Northwind].[dbo].[Employees] AS EMP
  LEFT JOIN [dbo].[Employees] AS MAN ON EMP.[ReportsTo] = MAN.[EmployeeID];

  /*
   add ParentCompanyID to [dbo].[Customers]
  */

--USE [Northwind];
--GO

--ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_ParentCompany] FOREIGN KEY([ParentCompanyID])
--REFERENCES [dbo].[Customers] ([CustomerID])
--GO
--ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_ParentCompany]
--GO

USE [Northwind]
GO

UPDATE [dbo].[Customers]
   SET [ParentCompanyID] = N'BOLID'
 WHERE [CustomerID] 
 IN(N'FRANS',N'FURIB',N'GALED',N'GODOS',N'GOURL',N'GREAL',N'GROSR',N'HANAR',N'HILAA',N'HUNGC')
GO

USE [Northwind]
GO

UPDATE [dbo].[Customers]
   SET [ParentCompanyID] = N'WOLZA'
 WHERE [CustomerID] 
 IN(N'MORGK',N'NORTS',N'OCEAN',N'OLDWO',N'OTTIK',N'PARIS',N'PERIC',N'PICCO',N'PRINI',N'QUEDE',N'QUEEN',N'QUICK')
GO

SELECT
*
FROM [Customers] AS C
LEFT JOIN [Customers] P ON C.[ParentCompanyID] = P.[CustomerID]; --returns 91 rows

--Limit returned data
SELECT
	C.[CustomerID],
	C.[CompanyName],
	P.[CustomerID] AS [Parent ID],
	P.[CompanyName] AS [Parent company]
FROM [Customers] AS C
LEFT JOIN [Customers] P ON C.[ParentCompanyID] = P.[CustomerID];

--Add 'No parent' if applicable
SELECT
	C.[CustomerID],
	C.[CompanyName],
	P.[CustomerID] AS [Parent ID],
	CASE
		WHEN P.[CustomerID] IS NULL THEN N'No parent'
		ELSE P.[CompanyName] 
	END AS [Parent company]
FROM [Customers] AS C
LEFT JOIN [Customers] P ON C.[ParentCompanyID] = P.[CustomerID];

--Exclude NULLS
SELECT
	C.[CustomerID],
	C.[CompanyName],
	P.[CustomerID] AS [Parent ID],
	CASE
		WHEN P.[CustomerID] IS NULL THEN N'No parent'
		ELSE P.[CompanyName] 
	END AS [Parent company]
FROM [Customers] AS C
LEFT JOIN [Customers] P ON C.[ParentCompanyID] = P.[CustomerID]
WHERE
	P.[CustomerID] IS NOT NULL;