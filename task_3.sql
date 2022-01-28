SELECT AVG (compensation_to) as mean_compensation_to,
       AVG (compensation_from) as mean_compensation_from,
       AVG((compensation_to + compensation_from)/2) as mean_sum
FROM vacancy
GROUP BY area_id;