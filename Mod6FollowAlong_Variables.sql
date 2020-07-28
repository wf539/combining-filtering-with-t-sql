USE [pubs];
GO

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	
	[Employee]
  OFFSET 0 ROWS	
  FETCH NEXT 5 ROWS ONLY;

--DECLARE @variableName dataType

DECLARE @offset TINYINT
DECLARE @fetch TINYINT

--SET @variableName to VALUE

SET @offset = 0
SET @fetch = 5

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	
	[Employee]
  OFFSET @offset ROWS	
  FETCH NEXT @fetch ROWS ONLY;

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	
	[Employee]
  OFFSET 0 ROWS	
  FETCH NEXT 10 ROWS ONLY;

USE [pubs];
GO
--Stored proc
CREATE PROCEDURE populate_table
	@offset TINYINT,
	@fetch TINYINT

AS

SELECT 
	CONCAT_WS(N' ', fname, lname) AS [Employee],
	J.[job_desc] AS [Position],
	HR.[Office] AS [Office],
	DATEDIFF(yyyy, HR.[DOB], GETDATE()) AS [Age]
  FROM [pubs].[dbo].[employee] AS E
  JOIN [dbo].[jobs] AS J ON E.[job_id] = J.[job_id]
  JOIN [dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id]
  ORDER BY	
	[Employee]
  OFFSET @offset ROWS	
  FETCH NEXT @fetch ROWS ONLY;

--
EXEC populate_table 0, 10;