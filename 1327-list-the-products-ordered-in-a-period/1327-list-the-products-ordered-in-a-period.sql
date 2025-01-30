# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM (SELECT P.product_id, P.product_name, P.product_category, O.order_date, O.unit
FROM products AS P
LEFT JOIN orders AS O
ON P.product_id=O.product_id
WHERE EXTRACT(YEAR FROM order_date)=2020 AND EXTRACT(MONTH FROM order_date)=2)temp1
GROUP BY product_name
HAVING SUM(unit)>=100