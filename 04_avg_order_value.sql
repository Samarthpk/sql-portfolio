-- Q4: Average order value (AOV) by category
-- AOV = total net revenue / distinct orders

SELECT category,
       ROUND(SUM(net_revenue) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM sales
GROUP BY category
ORDER BY avg_order_value DESC;

-- Result:
-- Electronics    → $139.91 (high-ticket items driving AOV)
-- Fitness        → $68.61
-- Home & Kitchen → $68.57
-- Office         → $45.74 (lowest AOV, high volume category)
