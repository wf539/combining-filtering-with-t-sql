/****** Script for SelectTopNRows command from SSMS  ******/
USE [pubs];
GO

SELECT [au_id]
      ,[au_lname]
      ,[au_fname]
      ,[phone]
      ,[address]
      ,[city]
      ,[state]
      ,[zip]
      ,[contract]
  FROM [pubs].[dbo].[authors];

  SELECT
	*
  FROM [pubs].[dbo].[authors]; --returns 23 rows

  SELECT TOP (5)
	*
  FROM [pubs].[dbo].[authors];

  
  --
  SELECT TOP (5)
	*
  FROM [pubs].[dbo].[authors]
  WHERE
	[state] = N'CA';	--different resultset, 5 rows

--
  SELECT TOP (5)
	*
  FROM [pubs].[dbo].[authors]
  WHERE
	[state] = N'CA'
	AND
	[au_id] LIKE N'4%'; --returns 4 rows

--
SELECT
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]; --returns 19 rows. TOP does not make sense here: not deterministic

--Rank Authors by title count
SELECT
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY
	COUNT(TA.[au_id]);

--Rank Authors by title count using alias
SELECT
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY
	[Number of books];

--Rank Authors largest first
SELECT
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY
	[Number of books] DESC;

--Insufficient without TIES param
SELECT TOP (6)
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY
	[Number of books] DESC;

--Insufficient without TIES param
SELECT TOP (6) WITH TIES
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY	--Required when using WITH TIES
	[Number of books] DESC;

--Example using PERCENT param
SELECT TOP (10) PERCENT
	COUNT(TA.[au_id]) AS [Number of books],
	TA.[au_id],
	CONCAT_WS(' ', A.[au_fname], A.[au_lname]) AS [Author]
FROM [dbo].[authors] AS A
JOIN [dbo].[titleauthor] AS TA ON A.[au_id] = TA.[au_id]
GROUP BY
	A.[au_fname],
	A.[au_lname],
	TA.[au_id]
ORDER BY	
	[Number of books] DESC;