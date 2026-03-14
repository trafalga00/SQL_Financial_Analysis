SELECT product_name, category, unit_price, gross_margin_pct
FROM nexus_products
ORDER BY category, unit_price DESC;

SELECT product_name, unit_price, supplier_country
FROM nexus_products
WHERE category = 'Electronics'
  AND unit_price >= 100
ORDER BY unit_price DESC;

SELECT order_id, order_date, total_amount, payment_method
FROM nexus_orders
WHERE is_returned = 'Y'
ORDER BY total_amount DESC;

SELECT 
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM nexus_orders o
JOIN nexus_products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT 
    payment_method,
    COUNT(*) AS order_count,
    ROUND(AVG(total_amount), 2) AS avg_order_value
FROM nexus_orders
GROUP BY payment_method
HAVING AVG(total_amount) >= 500
ORDER BY avg_order_value DESC;

SELECT 
    STRFTIME('%Y', order_date) AS fiscal_year,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    SUM(gross_profit) AS total_gross_profit,
    ROUND(SUM(gross_profit) * 100.0 / SUM(total_amount), 1) AS gp_margin_pct
FROM nexus_orders
WHERE order_status != 'Cancelled'
GROUP BY fiscal_year
ORDER BY fiscal_year;

SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    c.state,
    c.customer_segment,
    p.product_name,
    p.category,
    o.order_date,
    o.total_amount,
    o.order_status
FROM nexus_orders o
JOIN nexus_customers c ON o.customer_id = c.customer_id
JOIN nexus_products p ON o.product_id = p.product_id
ORDER BY o.total_amount DESC
LIMIT 20;

SELECT 
    c.state,
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_revenue
FROM nexus_orders o
JOIN nexus_customers c ON o.customer_id = c.customer_id
JOIN nexus_products p ON o.product_id = p.product_id
GROUP BY c.state, p.category
ORDER BY c.state, total_revenue DESC;

SELECT 
    c.customer_segment,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    COUNT(o.order_id) AS total_orders,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value,
    ROUND(AVG(o.discount_rate), 1) AS avg_discount_rate,
    SUM(o.gross_profit) AS total_gross_profit
FROM nexus_orders o
JOIN nexus_customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY avg_order_value DESC;