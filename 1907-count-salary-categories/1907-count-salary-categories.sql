SELECT 'Low Salary' AS category, COUNT(CASE WHEN income<20000 THEN 1 END) AS accounts_count
FROM accounts
UNION ALL
SELECT 'Average Salary', COUNT(CASE WHEN income>=20000 AND income<=50000 THEN 1 END)
FROM accounts
UNION ALL
SELECT 'High Salary', COUNT(CASE WHEN income>50000 THEN 1 END)
FROM accounts-- Write your PostgreSQL query statement below
