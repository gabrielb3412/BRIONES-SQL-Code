--P4 Final Implenentation

--1. UPDATE
UPDATE Goal JOIN Person USING(person_id)
SET description = 'Do 60 pushups without breaking'
WHERE name = 'Avarie Hart';

--2. DELETE
--Find his person_id:
SELECT person_id, name FROM Person WHERE name = “Isaiah Arroyo”;

--DELETE all workouts connected to Isaiah
DELETE FROM WORKOUT WHERE person_id = SELECT person_id, name FROM Person WHERE name = “Isaiah Arroyo”;

--DELETE all goals connected to Isaiah:
DELETE FROM Goal WHERE person_id = SELECT person_id, name FROM Person WHERE name = “Isaiah Arroyo”;

--DELETE Isaiah FROM Person Table
DELETE FROM Person WHERE name = 'Isaiah Arroyo';

--3. JOIN
SELECT name, sets, reps, rest_time_sec FROM Person JOIN Workout USING(person_id) ORDER BY person_id;

--4. LEFT JOIN
--Adding someone to show they will show up even without a goal
INSERT INTO Person (person_id, name, age, gender, weight_lb)
VALUES (6, 'Nova Winters', 29, 'Female', 150);

SELECT p.name AS person_name, g.description AS goal
FROM Person p
LEFT JOIN Goal g ON p.person_id = g.person_id
ORDER BY p.name;

--5. Agregate Funciton w/ GROUP BY
SELECT p.person_id,p.name, COUNT(DISTINCT g.goal_id) AS goal_count, COUNT(DISTINCT w.workout_id) AS workout_count
FROM Person p
LEFT JOIN Goal g ON p.person_id = g.person_id
LEFT JOIN Workout w ON p.person_id = w.person_id
GROUP BY p.person_id, p.name
ORDER BY workout_count DESC, goal_count DESC;

--6. Subquery
SELECT DISTINCT e.exercise_id, e.name AS exercise_name
FROM Exercise e
WHERE e.exercise_id IN (
  SELECT we.exercise_id
  FROM Workout_Exercise we
  WHERE we.duration >= 60
)
ORDER BY e.exercise_id;

--7 Correlated Subquery
SELECT 
    p.name,
    ROUND((
        SELECT AVG(we.duration)
        FROM Workout_Exercise we
        JOIN Workout w ON we.workout_id = w.workout_id
        WHERE w.person_id = p.person_id
    ), 2) AS avg_person_duration,
    
    ROUND((
        SELECT AVG(we.duration)
        FROM Workout_Exercise we
        JOIN Workout w ON we.workout_id = w.workout_id
    ), 2) AS overall_avg_duration

FROM Person p
WHERE (
    SELECT AVG(we.duration)
    FROM Workout_Exercise we
    JOIN Workout w ON we.workout_id = w.workout_id
    WHERE w.person_id = p.person_id
) > (
    SELECT AVG(we.duration)
    FROM Workout_Exercise we
    JOIN Workout w ON we.workout_id = w.workout_id
);

--8. View a
CREATE VIEW Person_Workout_Progress AS
SELECT 
    p.name AS person_name,
    COUNT(DISTINCT we.session_date) AS total_sessions,
    SUM(we.duration) AS total_minutes,
    MIN(g.target_date - CURRENT_DATE) AS days_until_next_goal
FROM Person p
JOIN Workout w ON p.person_id = w.person_id
JOIN Workout_Exercise we ON w.workout_id = we.workout_id
LEFT JOIN Goal g ON p.person_id = g.person_id
GROUP BY p.name;

SELECT * FROM Person_Workout_Progress;

--9. Built-in Function
SELECT p.name,
    -- Calculate smallest number of days until their soonest goal
    DATEDIFF(MIN(g.target_date), CURDATE()) AS days_to_goal,
    -- Assign status label
    CASE 
        WHEN DATEDIFF(MIN(g.target_date), CURDATE()) <= 10 THEN 'Urgent'
        WHEN DATEDIFF(MIN(g.target_date), CURDATE()) <= 30 THEN 'On Track'
        ELSE 'Ahead of Schedule'
    END AS status_label
FROM Person p
JOIN Goal g ON p.person_id = g.person_id
GROUP BY p.person_id;

--10. Relational Operators
-- Step 1: People who have done Chest exercises
-- People who did Chest exercises
SELECT DISTINCT p.person_id, p.name
FROM Person p
JOIN Workout w ON p.person_id = w.person_id
JOIN Workout_Exercise we ON w.workout_id = we.workout_id
JOIN Exercise e ON we.exercise_id = e.exercise_id
WHERE e.type = 'Chest'

INTERSECT

-- People who did Back exercises
SELECT DISTINCT p.person_id, p.name
FROM Person p
JOIN Workout w ON p.person_id = w.person_id
JOIN Workout_Exercise we ON w.workout_id = we.workout_id
JOIN Exercise e ON we.exercise_id = e.exercise_id
WHERE e.type = 'Back';



