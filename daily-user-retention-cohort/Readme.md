# 📊 Daily User Retention — 30-Day Cohort Analysis (SQL)

## 🧠 Problem Statement

Analyze user retention for the first set of users who became active on the earliest date in the system.  
We aim to track how many of these users came back and used the system on each of the next 30 days.

---

## 📂 Dataset

We use the following two tables:

### 1. `users`
| user_id | signup_date |
|---------|-------------|
| 1       | 2024-01-01  |
| 2       | 2024-01-01  |
| ...     | ...         |

### 2. `user_activity`
| user_id | activity_date |
|---------|----------------|
| 1       | 2024-01-01     |
| 1       | 2024-01-02     |
| ...     | ...            |

---

## ✅ Objective

From the first activity day (Day 0), calculate for each day (up to 30 days):

- How many cohort users returned (`retained_users`)
- What % of total cohort returned (`retention_rate`)
