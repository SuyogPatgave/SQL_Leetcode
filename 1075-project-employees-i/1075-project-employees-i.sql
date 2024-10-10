SELECT P.project_id, ROUND((SUM(E.experience_years)/COUNT(*)), 2) AS average_years
FROM Project AS P
LEFT JOIN Employee AS E
ON P.employee_id=E.employee_id
GROUP BY P.project_id