# Write your MySQL query statement below
SELECT user_id, (confirmations/attempts) AS confirmation_rate
FROM (
SELECT S.user_id AS user_id, C.time_stamp, action, SUM(CASE WHEN action='confirmed' THEN 1 ELSE 0 END) AS confirmations, COUNT(*) AS attempts
FROM Signups AS S
LEFT JOIN Confirmations AS C
ON S.user_id=C.user_id
GROUP BY S.user_id
) AS temp_1