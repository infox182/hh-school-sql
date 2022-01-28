SELECT month, count
FROM (
    SELECT EXTRACT(MONTH FROM public_date) as month, COUNT(*) as count
    FROM vacancy
    GROUP BY month
    ORDER BY count DESC
    LIMIT 1
    ) as first
UNION
SELECT month, count
FROM(
    SELECT EXTRACT(MONTH FROM public_date) as month, COUNT(*) as count
    FROM cv
    GROUP BY month
    ORDER BY count DESC
    LIMIT 1
    ) as second;
