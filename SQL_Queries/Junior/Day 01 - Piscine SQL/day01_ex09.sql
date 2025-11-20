-- First query using IN
SELECT name
FROM pizzeria
WHERE id NOT IN (
    SELECT pizzeria_id
    FROM person_visits
    WHERE pizzeria_id IS NOT NULL
);

-- Second query using EXISTS
SELECT name
FROM pizzeria pz
WHERE NOT EXISTS (
    SELECT 1
    FROM person_visits pv
    WHERE pv.pizzeria_id = pz.id
);
