CREATE DOMAIN Points AS INTEGER CHECK (VALUE >= 0);
CREATE DOMAIN UINT AS INTEGER CHECK (VALUE >= 0);


CREATE TABLE User
(
    created_at INT NOT NULL,
    DOB DATE NOT NULL,
    name Varchar(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    email Varchar(50) NOT NULL,
    password Varchar(50) NOT NULL,
    user_id INT NOT NULL,
    Total_Points Points NOT NULL,
    PRIMARY KEY (user_id),
    CONSTRAINT email_unique UNIQUE (email),
    CONSTRAINT chk_dob CHECK (DOB >= '1900-01-01' AND DOB <= CURRENT_DATE),
);

CREATE TABLE Challenge (
    c_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    Points_Target Points NOT NULL,
    PRIMARY KEY (c_id)
);

CREATE TABLE Goal (
    g_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    Point_Value Points NOT NULL,
    user_id INT,
    PRIMARY KEY (g_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_start_date CHECK (start_date >= CURRENT_DATE),
    CONSTRAINT chk_date_range CHECK (end_date > start_date)
);

CREATE TABLE Diet_Plan (
    daily_protein UINT NOT NULL,
    plan_id INT NOT NULL,
    daily_fats UINT NOT NULL,
    daily_carbs UINT NOT NULL,
    daily_cal UINT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (plan_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Exercise (
  e_id INT NOT NULL,
  video_url VARCHAR(255) NOT NULL,
  Description TEXT NOT NULL,
  sets UINT NOT NULL,
  reps_per_set INT NOT NULL (reps_per_set > 5 AND reps_per_set < 20),
  duration FLOAT NOT NULL (duration > 0),
  PRIMARY KEY (e_id)
);

CREATE TABLE Log (
  log_id INT NOT NULL,
  logged_at DATETIME NOT NULL,
  user_id INT,
  PRIMARY KEY (log_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Food_Log (
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Drink_Log (
  Calories UINT,
  Category ENUM('WATER', 'JUICE', 'SODA') NOT NULL,
  Hydration_Level UINT NOT NULL,
  amount UINT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE Food (
  calories UINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  protein UINT NOT NULL,
  fats UINT NOT NULL,
  carbohydrates UINT NOT NULL,
  f_id INT NOT NULL,
  PRIMARY KEY (f_id)
);

CREATE TABLE Inbody_Log (
  Muscle_Mass UINT NOT NULL,
  Weight UINT NOT NULL,
  Fat_Mass UINT NOT NULL,
  Water_Percentage UINT NOT NULL,
  height UINT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT chk_totality CHECK (Muscle_Mass + Fat_Mass + Water_Percentage = 100),
);

CREATE TABLE Biometric_Log (
  Heart_Rate UINT NOT NULL CHECK ( Heart_Rate > 20 AND Heart_Rate < 200 ),
  Blood_Pressure_upper UINT NOT NULL,
  log_id INT NOT NULL,
  PRIMARY KEY (log_id),
  FOREIGN KEY (log_id) REFERENCES Log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE joins (
  Progress INT NOT NULL,
  user_id INT NOT NULL,
  c_id INT,
  PRIMARY KEY (user_id, c_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id) ON DELETE SET NULL ON UPDATE CASCADE,
);

CREATE TABLE Includes (
  c_id INT NOT NULL,
  g_id INT NOT NULL,
  PRIMARY KEY (c_id, g_id),
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (g_id) REFERENCES Goal(g_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Does (
  user_id INT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (user_id, e_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Practiced_In (
  e_id INT NOT NULL,
  g_id INT NOT NULL,
  PRIMARY KEY (e_id, g_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (g_id) REFERENCES Goal(g_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Holds (
  quantity UINT NOT NULL,
  log_id INT NOT NULL,
  f_id INT NOT NULL,
  PRIMARY KEY (log_id, f_id),
  FOREIGN KEY (log_id) REFERENCES Food_Log(log_id) ON DELETE CASCADE ON UPDATE CASCADE ,
  FOREIGN KEY (f_id) REFERENCES Food(f_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Friends (
 Status ENUM('Pending', 'Accepted', 'Rejected', 'Blocked') NOT NULL,
  User_Id INT NOT NULL,
  Friend_Id INT NOT NULL,
  PRIMARY KEY (User_Id, Friend_Id),
  FOREIGN KEY (User_Id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Friend_Id) REFERENCES User(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Exercise_Muscle_Group (
  Muscle_Group VARCHAR(50) NOT NULL,
  Description TEXT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (Muscle_Group, e_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id) ON DELETE CASCADE ON UPDATE CASCADE
);