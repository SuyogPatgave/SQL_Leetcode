# Write your MySQL query statement below
# Write your MySQL query statement below
WITH temp AS (SELECT id, recordDate, temperature, 
LAG(temperature) OVER (ORDER BY recordDate) AS previous_temperature,
LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date
FROM Weather)

SELECT id
FROM temp
WHERE temperature>previous_temperature AND
DATEDIFF (recordDate, previous_date)=1