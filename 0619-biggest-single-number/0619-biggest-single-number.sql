# Write your MySQL query statement below
SELECT
CASE WHEN count=1 THEN num
     ELSE null END AS num
FROM (SELECT num, COUNT(*) AS count
      FROM mynumbers
      GROUP BY num
      ORDER BY count, num DESC
      LIMIT 1)temp1