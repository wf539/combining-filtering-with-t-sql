--Source databases found at: https://github.com/tamara-pattinson/combining-filtering-with-t-sql

USE [Northwind];
GO

SELECT
*
FROM [dbo].[Employees];

--
SELECT
	[FirstName]
	, [LastName]
	, [Title]
	, [BirthDate]
	, [HireDate]
FROM [dbo].[Employees];

--
SELECT
	[FirstName]
	, [LastName]
	, [Title]
	, [BirthDate]
	, [HireDate]
FROM [dbo].[Employees]
WHERE
	[Title] = N'Sales representative';

--
SELECT
[FirstName] + ' ' + [LastName]
FROM [dbo].[Employees];

--
SELECT
[FirstName] + ' ' + [LastName] AS [Northwind employees]
FROM [dbo].[Employees];

--
SELECT
	CONCAT([FirstName], ' ', [LastName]) AS [Northwind employees]
FROM [dbo].[Employees];

--
SELECT 'Today is: ' + GETDATE();	--returns error

SELECT GETDATE() + 2;

SELECT 'Today is: ' + CONVERT(VARCHAR, GETDATE(), 1);

SELECT CONCAT('Today is: ', GETDATE());

SELECT CONCAT('Today is: ', CONVERT(VARCHAR, GETDATE(), 1));

--
SELECT CAST(GETDATE() AS VARCHAR(50));
--
SELECT CAST(GETDATE() AS VARCHAR(11));

--
SELECT CONVERT(VARCHAR(50), GETDATE(), 0);

--
SELECT CONVERT(VARCHAR(50), GETDATE(), 101);
--
SELECT CAST(GETDATE() AS VARCHAR(11)) AS [Current date];
--
SELECT CONVERT(VARCHAR(50), GETDATE(), 101) AS [Current date];

--
SELECT CAST(N'hello there' AS INT);	--returns error
--
SELECT CONVERT(INT, N'hello there');--returns error

--
SELECT TRY_CAST(N'hello there' AS INT); --returns NULL
--
SELECT TRY_CONVERT(INT, N'hello there');--returns NULL

USE [pubs];
GO

/****** Object:  Table [dbo].[ColorTable1]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorTable1](
	[ColorName] [varchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorTable2]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorTable2](
	[ColorName] [varchar](50) NOT NULL,
	[SortOrder] [varchar](50) NOT NULL
) ON [PRIMARY]
GO

INSERT [dbo].[ColorTable1] ([ColorName], [SortOrder]) VALUES (N'Green', 1)
GO
INSERT [dbo].[ColorTable1] ([ColorName], [SortOrder]) VALUES (N'Purple', 2)
GO
INSERT [dbo].[ColorTable1] ([ColorName], [SortOrder]) VALUES (N'Yellow', 3)
GO
INSERT [dbo].[ColorTable1] ([ColorName], [SortOrder]) VALUES (N'Blue', 4)
GO
INSERT [dbo].[ColorTable1] ([ColorName], [SortOrder]) VALUES (N'Orange', 5)
GO
INSERT [dbo].[ColorTable2] ([ColorName], [SortOrder]) VALUES (N'Green', N'1')
GO
INSERT [dbo].[ColorTable2] ([ColorName], [SortOrder]) VALUES (N'Purple', N'2')
GO
INSERT [dbo].[ColorTable2] ([ColorName], [SortOrder]) VALUES (N'Yellow', N'3')
GO
INSERT [dbo].[ColorTable2] ([ColorName], [SortOrder]) VALUES (N'Blue', N'4')
GO
INSERT [dbo].[ColorTable2] ([ColorName], [SortOrder]) VALUES (N'Orange', N'5')
GO

--USE [pubs];
--GO

--UPDATE [dbo].[ColorTable2]
--   SET [SortOrder] = N'1'
-- WHERE [ColorName] = N'Green'
--GO

SELECT
	[ColorName]
	, [SortOrder]
FROM [dbo].[ColorTable1];

SELECT
	[ColorName]
	, [SortOrder]
FROM [dbo].[ColorTable2];

--
--SELECT
--	[ColorName]
--	, [SortOrder]
--FROM [dbo].[ColorTable1]
--JOIN [dbo].[ColorTable2] ON [ColorTable1].[SortOrder] = [ColorTable2].[SortOrder];


--Implicit convert if Sort order data type in ColorTable2 is string literal N'1'
SELECT
*
FROM [dbo].[ColorTable1]
JOIN [dbo].[ColorTable2] ON [ColorTable1].[SortOrder] = [ColorTable2].[SortOrder];

USE [pubs];
GO

--revert to VARCHAR type for sort order
UPDATE [dbo].[ColorTable2]
   SET [SortOrder] = N'one'
 WHERE [ColorName] = N'Green'
GO

--check UPDATE
SELECT
	[ColorName]
	, [SortOrder]
FROM [dbo].[ColorTable2];


--This now throws error: Msg 245, Level 16, State 1, Line 173 Conversion failed when converting the varchar value 'one' to data type int.
SELECT
*
FROM [dbo].[ColorTable1]
JOIN [dbo].[ColorTable2] ON [ColorTable1].[SortOrder] = [ColorTable2].[SortOrder];

USE [pubs];
GO

UPDATE [dbo].[ColorTable2]
   SET [SortOrder] = N'1'
 WHERE [ColorName] = N'Green'
GO

--check UPDATE
SELECT
	[ColorName]
	, [SortOrder]
FROM [dbo].[ColorTable2];
GO

--TRY_CAST overcomes problem
SELECT
*
FROM [dbo].[ColorTable1]
JOIN [dbo].[ColorTable2] ON [ColorTable1].[SortOrder] = TRY_CAST([ColorTable2].[SortOrder] AS INT);