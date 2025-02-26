-- Effect of Marketing Spend on Daily Revenue
SELECT 
    Marketing_Spend_Per_Day, 
    ROUND(AVG(Daily_Revenue), 2) AS avg_revenue
FROM your_project_id.your_dataset.coffee_shop_data
GROUP BY Marketing_Spend_Per_Day
ORDER BY avg_revenue DESC;

-- Correlation Between Customer Count and Daily Sales
SELECT 
    CORR(Number_of_Customers_Per_Day, Daily_Revenue) AS customer_revenue_correlation
FROM your_project_id.your_dataset.coffee_shop_data;

-- Relationship Between Staffing Levels and Revenue Generation
SELECT 
    Number_of_Employees, 
    ROUND(AVG(Daily_Revenue), 2) AS avg_revenue
FROM your_project_id.your_dataset.coffee_shop_data
GROUP BY Number_of_Employees
ORDER BY avg_revenue DESC;

-- Influence of Foot Traffic and Operating Hours on Customer Behavior
SELECT 
    Operating_Hours_Per_Day, 
    Location_Foot_Traffic, 
    ROUND(AVG(Number_of_Customers_Per_Day), 2) AS avg_customers,
    ROUND(AVG(Daily_Revenue), 2) AS avg_revenue
FROM your_project_id.your_dataset.coffee_shop_data
GROUP BY Operating_Hours_Per_Day, Location_Foot_Traffic
ORDER BY avg_revenue DESC;

-- Advanced Analytics: Best Combination for Maximum Revenue
WITH RevenueRank AS (
    SELECT 
        Number_of_Customers_Per_Day, 
        Number_of_Employees, 
        Location_Foot_Traffic,
        ROUND(AVG(Daily_Revenue), 2) AS avg_revenue,
        RANK() OVER (ORDER BY AVG(Daily_Revenue) DESC) AS revenue_rank
    FROM your_project_id.your_dataset.coffee_shop_data
    GROUP BY Number_of_Customers_Per_Day, Number_of_Employees, Location_Foot_Traffic
)
SELECT 
    r.Number_of_Customers_Per_Day, 
    r.Number_of_Employees, 
    r.Location_Foot_Traffic, 
    r.avg_revenue,
    (r.Number_of_Customers_Per_Day * r.Location_Foot_Traffic) AS traffic_customer_factor,
    e.avg_remp_performance
FROM RevenueRank r
LEFT JOIN (
    SELECT 
        Number_of_Employees, 
        ROUND(AVG(Daily_Revenue), 2) AS avg_remp_performance
    FROM your_project_id.your_dataset.coffee_shop_data
    GROUP BY Number_of_Employees
) e ON r.Number_of_Employees = e.Number_of_Employees
WHERE r.revenue_rank <= 5
ORDER BY r.avg_revenue DESC;


