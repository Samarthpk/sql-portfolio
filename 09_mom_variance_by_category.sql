-- Q9: Month-over-month revenue variance by category
-- Uses LAG() partitioned by category to track each category independently

SELECT category, order_month,
       ROUND(SUM(net_revenue), 2) AS monthly_rev,
       ROUND(SUM(net_revenue) - LAG(SUM(net_revenue)) 
             OVER (PARTITION BY category ORDER BY order_month), 2) AS variance
FROM sales
GROUP BY category, order_month
ORDER BY category, order_month;

-- Result (Electronics):
-- Biggest drop: May (-$2,570) → inventory or demand issue
-- Biggest gain: Feb (+$910) → possible seasonal bump
-- Office most stable month-to-month → predictable demand
