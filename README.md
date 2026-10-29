# Website-Traffic-Sources
Project Workflow
1. Excel
Converted data to a Table, checked duplicates, blanks, data types and logic (bounced sessions must have 1 page view and no conversion)
Added helper columns: Month, Weekday, Session_Type, Duration_Band
Built 5 pivot tables (sessions, bounce rate, conversion rate, monthly revenue, device performance)
Created a quick dashboard with pivot charts and slicers
2. SQL
Created the database and tables, imported the CSV files
Wrote 8 queries covering source performance, cost per conversion (JOIN), device analysis (CASE), landing pages, monthly trend, revenue ranking (window function), top cities per source (CTE) and above-average sources (subquery)
Full code in sql/traffic_analysis.sql
3. Power BI
Cleaned data in Power Query and built a Date table
Modelled the relationships: Date_Table to traffic_data and source_cost to traffic_data (one-to-many)
Created DAX measures: Total Sessions, Total Revenue, Conversions, Bounce Rate, Conversion Rate, Revenue per Session, Total Cost, Cost per Conversion
Built a one-page interactive dashboard with KPI cards, charts and slicers (Date, Device, City)
Insights
Organic Search brings the most traffic (33% of sessions) and the highest revenue, with a low cost per conversion.
Email is the highest-quality source: lowest bounce rate (18.2%), highest conversion rate (15.8%) and the lowest cost per conversion among paid sources.
Social Media brings 354 sessions but converts only 1.1% with a 57.9% bounce rate, which points to a landing page or audience mismatch.
Paid Ads has the highest cost relative to its results (about INR 15,000 per conversion).
Mobile generates 55% of sessions but has a 46.7% bounce rate and 5.4% conversion, compared with 32.7% bounce and 8.8% conversion on Desktop.
Contact (10.9%) and Pricing (8.7%) landing pages convert best; Blog converts lowest (5.0%) but brings high traffic.
Monthly revenue grew steadily: INR 83,459 (Jul), 90,355 (Aug), 102,754 (Sep).
Recommendations
Move part of the Paid Ads and Social Media budget to Email and Organic Search content.
Improve mobile page speed and layout to reduce bounce.
Redesign or A/B test landing pages for Social Media traffic.
Add clear calls to action on Blog pages to push readers to Pricing or Contact
Skills Demonstrated

Data cleaning, pivot tables, SQL (JOIN, CASE, CTE, window functions, subqueries), data modelling, DAX, dashboard design, business insight writing.

Website_Traffic_Sources_Project_Guide.pdf has the three parts:

A/B test results for landing pages
Use real cost and campaign data
Publish the dashboard to Power BI Service
Author

Souvik Dutta, Data Analyst (Fresher), Kolkata LinkedIn: linkedin.com/in/souvik-dutta-6a4159257 GitHub: souvik-dutta2000
