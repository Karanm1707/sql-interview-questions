# 🔁 Users with Repeat Purchases in the Same Month

## 🧠 Problem Statement

The business team wants to identify users who made **multiple purchases within the same calendar month** — as they’re likely high-intent customers or potential loyalty program candidates.

🎯 **Goal**:  
Find all `user_id`s who have placed **more than one order** in the **same month**.

---

## 🧾 Table: `orders`

| order_id | user_id | order_date |
|----------|---------|-------------|
| INT      | INT     | DATE        |

---

## 💡 Concepts Used:
- `GROUP BY user_id, MONTH(order_date)`
- `COUNT() > 1`
- Subquery (optional)

---

## 🧠 SQL Query:

```sql
SELECT user_id 
FROM (
  SELECT user_id, MONTH(order_date) AS month, COUNT(*) AS cnt
  FROM orders
  GROUP BY user_id, MONTH(order_date)
  HAVING COUNT(*) > 1
) a;
