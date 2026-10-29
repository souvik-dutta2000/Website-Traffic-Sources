SELECT COUNT(*) FROM traffic_data;
select * from source_cost;


--Q1. Sessions, Bounce Rate, Conversion Rate, and Revenue by Source
SELECT 
    Traffic_Source,
    COUNT(*) AS sessions,
    ROUND(AVG(Bounced) * 100, 2) AS bounce_rate_pct,
    ROUND(AVG(Converted) * 100, 2) AS conversion_rate_pct,
    SUM(Revenue) AS revenue
FROM traffic_data
GROUP BY Traffic_Source
ORDER BY revenue DESC;



--Q2. Cost per Conversion and ROI (Covering 3 Months)

SELECT 
    t.Traffic_Source,
    SUM(t.Converted) AS conversions,
    MAX(c.Monthly_Cost) * 3 AS total_cost,
    ROUND((MAX(c.Monthly_Cost) * 3) / NULLIF(SUM(t.Converted), 0), 0) AS cost_per_conversion,
    ROUND((SUM(t.Revenue) - (MAX(c.Monthly_Cost) * 3)) / NULLIF(MAX(c.Monthly_Cost) * 3, 0), 2) AS roi
FROM traffic_data t
LEFT JOIN source_cost c 
    ON t.Traffic_Source = c.Traffic_Source
GROUP BY t.Traffic_Source
ORDER BY cost_per_conversion;



--Q3. Device Performance Breakdown

SELECT 
    Device,
    COUNT(*) AS sessions,
    SUM(CASE WHEN Bounced = 1 THEN 1 ELSE 0 END) AS bounced_sessions,
    SUM(CASE WHEN Converted = 1 THEN 1 ELSE 0 END) AS conversions,
    ROUND(SUM(Converted) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM traffic_data
GROUP BY Device;



--Q4. Landing Page Conversion Performance

SELECT 
    Landing_Page, 
    COUNT(*) AS sessions,
    ROUND(AVG(Converted) * 100, 2) AS conversion_rate_pct
FROM traffic_data
GROUP BY Landing_Page
ORDER BY conversion_rate_pct DESC;



--Q5. Monthly Sessions and Revenue

SELECT 
    FORMAT([Date], 'yyyy-MM') AS [month],
    COUNT(*) AS sessions,
    SUM(Revenue) AS revenue
FROM traffic_data
GROUP BY FORMAT([Date], 'yyyy-MM')
ORDER BY [month];

--Q6. Rank Sources by Total Revenue

SELECT 
    Traffic_Source, 
    SUM(Revenue) AS revenue,
    RANK() OVER (ORDER BY SUM(Revenue) DESC) AS revenue_rank
FROM traffic_data
GROUP BY Traffic_Source;



--Q7. Top 3 Cities for Each Traffic Source

WITH city_rank AS (
    SELECT 
        Traffic_Source, 
        City, 
        COUNT(*) AS sessions,
        ROW_NUMBER() OVER (PARTITION BY Traffic_Source ORDER BY COUNT(*) DESC) AS rn
    FROM traffic_data
    GROUP BY Traffic_Source, City
)
SELECT Traffic_Source, City, sessions
FROM city_rank 
WHERE rn <= 3;



--Q8. High-Value Sources (Above Average Conversion Rate)

SELECT
    Traffic_Source,
    ROUND(AVG(CAST(Converted AS FLOAT)) * 100, 2) AS conv_rate_pct
FROM traffic_data
GROUP BY Traffic_Source
HAVING AVG(CAST(Converted AS FLOAT)) > (
    SELECT AVG(CAST(Converted AS FLOAT)) 
    FROM traffic_data
);


