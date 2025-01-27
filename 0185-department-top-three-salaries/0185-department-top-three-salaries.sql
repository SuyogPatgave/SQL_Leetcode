-- Write your PostgreSQL query statement below
WITH temp1 AS 
(SELECT D.name AS Department, E.name AS Employee, E.salary AS salary,
DENSE_RANK() OVER (PARTITION BY D.name ORDER BY E.salary DESC) AS rank
FROM Employee AS E
LEFT JOIN Department AS D
ON E.departmentId=D.id)

SELECT Department, Employee, Salary
FROM temp1
WHERE rank<=3