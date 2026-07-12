-- Q7: Running total of net revenue by month
-- Uses SUM() as window function with ORDER BY for cumulative calculation

SELECT order_month,
       ROUND(SUM(net_revenue), 2) AS monthly_rev,
       ROUND(SUM(SUM(net_revenue)) OVER (ORDER BY order_month), 2) AS running_total
FROM sales
GROUP BY order_month;

-- Result:
-- Jan → $15,867  | Running: $15,867
-- Feb → $15,915  | Running: $31,783
-- ...
-- Dec → $15,003  | Running: $171,679 (full year total)
-- Useful for tracking progress toward annual revenue targets
