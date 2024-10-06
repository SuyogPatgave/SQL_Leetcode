# Write your MySQL query statement below
SELECT S.user_id, COALESCE(ROUND(AVG(action='confirmed'), 2), 0) AS confirmation_rate
FROM Signups AS S
LEFT JOIN Confirmations AS C
ON S.user_id=C.user_id
GROUP BY S.user_id