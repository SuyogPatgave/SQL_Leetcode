# Write your MySQL query statement below
WITH temp1 AS (SELECT requester_id AS id, COUNT(requester_id) as num
FROM RequestAccepted
GROUP BY requester_id
ORDER BY num DESC),

temp2 AS (SELECT accepter_id AS id, COUNT(accepter_id) AS num
FROM RequestAccepted
GROUP BY accepter_id
ORDER BY num DESC)

SELECT id, SUM(num) AS num 
FROM (SELECT * FROM temp1
      UNION ALL
      SELECT * FROM temp2)merge1
GROUP BY id
ORDER BY num DESC
LIMIT 1