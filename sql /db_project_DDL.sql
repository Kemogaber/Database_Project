Create database db_project;

use db_project;

CREATE TABLE User
(
  created_at INT NOT NULL,
  DOB INT NOT NULL,
  name Varchar(50) NOT NULL,
  gender ENUM('Male', 'Female') NOT NULL,
  email Varchar(50) NOT NULL,
  password Varchar(50) NOT NULL,
  user_id INT NOT NULL,
  Total_Points INT NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE Challenge (
  c_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  Points_Target INT NOT NULL,
  PRIMARY KEY (c_id)
);

CREATE TABLE Goal (
  g_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  Point_Value INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (g_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Diet_Plan (
  daily_protein INT NOT NULL,
  plan_id INT NOT NULL,
  daily_fats INT NOT NULL,
  daily_carbs INT NOT NULL,
  daily_cal INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (plan_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Exercise (
  e_id INT NOT NULL,
  video_url VARCHAR(255) NOT NULL,
  Description TEXT NOT NULL,
  sets INT NOT NULL,
  reps_per_set INT NOT NULL,
  duration INT NOT NULL,
  PRIMARY KEY (e_id)
);

CREATE TABLE Log (
  log_id INT NOT NULL,
  logged_at DATETIME NOT NULL,
  user_id INT,
  PRIMARY KEY (log_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Food_Log (
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
);

CREATE TABLE Drink_Log (
  Calories INT NOT NULL,
  Category VARCHAR(50) NOT NULL,
  Hydration_Level INT NOT NULL,
  amount INT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
);

CREATE TABLE Food (
  calories INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  protein INT NOT NULL,
  fats INT NOT NULL,
  carbohydrates INT NOT NULL,
  f_id INT NOT NULL,
  PRIMARY KEY (f_id)
);

CREATE TABLE Inbody_Log (
  Muscle_Mass INT NOT NULL,
  Weight INT NOT NULL,
  Fat_Mass INT NOT NULL,
  Water_Percentage INT NOT NULL,
  height INT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
);

CREATE TABLE Biometric_Log (
  Heart_Rate INT NOT NULL,
  Blood_Pressure INT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
);

CREATE TABLE joins (
  Progress INT NOT NULL,
  user_id INT NOT NULL,
  c_id INT NOT NULL,
  PRIMARY KEY (user_id, c_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id)
);

CREATE TABLE Includes (
  c_id INT NOT NULL,
  g_id INT NOT NULL,
  PRIMARY KEY (c_id, g_id),
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id),
  FOREIGN KEY (g_id) REFERENCES Goal(g_id)
);

CREATE TABLE Does (
  user_id INT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (user_id, e_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id)
);

CREATE TABLE Practiced_In (
  e_id INT NOT NULL,
  g_id INT NOT NULL,
  PRIMARY KEY (e_id, g_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id),
  FOREIGN KEY (g_id) REFERENCES Goal(g_id)
);

CREATE TABLE Holds (
  quantity INT NOT NULL,
  log_id INT NOT NULL,
  f_id INT NOT NULL,
  PRIMARY KEY (log_id, f_id),
  FOREIGN KEY (log_id) REFERENCES Food_Log(log_id),
  FOREIGN KEY (f_id) REFERENCES Food(f_id)
);

CREATE TABLE Friends (
 Status ENUM('Pending', 'Accepted', 'Rejected', 'Blocked') NOT NULL,
  User_Id INT NOT NULL,
  Friend_Id INT NOT NULL,
  PRIMARY KEY (User_Id, Friend_Id),
  FOREIGN KEY (User_Id) REFERENCES User(user_id),
  FOREIGN KEY (Friend_Id) REFERENCES User(user_id)
);

CREATE TABLE Exercise_Muscle_Group (
  Muscle_Group VARCHAR(50) NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (Muscle_Group, e_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id)
);

SHOW TABLES;
