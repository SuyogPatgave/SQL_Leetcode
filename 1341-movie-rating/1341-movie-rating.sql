# Write your MySQL query statement below
WITH table1 AS (SELECT DISTINCT(U.name) AS name, COUNT(R.rating) As movies_rated
      FROM movierating AS R
      LEFT JOIN users AS U
      ON R.user_id=U.user_id
      GROUP BY U.name
      ORDER BY movies_rated DESC, name ASC
      LIMIT 1),

table2 AS (SELECT M.title, AVG(R.rating) AS avg_rating
                FROM movierating AS R
                LEFT JOIN movies AS M
                ON R.movie_id=M.movie_id
                WHERE MONTH(R.created_at)=2 AND YEAR(R.created_at)=2020
                GROUP BY M.title
                ORDER BY avg_rating DESC, title ASC
                LIMIT 1)


SELECT name AS results FROM table1
UNION ALL
SELECT title FROM table2