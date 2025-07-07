# 📅 Users Who Purchased in January but Not in February

## 🧠 Problem Statement

You’re working with an orders dataset and the marketing team wants to find users who were **active in January** but became **inactive in February**.

🎯 **Goal**: Find users who placed **at least one order in January**, but **zero orders in February**.

---

## 🧾 Table: `orders`

| order_id | user_id | order_date |
|----------|---------|-------------|
| INT      | INT     | DATE        |

---

## 💡 Concepts Used:
- `MONTH()` function
- Subquery with `NOT IN`
- `DISTINCT`
- Filtering and exclusion

---

## 🧠 SQL Query:

```sql
SELECT DISTINCT user_id 
FROM orders
WHERE MONTH(order_date) = 1 
  AND user_id NOT IN (
    SELECT user_id FROM orders WHERE MONTH(order_date) = 2
);
