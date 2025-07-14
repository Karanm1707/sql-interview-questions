SQL Case Study | New vs Repeat Customers – Real-World E-commerce Scenario

🧠 Scenario:

As an Analyst at an e-commerce company, I was tasked with identifying daily new vs repeat customers based on their order behavior.

The key goal was to segment customers:

Who were ordering for the first time (new customers)

Who had ordered before (repeat customers)

This helps in understanding user acquisition, retention trends, and planning personalized marketing campaigns.

🛠️ Approach:

For each customer, find the first order date using MIN(order_date).

Compare each order’s date with the first visit:

If it matches → New customer

If it doesn’t match → Repeat customer

Group the data by order_date and count both types.


📈 Why this matters:

Understanding daily customer segments enables:

Better marketing & targeting

Insights on retention health

Product strategy based on user loyalty
