USE [pubs];
GO

/****** Object:  Table [dbo].[SetOperatorDemo1]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOperatorDemo1](
	[Name] [varchar](50) NOT NULL,
	[IsEmployee] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOperatorDemo2]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOperatorDemo2](
	[Animal] [varchar](50) NOT NULL,
	[Has4Legs] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOperatorNumberDemo1]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOperatorNumberDemo1](
	[Number] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetOperatorNumberDemo2]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetOperatorNumberDemo2](
	[Number] [int] NOT NULL
) ON [PRIMARY]
GO

INSERT [dbo].[SetOperatorDemo1] ([Name], [IsEmployee]) VALUES (N'Nancy Smith', 1)
GO
INSERT [dbo].[SetOperatorDemo1] ([Name], [IsEmployee]) VALUES (N'Joe Johnson', 1)
GO
INSERT [dbo].[SetOperatorDemo1] ([Name], [IsEmployee]) VALUES (N'Valerie Valentine', 1)
GO
INSERT [dbo].[SetOperatorDemo1] ([Name], [IsEmployee]) VALUES (N'Lindy Jackson', 0)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Parrot', 0)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Horse', 1)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Dog', 1)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Bear', 1)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Kangaroo', 1)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Kangaroo', 1)
GO
INSERT [dbo].[SetOperatorDemo2] ([Animal], [Has4Legs]) VALUES (N'Horse', 0)
GO
INSERT [dbo].[SetOperatorNumberDemo1] ([Number]) VALUES (1)
GO
INSERT [dbo].[SetOperatorNumberDemo1] ([Number]) VALUES (2)
GO
INSERT [dbo].[SetOperatorNumberDemo1] ([Number]) VALUES (3)
GO
INSERT [dbo].[SetOperatorNumberDemo1] ([Number]) VALUES (4)
GO
INSERT [dbo].[SetOperatorNumberDemo1] ([Number]) VALUES (5)
GO
INSERT [dbo].[SetOperatorNumberDemo2] ([Number]) VALUES (4)
GO
INSERT [dbo].[SetOperatorNumberDemo2] ([Number]) VALUES (5)
GO
INSERT [dbo].[SetOperatorNumberDemo2] ([Number]) VALUES (6)
GO
INSERT [dbo].[SetOperatorNumberDemo2] ([Number]) VALUES (7)
GO
INSERT [dbo].[SetOperatorNumberDemo2] ([Number]) VALUES (8)
GO

SELECT
	*
FROM [dbo].[SetOperatorNumberDemo1];

SELECT
	*
FROM [dbo].[SetOperatorNumberDemo2];

SELECT
	*
FROM [dbo].[SetOperatorNumberDemo1]
UNION ALL
SELECT
	*
FROM [dbo].[SetOperatorNumberDemo2];

--Set operators Rule 1. Number of fields must be the same
SELECT
	[Number],
	N'Yes' AS [Favourite number]
FROM [dbo].[SetOperatorNumberDemo1]
UNION ALL
SELECT
	*
FROM [dbo].[SetOperatorNumberDemo2];

SELECT
	[Number],
	N'Yes' AS [Favourite number]
FROM [dbo].[SetOperatorNumberDemo1]
UNION ALL
SELECT
	[Number],
	N'No' AS [Favourite number]
FROM [dbo].[SetOperatorNumberDemo2];

SELECT
*
FROM [dbo].[ColorTable1]
JOIN [dbo].[ColorTable2] ON [ColorTable1].[SortOrder] = TRY_CAST([ColorTable2].[SortOrder] AS INT);

SELECT
	*
FROM [dbo].[ColorTable1];

SELECT
	*
FROM [dbo].[ColorTable2];

--Set operators Rule 2. 
--Differing data types generate error with UNION ALL
SELECT
	*
FROM [dbo].[ColorTable1]
UNION ALL
SELECT
	*
FROM [dbo].[ColorTable2];

--Use TRY_CAST()
SELECT
	[ColorName],
	[SortOrder]
FROM [dbo].[ColorTable1]
UNION ALL
SELECT
	[ColorName],
	TRY_CAST([SortOrder] AS INT)
FROM [dbo].[ColorTable2];	--returns all rows from both tables

--Set operators Rule 3. Field orders matter
USE [Northwind];
GO

SELECT
	[CompanyName],
	[ContactName]
FROM [dbo].[Customers]
WHERE
	[CompanyName] LIKE N'A%'
UNION ALL
SELECT
	[ContactName],
	[CompanyName]
FROM [dbo].[Customers]
WHERE
	[CompanyName] LIKE N'A%';

--Set operators Rule 4. First query always wins!

SELECT
	[CompanyName] AS [Company],
	[ContactName] AS [Contact]
FROM [dbo].[Customers]
WHERE
	[CompanyName] LIKE N'A%'
UNION ALL
SELECT
	[CompanyName],
	[ContactName]
FROM [dbo].[Customers]
WHERE
	[CompanyName] LIKE N'B%';