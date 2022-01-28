SELECT vacancy.id, vacancy.title
FROM vacancy
JOIN reply  ON vacancy.id = reply.vacancy_id
WHERE EXTRACT (DAY FROM (reply.public_date - vacancy.public_date)) <= 7
GROUP BY vacancy.id, vacancy.title
HAVING count(*) > 5;