-- Insert statements for PostgreSQL database
-- Generated on 2025-05-16, respecting all schema constraints

-- User Table
INSERT INTO "User" (user_id, name, gender, email, password, DOB, created_at, Total_Points) VALUES
(6, 'Emma Wilson', 'Female', 'emma.wilson@example.com', 'pass7890', '1990-04-12', 1617235200, 600),
(7, 'Michael Lee', 'Male', 'michael.lee@example.com', 'pass1234', '1988-08-25', 1625097600, 400),
(8, 'Sarah Kim', 'Female', 'sarah.kim@example.com', 'pass5678', '1997-01-30', 1632960000, 250),
(9, 'David Chen', 'Male', 'david.chen@example.com', 'pass9012', '1983-06-15', 1640822400, 800),
(10, 'Lisa Taylor', 'Female', 'lisa.taylor@example.com', 'pass3456', '1992-11-20', 1648684800, 150);

-- Challenge Table
INSERT INTO Challenge (c_id, name, description, Points_Target) VALUES
(4, 'Hydration Challenge', 'Drink 2L of water daily for 30 days', 600),
(5, 'Strength Challenge', 'Increase bench press weight by 10kg', 900),
(6, 'Flexibility Challenge', 'Complete daily yoga for 1 month', 400);

-- Goal Table
INSERT INTO Goal (g_id, start_date, end_date, Point_Value, user_id) VALUES
(4, '2025-05-18', '2025-06-18', 250, 6),
(5, '2025-05-20', '2025-07-20', 400, 7),
(6, '2025-06-01', '2025-08-01', 300, 8);

-- Diet_Plan Table
INSERT INTO Diet_Plan (plan_id, daily_protein, daily_fats, daily_carbs, daily_cal, user_id) VALUES
(4, 130, 45, 190, 1900, 6),
(5, 160, 55, 220, 2200, 7),
(6, 110, 35, 170, 1700, 8);

-- Exercise Table
INSERT INTO Exercise (e_id, video_url, Description, sets, reps_per_set, duration) VALUES
(4, 'http://example.com/deadlifts.mp4', 'Deadlifts', 3, 8, 2.5),
(5, 'http://example.com/plank.mp4', 'Plank', 3, 12, 1.5),
(6, 'http://example.com/pullups.mp4', 'Pull-ups', 4, 10, 2.0);

-- Log Table
INSERT INTO Log (log_id, logged_at, user_id) VALUES
(7, '2025-05-15 08:00:00', 6),
(8, '2025-05-16 10:30:00', 6),
(9, '2025-05-16 14:00:00', 7),
(10, '2025-05-15 16:00:00', 7),
(11, '2025-05-16 09:00:00', 8),
(12, '2025-05-16 11:00:00', 8);

-- Food_Log Table
INSERT INTO Food_Log (log_id) VALUES
(7),
(11);

-- Drink_Log Table
INSERT INTO Drink_Log (log_id, Calories, Category, Hydration_Level, amount) VALUES
(8, 0, 'WATER', 100, 750),
(12, 120, 'JUICE', 80, 250);

-- Food Table
INSERT INTO Food (f_id, name, calories, protein, fats, carbohydrates) VALUES
(4, 'Salmon', 206, 22, 13, 0),
(5, 'Quinoa', 222, 8, 4, 39),
(6, 'Banana', 90, 1, 0, 23);

-- Inbody_Log Table
INSERT INTO Inbody_Log (log_id, Muscle_Mass, Weight, Fat_Mass, Water_Percentage, height) VALUES
(9, 38, 65, 17, 45, 170);

-- Biometric_Log Table
INSERT INTO Biometric_Log (log_id, Heart_Rate, Blood_Pressure_upper) VALUES
(10, 65, 115);

-- joins Table
INSERT INTO joins (user_id, c_id, Progress) VALUES
(6, 4, 30),
(7, 5, 40),
(8, 6, 10);

-- Includes Table
INSERT INTO Includes (c_id, g_id) VALUES
(4, 4),
(5, 5),
(6, 6);

-- Does Table
INSERT INTO Does (user_id, e_id) VALUES
(6, 4),
(7, 5),
(8, 6);

-- Practiced_In Table
INSERT INTO Practiced_In (e_id, g_id) VALUES
(4, 4),
(5, 5),
(6, 6);

-- Holds Table
INSERT INTO Holds (log_id, f_id, quantity) VALUES
(7, 4, 1),
(7, 5, 1),
(11, 6, 2);

-- Friends Table
INSERT INTO Friends (User_Id, Friend_Id, "Status") VALUES
(6, 7, 'Accepted'),
(7, 6, 'Accepted'),
(8, 9, 'Pending'),
(9, 8, 'Pending'),
(6, 10, 'Rejected');

-- Exercise_Muscle_Group Table
INSERT INTO Exercise_Muscle_Group (Muscle_Group, Description, e_id) VALUES
('Back', 'Lats, traps, lower back', 4),
('Core', 'Abdominals, obliques', 5),
('Back', 'Lats, biceps', 6);