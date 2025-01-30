# Write your MySQL query statement below
WITH temp1 AS (SELECT employee_id, department_id
               FROM employee
               WHERE primary_flag="Y"),

temp2 AS (SELECT employee_id, department_id
FROM employee
GROUP BY employee_id
HAVING COUNT(department_id)=1)

SELECT employee_id, department_id FROM temp1
UNION ALL
SELECT employee_id, department_id FROM temp2

