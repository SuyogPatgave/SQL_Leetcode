# Write your MySQL query statement below
WITH temp1 AS(
SELECT class, COUNT(student) AS student_no
FROM courses
GROUP BY class
HAVING COUNT(student)>=5)

SELECT class FROM temp1