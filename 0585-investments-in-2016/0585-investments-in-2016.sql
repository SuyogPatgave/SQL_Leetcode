# Write your MySQL query statement below
WITH loc AS (SELECT lat, lon
FROM insurance
GROUP BY lat, lon
HAVING COUNT(*)=1)

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (SELECT SUM(I.tiv_2016) AS tiv_2016
      FROM insurance AS I
      INNER JOIN loc AS L
      ON I.lat=L.lat AND I.lon=L.lon
      WHERE tiv_2015 IN (SELECT tiv_2015
                         FROM insurance
                         GROUP BY tiv_2015
                         HAVING COUNT(tiv_2015)>1)
      GROUP BY tiv_2015) final