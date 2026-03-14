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

## Query 1: Product Pricing by Category
## Query 2: Electronics Pricing Over $100
## Query 3: Returned Orders Ranked by Amount
```sql
SELECT product_name, category, unit_price, gross_margin_pct
FROM nexus_products
ORDER BY category, unit_price DESC;
```

![query results](Nexus_query_1-3.png)
