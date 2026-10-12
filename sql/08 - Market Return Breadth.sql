-- Positive vs Negative Stocks by Year
-- Reshapes the market summary into a format
-- that Looker Studio can use for a stacked chart.

SELECT
  year,
  'Positive' AS return_type,
  positive_return_stocks AS stock_count
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.market_annual_summary`

UNION ALL

SELECT
  year,
  'Negative' AS return_type,
  negative_return_stocks AS stock_count
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.market_annual_summary`

ORDER BY year, return_type;

#Checking that the table exists and runs
SELECT *
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.market_return_breadth`
ORDER BY year, return_type;

#Summary using distinct counts
SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT year) AS years,
  COUNT(DISTINCT return_type) AS return_types
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.market_return_breadth`;