# Database Project

# Domain
We chose a **Fitness Tracker** app as our domain, which allows users to track calorie, water and food intakes, as well as biometric data like heart rate, and so.
We also incorporated **Gamification** elements, such as points to motivate users to reach their goals.

# Domain Description (Functional Requirements)
- **User Management:** Register, authenticate, and manage user profiles with personal and health-related attributes.
- **Social Interaction:** Enable users to follow and befriend other users.
- **Diet Tracking and Logging:** Manage diet plans, log food and drink intake, and track hydration and nutrition details.
- **Biometric Tracking:** Log and monitor health metrics like BMI, weight, and heart rate.
- **Exercise Tracking:** Create and track exercise routines with details like duration and muscle groups.
- **Goal Setting:** Set and track user goals with start/end dates and progress points.
- **Challenges:** Allow users to join and track challenges with descriptions and durations, track progress.
- **Gamification:** Implement a points system to reward users for completing tasks and challenges.


# Assumptions and Constraints
- User can follow exactly one diet plan or none. A diet plan is custom to a single user.
  - **One-to-one** with **total participation of Diet_Plan** and **partial participation of User**
- User can join as many challenges as needed at same time or none. A challenge can only exist if at least one user joins it.
  - **Many-to-many** with **total participation of Challenge** and **partial participation of User**
- User can do as many exercises as needed at same time or none. An exercise can exist even if no user does it.
  - **Many-to-many** with **partial participation of User, Exercise**
- User can target as many goals as needed at same time or none. A goal is custom to a single user.
  - **Many-to-many** with **partial participation of User, Goal**
- User can record logs like water, in-body measurements, biometric and food intake
  - **Disjointness** with **total participation of child entity**
- Goal is a gamification element, to give points to User, User can only have one goal at a time, to motivate and concentrate on it.
  - **One-to-one** with **partial participation of Goal, User**
- Many **Exercise**s can be done by a **User**. **Exercise** can exist even if User didn't do it, by being a part of a **Goal**.
  - **Many-to-many** with **partial participation of User, Exercise**
- Challenge is a gamification element, to give more points to User, combines many Goals together, User can join as many challenges as needed at same time or none. A challenge can only exist if at least one user joins it.
  - **Many-to-many** with **total participation of Challenge** and **partial participation of User**
  - **Many-to-many** with **partial participation of Challenge** and **total participation of Goal**
- Logs can be identified by a unique ID (no need for part of it's ID to be with User relationship), and can be recorded by a user at any time.
  - **Log** is not a weak entity.

# EER Diagram

```{figure} Final_Files/Final_EER.png
EER Diagram
```

# Relational Schema
```{figure} Final_Files/Final_Relational.png
Relational Schema
```