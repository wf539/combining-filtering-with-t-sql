SELECT
	TRIM(NE.[LastName]),
	TRIM(NE.[FirstName]),
	FORMAT(CAST(HR.[SSN] AS INT), '###-##-####')
FROM [Employees] AS NE
JOIN [pubs].[dbo].[HR_Information] AS HR ON NE.[EmployeeID] = HR.[emp_id]
UNION
SELECT
	TRIM(lname),
	TRIM(fname),
	FORMAT(CAST(HR.[SSN] AS INT), '###-##-####')
FROM [pubs].[dbo].[employee] AS E
JOIN [pubs].[dbo].[HR_Information] AS HR ON E.[emp_id] = HR.[emp_id];