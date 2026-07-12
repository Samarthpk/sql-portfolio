-- Q3: Month-over-Month revenue change
-- Uses LAG() window function to compare each month to the previous

SELECT order_month,
       ROUND(net_revenue, 2) AS net_revenue,
       ROUND(net_revenue - LAG(net_revenue) OVER (ORDER BY order_month), 2) AS mom_change,
       ROUND(100.0 * (net_revenue - LAG(net_revenue) OVER (ORDER BY order_month))
             / LAG(net_revenue) OVER (ORDER BY order_month), 1) AS mom_pct
FROM (
  SELECT order_month, SUM(net_revenue) AS net_revenue
  FROM sales
  GROUP BY order_month
);

-- Result: Biggest drop in Apr (-12.9%) and Nov (-13.9%)
-- Strongest recovery in Dec (+15.8%)
-- Q1 consistently strong → possible seasonal pattern
