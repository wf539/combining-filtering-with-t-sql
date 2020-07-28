USE [pubs];
GO

/****** Object:  Table [dbo].[HR_Information]    Script Date: 1/14/2020 1:31:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HR_Information](
	[emp_id] [char](9) NOT NULL,
	[SSN] [nchar](9) NULL,
	[Salary] [decimal](18, 0) NULL,
	[IsManager] [bit] NULL,
	[DOB] [date] NULL,
	[Office] [varchar](50) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'RMA42628M', N'525678900', NULL, NULL, CAST(N'2000-06-08' AS Date), N'Brisbane')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'A-C71970F', N'343536987', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1980-06-13' AS Date), N'Mobile')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'A-R89858F', N'528789332', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Portland')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'AMD15433F', N'158987632', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Mobile')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'ARD36773F', N'151967532', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1990-06-13' AS Date), N'Mobile')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'CFH28514M', N'987565432', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1982-06-13' AS Date), N'Portland')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'CGS88322F', N'134679852', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1981-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'DBT39435M', N'197382456', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1982-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'DWR65030M', N'123654789', CAST(0 AS Decimal(18, 0)), 0, CAST(N'2002-06-13' AS Date), N'Portland')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'ENL44273F', N'191988752', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1965-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'F-C16315M', N'126654823', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1968-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'GHT50241M', N'456322189', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1967-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'H-B39728F', N'152456892', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'HAN90777M', N'153354853', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1979-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'HAS54740M', N'156554892', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'JYL26161F', N'123584522', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1969-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'KFJ64308F', N'125586842', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1985-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'KJJ92907F', N'252856599', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1979-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'L-B31947F', N'987903176', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1979-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'LAL21447M', N'160098756', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1990-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'M-L67958F', N'165698330', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'M-P91209M', N'601258973', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1980-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'M-R38834F', N'268236535', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MAP77183M', N'528971316', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MAS70474F', N'131238990', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MFS52347M', N'537264899', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MGK44605M', N'633528977', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MJP25939M', N'944622632', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'MMS49649F', N'263526897', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PCM98509F', N'459888252', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1987-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PDI47470M', N'876239887', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1980-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PHF38899M', N'321645987', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1981-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PMA42628M', N'164352789', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'POK93028M', N'948576312', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1981-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PSA89086M', N'988776542', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PSP68661F', N'062519662', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1981-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PTC11962M', N'150032098', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1980-06-13' AS Date), N'Portland')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'PXH22250M', N'367357252', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1981-06-08' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'R-M53550M', N'459982776', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Portland')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'RBM23061F', N'258756348', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Jacksonville')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'RMA42628M', N'344567896', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1980-06-13' AS Date), N'Brisbane')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'SKO22412M', N'546549881', CAST(0 AS Decimal(18, 0)), 0, CAST(N'2002-06-13' AS Date), N'Brisbane')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'TPO55093M', N'649558700', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Brisbane')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'VPA30890F', N'986598000', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1975-06-13' AS Date), N'Brisbane')
GO
INSERT [dbo].[HR_Information] ([emp_id], [SSN], [Salary], [IsManager], [DOB], [Office]) VALUES (N'Y-L77953M', N'976582310', CAST(0 AS Decimal(18, 0)), 0, CAST(N'1968-06-13' AS Date), N'Brisbane')
GO

--Set relationship using Database diagram
--https://docs.microsoft.com/en-us/sql/ssms/visual-db-tools/create-relationships-between-tables-on-a-diagram-visual-database-tools?view=sql-server-ver15

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	  --[emp_id]
   --   ,[fname]
   --   ,[minit]
   --   ,[lname]
   --   ,[job_id]
   --   ,[job_lvl]
   --   ,[pub_id]
   --   ,[hire_date]
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY
	[Employee];	--Returns 43 rows (45 in training vid)

--Run 2 queries sinultaneously

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY
	[Employee];

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	--Required with OFFSET-FETCH
	[Employee]
  OFFSET 0 ROWS				--Start at the top
  FETCH NEXT 5 ROWS ONLY;	--get next 5 rows

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	--Required with OFFSET-FETCH
	[Employee]
  OFFSET 0 ROWS				--Start at the top
  FETCH NEXT 25 ROWS ONLY;	--25 records per 'page'

  --When the Next button is clicked, get the next 25, starting a row 26
  SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	--Required with OFFSET-FETCH
	[Employee]
  OFFSET 25 ROWS				--Start at record 26
  FETCH NEXT 25 ROWS ONLY;	--25 records per 'page': 18 rows returned