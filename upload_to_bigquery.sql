upload_sql_content = """-- Create table for coffee shop data in BigQuery
CREATE OR REPLACE TABLE your_project_id.your_dataset.coffee_shop_data AS
SELECT
    SAFE_CAST(Number_of_Customers_Per_Day AS INT64) AS Number_of_Customers_Per_Day,
    SAFE_CAST(Average_Order_Value AS FLOAT64) AS Average_Order_Value,
    SAFE_CAST(Operating_Hours_Per_Day AS INT64) AS Operating_Hours_Per_Day,
    SAFE_CAST(Number_of_Employees AS INT64) AS Number_of_Employees,
    SAFE_CAST(Marketing_Spend_Per_Day AS FLOAT64) AS Marketing_Spend_Per_Day,
    SAFE_CAST(Location_Foot_Traffic AS INT64) AS Location_Foot_Traffic,
    SAFE_CAST(Daily_Revenue AS FLOAT64) AS Daily_Revenue
FROM `your_project_id.your_dataset.raw_coffee_shop_data`;
"""