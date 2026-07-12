-- Q1: Total orders and net revenue by category
-- Shows which product categories drive the most revenue

SELECT category,
       COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(net_revenue), 2) AS net_revenue
FROM sales
GROUP BY category
ORDER BY net_revenue DESC;

-- Result: Electronics dominates at $92,477 (54% of total)
-- Office has highest order count relative to revenue → lowest AOV
