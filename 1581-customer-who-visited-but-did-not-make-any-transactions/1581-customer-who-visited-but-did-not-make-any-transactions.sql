# Write your MySQL query statement below
SELECT V.customer_id
FROM Visits AS V
INNER JOIN Transaction AS T
ON V.visit_id=T.visit_id
