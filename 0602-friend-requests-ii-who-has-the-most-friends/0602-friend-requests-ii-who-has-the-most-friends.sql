# Write your MySQL query statement below
WITH temp1 AS (SELECT requester_id AS id, COUNT(requester_id) as num
FROM RequestAccepted
GROUP BY requester_id),

temp2 AS (SELECT accepter_id AS id, COUNT(accepter_id) AS num
FROM RequestAccepted
GROUP BY accepter_id)

SELECT requester_id AS id, COUNT(requester_id) as num
FROM RequestAccepted
GROUP BY requester_id