CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  dob DATE NOT NULL,
  name VARCHAR(255) NOT NULL,
  gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male', 'Female', 'Other')),
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  height INT NOT NULL CHECK (height > 0),
  weight INT NOT NULL CHECK (weight > 0),
  bmi FLOAT NOT NULL CHECK (bmi > 0),
  muscle_mass FLOAT NOT NULL CHECK (muscle_mass >= 0),
  fat_mass FLOAT NOT NULL CHECK (fat_mass >= 0),
  water_percentage FLOAT NOT NULL CHECK (water_percentage BETWEEN 0 AND 100),
  heart_rate INT NOT NULL CHECK (heart_rate > 0),
  blood_pressure VARCHAR(20) NOT NULL
);

CREATE TABLE challenge (
  c_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL CHECK (end_date > start_date),
  target_value FLOAT NOT NULL CHECK (target_value >= 0)
);

CREATE TABLE goal (
  g_id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL CHECK (end_date > start_date),
  c_id INT REFERENCES challenge(c_id) ON DELETE SET NULL ON UPDATE CASCADE,
  user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE diet_plan (
  plan_id SERIAL PRIMARY KEY,
  daily_protein FLOAT NOT NULL CHECK (daily_protein >= 0),
  daily_fats FLOAT NOT NULL CHECK (daily_fats >= 0),
  daily_carbs FLOAT NOT NULL CHECK (daily_carbs >= 0),
  daily_cal FLOAT NOT NULL CHECK (daily_cal >= 0),
  user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE exercise (
  e_id SERIAL PRIMARY KEY,
  duration INT NOT NULL CHECK (duration > 0),
  video_url VARCHAR(500),
  category VARCHAR(100) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE log (
  log_id SERIAL PRIMARY KEY,
  logged_at TIMESTAMP NOT NULL DEFAULT NOW(),
  user_id INT REFERENCES users(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE food_log (
  log_id INT PRIMARY KEY REFERENCES log(log_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE drink_log (
  log_id INT PRIMARY KEY REFERENCES log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
  drink_type VARCHAR(100) NOT NULL,
  amount FLOAT NOT NULL CHECK (amount >= 0)
);

CREATE TABLE food (
  f_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  calories FLOAT NOT NULL CHECK (calories >= 0),
  protein FLOAT NOT NULL CHECK (protein >= 0),
  fats FLOAT NOT NULL CHECK (fats >= 0),
  carbohydrates FLOAT NOT NULL CHECK (carbohydrates >= 0)
);

CREATE TABLE inbody_log (
  log_id INT PRIMARY KEY REFERENCES log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
  muscle_mass FLOAT NOT NULL CHECK (muscle_mass >= 0),
  weight FLOAT NOT NULL CHECK (weight > 0),
  fat_mass FLOAT NOT NULL CHECK (fat_mass >= 0),
  water_percentage FLOAT NOT NULL CHECK (water_percentage BETWEEN 0 AND 100),
  height INT NOT NULL CHECK (height > 0)
);

CREATE TABLE biometric_log (
  log_id INT PRIMARY KEY REFERENCES log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
  heart_rate INT NOT NULL CHECK (heart_rate > 0),
  blood_pressure VARCHAR(20) NOT NULL
);

CREATE TABLE joins (
  user_id INT NOT NULL,
  c_id INT NOT NULL,
  PRIMARY KEY (user_id, c_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (c_id) REFERENCES challenge(c_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE includes (
  c_id INT NOT NULL,
  g_id INT NOT NULL,
  PRIMARY KEY (c_id, g_id),
  FOREIGN KEY (c_id) REFERENCES challenge(c_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (g_id) REFERENCES goal(g_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE does (
  user_id INT NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (user_id, e_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (e_id) REFERENCES exercise(e_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE contains (
  e_id INT NOT NULL,
  g_id INT NOT NULL,
  target_value FLOAT NOT NULL CHECK (target_value >= 0),
  PRIMARY KEY (e_id, g_id),
  FOREIGN KEY (e_id) REFERENCES exercise(e_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (g_id) REFERENCES goal(g_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE holds (
  log_id INT NOT NULL,
  f_id INT NOT NULL,
  PRIMARY KEY (log_id, f_id),
  FOREIGN KEY (log_id) REFERENCES food_log(log_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (f_id) REFERENCES food(f_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE friends (
  status VARCHAR(50) NOT NULL CHECK (status IN ('pending', 'accepted', 'blocked')),
  user_id INT NOT NULL,
  friend_id INT NOT NULL,
  PRIMARY KEY (user_id, friend_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (friend_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE exercise_muscle_group (
  muscle_group VARCHAR(100) NOT NULL,
  e_id INT NOT NULL,
  PRIMARY KEY (muscle_group, e_id),
  FOREIGN KEY (e_id) REFERENCES exercise(e_id) ON DELETE CASCADE ON UPDATE CASCADE
);
