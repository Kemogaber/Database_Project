SELECT u.name, u.email, u.Total_Points
FROM "User" as u
ORDER BY Total_Points DESC
Limit 1 ;                       -- getting the user with the most total points 

 -- by this information , we might provide a gift for the user with the most points 
 

SELECT u.name, COUNT(l.log_id) AS log_count
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
GROUP BY u.name
ORDER BY log_count DESC
LIMIT 5; -- getting the 5 most users who logged in

SELECT u.gender, AVG(dp.daily_protein) AS avg_protein
FROM "User" u
JOIN Diet_Plan dp ON u.user_id = dp.user_id
GROUP BY u.gender; -- getting the average protein for each gender 

SELECT name
FROM "User"
WHERE user_id NOT IN (
  SELECT user_id FROM Log
);
 -- getting the user who never logged in 

SELECT DISTINCT u.name, d.Category
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
JOIN Drink_Log d ON d.log_id = l.log_id
WHERE d.Category = 'SODA'; 

-- getting the user who have taken soda drinks ( telling him or her about its alter drawbacks )


SELECT u.name, dp.daily_cal
FROM "User" u
JOIN Diet_Plan dp ON u.user_id = dp.user_id
ORDER BY dp.daily_cal 
LIMIT 2;  -- getting 2 users with the least daily calories 
 
SELECT u.name, AVG(d.Hydration_Level) AS avg_hydration
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
JOIN Drink_Log d ON d.log_id = l.log_id
WHERE d.Category = 'WATER'
GROUP BY u.name
ORDER BY avg_hydration DESC; -- getting users who drink most water ( high level of hydration ) 
                             
SELECT 
    name, 
    description, 
    Points_Target
FROM 
    Challenge
WHERE 
    Points_Target > 500;  -- getting the challenges that are more than 500 points 


SELECT u.name, d.daily_cal
FROM Diet_Plan d
JOIN "User" u ON d.user_id = u.user_id
WHERE d.daily_cal > 2000; -- getting users with calorie intake of more than 2000 calories 

SELECT Category, AVG(Calories) AS avg_calories
FROM Drink_Log
GROUP BY Category; -- getting average calories of Drinks categories

SELECT u.name, AVG(d.daily_protein) AS avg_protein, AVG(d.daily_fats) AS avg_fats, AVG(d.daily_carbs) AS avg_carbs
FROM "User" u
JOIN Diet_Plan d ON u.user_id = d.user_id
GROUP BY u.name
ORDER BY avg_protein DESC; -- getting average fats , protein , carbs for all users 
