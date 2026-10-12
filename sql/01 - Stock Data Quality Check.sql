#Counting the number of rows in the table
SELECT COUNT(*) AS row_count
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`;

#Date range of the table
SELECT
  MIN(date) AS earliest_date,
  MAX(date) AS latest_date
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`;

#Number of symbols in the table
SELECT COUNT(DISTINCT symbol) AS unique_symbols
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`;

#Checking for NULL Values in each column
SELECT
  COUNTIF(date IS NULL) AS null_dates,
  COUNTIF(open IS NULL) AS null_open,
  COUNTIF(high IS NULL) AS null_high,
  COUNTIF(low IS NULL) AS null_low,
  COUNTIF(close IS NULL) AS null_close,
  COUNTIF(volume IS NULL) AS null_volume,
  COUNTIF(symbol IS NULL) AS null_symbols,
  COUNTIF(daily_return IS NULL) AS null_daily_returns
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`;