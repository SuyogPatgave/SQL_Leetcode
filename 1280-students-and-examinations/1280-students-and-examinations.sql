SELECT S.student_id, S.student_name, B.subject_name, COUNT(E.student_id) AS attended_exams
FROM Students AS S
CROSS JOIN Subjects AS B
LEFT JOIN Examinations AS E
ON S.student_id=E.student_id AND B.subject_name=E.subject_name
GROUP BY E.student_id, S.student_name, B.subject_name
ORDER BY S.student_id, attended_exams DESC