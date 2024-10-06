# Write your MySQL query statement below
SELECT id, CONCAT(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, '0')) AS month, country, COUNT(id) AS trans_count, SUM(CASE WHEN state='approved' THEN 1 ELSE 0) AS approved_count, SUM(amount) AS trans_total_amount, SUM(CASE WHEN state='approved' THEN amount ELSE 0) AS approved_total_amount
FROM Transactions
GROUP BY YEAR(trans_date), MONTH(trans_date), country