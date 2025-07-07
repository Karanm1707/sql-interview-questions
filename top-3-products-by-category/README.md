# 🏆 Top 3 Products by Revenue Within Each Category

### ✅ Problem:
Get the top 3 products by total revenue in each product category using SQL.

### 🛠️ Tables:
- `products(product_id, category, product_name)`
- `orders(order_id, product_id, revenue)`

### 💡 Concepts Used:
- JOIN
- GROUP BY + SUM()
- Window Function (RANK)
- CTE (Common Table Expression)

### 📌 SQL Query:
```sql
WITH cte AS (
  SELECT 
    p.product_id, 
    category, 
    product_name, 
    SUM(o.revenue) AS total_revenue,
    RANK() OVER(PARTITION BY category ORDER BY SUM(o.revenue) DESC) AS rnkk
  FROM products p 
  JOIN orders o ON p.product_id = o.product_id
  GROUP BY p.product_id, category, product_name
)
SELECT 
  product_id, 
  category, 
  product_name, 
  total_revenue 
FROM cte
WHERE rnkk <= 3;
