# 🧠 Retrieve the Latest 3 Events Per User

## 📌 Problem Statement

You are given a table `user_events` that logs user activities on a digital platform. Each row represents a user’s action (like login, click, logout) along with a timestamp.

The goal is to **retrieve the 3 most recent events** for every user.  
This is a common requirement in analytics, where product or business teams want to understand:

- What users are doing most recently
- Whether they’re actively engaging with key features
- Triggering actions or recommendations based on fresh user activity

---

## 📂 Table Schema

**Table Name**: `user_events`

| Column       | Type        | Description                       |
|--------------|-------------|-----------------------------------|
| `user_id`    | INT         | ID of the user                    |
| `event_type` | VARCHAR     | Action performed (login, click)   |
| `event_time` | DATETIME    | Timestamp of the event            |

---

## 🚀 Approach

1. **Group data by user**:
   - Each user’s events are treated separately using a window partition.

2. **Sort events per user**:
   - Events are ordered by `event_time DESC` (latest first).

3. **Rank events**:
   - Use a window function (like `ROW_NUMBER`) to assign a sequence number to each event **per user** based on recency.

4. **Filter top 3**:
   - Select only those rows where the assigned row number is less than or equal to 3.

---

## 💡 Use Cases

- Displaying the latest 3 actions on a user dashboard  
- Auditing user behavior before key decisions (e.g., flagging suspicious logins)  
- Building recommendation systems based on fresh activity  
- Triggering notifications or campaigns using most recent touchpoints  

