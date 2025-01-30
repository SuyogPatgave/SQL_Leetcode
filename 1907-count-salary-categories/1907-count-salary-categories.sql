SELECT 'Low Salary' AS category, COUNT(IF(income<20000, 1, null)) AS accounts_count
FROM accounts
UNION ALL
SELECT 'Average Salary', COUNT(IF(income>=20000 AND income<=50000, 1, null))
FROM accounts
UNION ALL
SELECT 'High Salary', COUNT(IF(income>50000, 1, null))
FROM accounts