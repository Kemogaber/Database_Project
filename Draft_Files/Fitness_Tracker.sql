CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  created_at DATETIME NOT NULL,
  DOB DATE NOT NULL,
  name VARCHAR(255) NOT NULL,
  gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  height INT NOT NULL CHECK (height > 0),
  weight INT NOT NULL CHECK (weight > 0),
  bmi FLOAT NOT NULL CHECK (bmi > 0),
  Muscle_Mass FLOAT NOT NULL CHECK (Muscle_Mass >= 0),
  Fat_Mass FLOAT NOT NULL CHECK (Fat_Mass >= 0),
  Water_Percentage FLOAT NOT NULL CHECK (Water_Percentage BETWEEN 0 AND 100),
  heart_rate INT NOT NULL CHECK (heart_rate > 0),
  blood_pressure VARCHAR(20) NOT NULL
);

CREATE TABLE Challenge (
  c_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  target_value FLOAT NOT NULL CHECK (target_value > 0),
  CHECK (end_date > start_date)
);

CREATE TABLE Goal (
  g_id INT PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  c_id INT,
  user_id INT NOT NULL,
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CHECK (end_date > start_date)
);

CREATE TABLE Diet_Plan (
  plan_id INT PRIMARY KEY,
  daily_protein FLOAT NOT NULL CHECK (daily_protein >= 0),
  daily_fats FLOAT NOT NULL CHECK (daily_fats >= 0),
  daily_carbs FLOAT NOT NULL CHECK (daily_carbs >= 0),
  daily_cal FLOAT NOT NULL CHECK (daily_cal > 0),
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Exercise (
  e_id INT PRIMARY KEY,
  duration INT NOT NULL CHECK (duration > 0), -- in minutes or seconds
  video_url VARCHAR(500),
  category VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE Log (
  log_id INT PRIMARY KEY,
  logged_at DATETIME NOT NULL,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Food_Log (
  log_id INT PRIMARY KEY,
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Drink_Log (
  log_id INT PRIMARY KEY,
  Drink_Type VARCHAR(100) NOT NULL,
  amount FLOAT NOT NULL CHECK (amount > 0),
  FOREIGN KEY (log_id) REFERENCES Log(log_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Food (
  f_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  calories FLOAT NOT NULL CHECK (calories >= 0),
  protein FLOAT NOT NULL CHECK (protein >= 0),
  fats FLOAT NOT NULL CHECK (fats >= 0),
  carbohydrates FLOAT NOT NULL CHECK (carbohydrates >= 0)
);

CREATE TABLE enters (
  user_id INT,
  c_id INT,
  PRIMARY KEY (user_id, c_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (c_id) REFERENCES Challenge(c_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Does (
  user_id INT,
  e_id INT,
  PRIMARY KEY (user_id, e_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Contains (
  e_id INT,
  g_id INT,
  PRIMARY KEY (e_id, g_id),
  FOREIGN KEY (e_id) REFERENCES Exercise(e_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (g_id) REFERENCES Goal(g_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Holds (
  log_id INT,
  f_id INT,
  PRIMARY KEY (log_id, f_id),
  FOREIGN KEY (log_id) REFERENCES Food_Log(log_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (f_id) REFERENCES Food(f_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);
