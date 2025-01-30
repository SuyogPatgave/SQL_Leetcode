SELECT M.employee_id, M.name, COUNT(E.employee_id) AS reports_count, ROUND(AVG(E.age)) AS average_age
FROM employees AS E
JOIN employees AS M
ON E.reports_to=M.employee_id
GROUP BY M.employee_id, M.name
ORDER BY M.employee_id
