# Write your MySQL query statement below
SELECT COALESCE(new_id, id) AS id, student
FROM
(SELECT *,
CASE WHEN id%2=0 THEN lag(id, 1) OVER (ORDER BY id)
ELSE lead(id, 1) OVER (ORDER BY id) END AS new_id
FROM seat)temp1
ORDER BY id ASC