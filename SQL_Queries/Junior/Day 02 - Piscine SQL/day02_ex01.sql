WITH days AS (
    SELECT generate_series('2022-01-01', '2022-01-10', '1 day'::interval)::date AS day
)
SELECT d.day AS missing_date
FROM days d
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
) pv ON d.day = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY d.day;
