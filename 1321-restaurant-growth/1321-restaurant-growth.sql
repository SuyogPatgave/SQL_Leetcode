# Write your MySQL query statement below
WITH temp2 AS (SELECT visited_on, SUM(amount)OVER(ORDER BY visited_on DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS amount,
ROUND(AVG(amount) OVER(ORDER BY visited_on DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING),2) AS average_amount
FROM (SELECT visited_on, SUM(amount) AS amount
              FROM customer
              GROUP BY visited_on) temp1)

SELECT *
FROM temp2
HAVING (DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM temp2)))>=6
ORDER BY visited_on