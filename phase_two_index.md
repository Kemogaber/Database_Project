# Database Project

# Important Reports

# Software (MySQL)

## Why MySQL?

## Reports

### R1
Select the user with the highest total points.
```
SELECT u.name, u.email, u.Total_Points
FROM "User" as u
ORDER BY Total_Points DESC
Limit 1 ;
```

Result:
```
    name    |         email          | total_points 
------------+------------------------+--------------
 David Chen | david.chen@example.com |          800
```

### R2

Select the 5 users with the most logs.

```
SELECT u.name, COUNT(l.log_id) AS log_count
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
GROUP BY u.name
ORDER BY log_count DESC
LIMIT 5;
```
Result:
```
    name     | log_count 
-------------+-----------
 Sarah Kim   |         2
 Michael Lee |         2
 Emma Wilson |         2
```

### R3

Getting the average protein intake for each gender.

```
SELECT u.gender, AVG(dp.daily_protein) AS avg_protein
FROM "User" u
JOIN Diet_Plan dp ON u.user_id = dp.user_id
GROUP BY u.gender;
```

Result:
```
 gender |     avg_protein      
--------+----------------------
 Male   | 160.0000000000000000
 Female | 120.0000000000000000
```

### R4

Select the users who have not logged any activity.

```
SELECT name
FROM "User"
WHERE user_id NOT IN (
  SELECT user_id FROM Log
);
```

Result:
```
    name     
-------------
 David Chen
 Lisa Taylor

```

### R5

Select the users who have logged soda drinks.

```
SELECT DISTINCT u.name, d.Category
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
JOIN Drink_Log d ON d.log_id = l.log_id
WHERE d.Category = 'SODA';
```

Result:
```
    name     | category 
-------------+----------
 Emma Wilson | SODA
 Michael Lee | SODA
```

### R6

Select the 2 users with the least daily calories.

```
SELECT u.name, dp.daily_cal
FROM "User" u
JOIN Diet_Plan dp ON u.user_id = dp.user_id
ORDER BY dp.daily_cal 
LIMIT 2;
```

Result:
```
    name     | daily_cal 
-------------+-----------
 Sarah Kim   |      1700
 Emma Wilson |      1900
```

### R7

Rank users by their hydration level.

```
SELECT u.name, AVG(d.Hydration_Level) AS avg_hydration
FROM "User" u
JOIN Log l ON u.user_id = l.user_id
JOIN Drink_Log d ON d.log_id = l.log_id
WHERE d.Category = 'WATER'
GROUP BY u.name
ORDER BY avg_hydration DESC;
```

Result:
```
    name     |    avg_hydration     
-------------+----------------------
 Emma Wilson | 100.0000000000000000
 David Chen  |  95.0000000000000000
 Michael Lee |  90.0000000000000000
 Sarah Kim   |  85.0000000000000000
 Lisa Taylor |  80.0000000000000000
```

### R8

Select challenges with a target of more than 500 points.

```
SELECT 
    name, 
    description, 
    Points_Target
FROM 
    Challenge
WHERE 
    Points_Target > 500;
```

Result: 
```
        name         |             description             | points_target 
---------------------+-------------------------------------+---------------
 Hydration Challenge | Drink 2L of water daily for 30 days |           600
 Strength Challenge  | Increase bench press weight by 10kg |           900
```

### R9
Select users with more than 2000 calories in their diet plan.

```
SELECT u.name, d.daily_cal
FROM Diet_Plan d
JOIN "User" u ON d.user_id = u.user_id
WHERE d.daily_cal > 2000;
```

Result: 

```
    name     | daily_cal 
-------------+-----------
 Michael Lee |      2200
```

### R10

Get average calories for each drink category.

```
SELECT Category, AVG(Calories) AS avg_calories
FROM Drink_Log
GROUP BY Category;
```

Result:
```
 category |      avg_calories      
----------+------------------------
 SODA     |    50.0000000000000000
 WATER    | 0.00000000000000000000
 JUICE    |   120.0000000000000000
```

### R11

Get the average daily protein, fats, and carbs for each user.

```
SELECT u.name, AVG(d.daily_protein) AS avg_protein, AVG(d.daily_fats) AS avg_fats, AVG(d.daily_carbs) AS avg_carbs
FROM "User" u
JOIN Diet_Plan d ON u.user_id = d.user_id
GROUP BY u.name
ORDER BY avg_protein DESC;
```

Result:
```
    name     |     avg_protein      |      avg_fats       |      avg_carbs       
-------------+----------------------+---------------------+----------------------
 Michael Lee | 160.0000000000000000 | 55.0000000000000000 | 220.0000000000000000
 Emma Wilson | 130.0000000000000000 | 45.0000000000000000 | 190.0000000000000000
 Sarah Kim   | 110.0000000000000000 | 35.0000000000000000 | 170.0000000000000000
```