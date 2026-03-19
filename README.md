# SQL Financial Analysis — Nexus Commerce

## Project Overview
Retail sales analysis for Nexus Commerce, a fictional large-scale U.S. e-commerce retailer. This project demonstrates SQL querying skills using a multi-table relational dataset.

> ⚠️ **Practice Project** — Self-study project using fictional data for learning and demonstrating SQL and Excel skills.

## Dataset
- nexus_orders.csv — 1,500 transactions (2022–2024)
- nexus_customers.csv — 200 customers across 15 U.S. states
- nexus_products.csv — 80 products across 8 categories
- nexus_gl.csv — Quarterly General Ledger entries by region

## Key Questions Answered
- Which product categories generate the highest revenue?
- How does customer segment affect average order value and discount rate?
- What is the year-over-year gross profit trend?
- Which states drive the most sales by category?

## SQL Skills Demonstrated
- Level 1: SELECT, WHERE, ORDER BY, LIMIT
- Level 2: GROUP BY, HAVING, Aggregate Functions
- Level 3: Multi-table JOIN, Table Aliases
  
## Excel Skills Demonstrated
- Pivot Table: Average unit price and gross margin rate analysis by category
- VLOOKUP: Product lookup by name to retrieve unit price and gross margin

## Tools Used
- SQLite / DB Browser for SQLite
- Microsoft Excel (Pivot Table, VLOOKUP)

## Query 1-3
- List of products sorted by category, then by unit price from highest to lowest, showing product name, category, unit price, and gross margin percentage.
```sql
SELECT product_name, category, unit_price, gross_margin_pct
FROM nexus_products
ORDER BY category, unit_price DESC;
```

## Query 11-14
- List of returned orders, sorted by total amount from highest to lowest, showing order ID, date, total amount, and payment method.
```sql
SELECT order_id, order_date, total_amount, payment_method
FROM nexus_orders
WHERE is_returned = 'Y'
ORDER BY total_amount DESC;
```

## Query 14-21
**Question:** Which product categories generate the highest revenue?
- Category-level sales summary — showing total orders, revenue, and average order value per category, sorted by highest revenue first. Joins orders with products to get the category info.

```sql
SELECT 
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM nexus_orders o
JOIN nexus_products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
```


