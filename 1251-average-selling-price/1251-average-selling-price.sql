# Write your MySQL query statement below
WITH SalesData AS (
    SELECT 
        P.product_id, 
        P.price, 
        U.units
    FROM Prices AS P
    LEFT JOIN UnitsSold AS U
    ON P.product_id = U.product_id
    WHERE (U.purchase_date <= P.end_date AND U.purchase_date >= P.start_date) OR (U.purchase_date IS NULL)
)
SELECT 
    product_id, 
    COALESCE(ROUND(SUM(price * units) / NULLIF(SUM(units), 0), 2), 0) AS average_price
FROM SalesData
GROUP BY product_id;
