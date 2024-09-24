# Write your MySQL query statement below
SELECT V.customer_id, COUNT(V.customer_id) AS count_no_trans
FROM Visits AS V
LEFT JOIN Transactions AS T
ON V.visit_id=T.visit_id
WHERE V.visit_id NOT IN (SELECT DISTINCT(V.visit_id)
                        FROM Visits AS V
                        INNER JOIN Transactions AS T
                        ON V.visit_id=T.visit_id)
GROUP BY V.customer_id
ORDER BY count_no_trans