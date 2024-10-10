# Write your MySQL query statement below
SELECT product_id, COALESCE(ROUND((SUM(price*units)/SUM(units)), 2), 0) AS average_price
FROM (SELECT P.product_id, P.start_date, P.end_date, P.price, U.purchase_date, U.units
FROM Prices AS P
LEFT JOIN UnitsSold AS U
ON P.product_id=U.product_id
WHERE (U.purchase_date<=P.end_date AND U.purchase_date>=P.start_date) OR (U.purchase_date IS NULL)) AS sales
GROUP BY product_id
