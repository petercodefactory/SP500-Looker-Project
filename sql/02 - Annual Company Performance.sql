#Annual Performance by Company
WITH annual_prices AS (
  SELECT
    symbol,
    EXTRACT(YEAR FROM date) AS year,
    ARRAY_AGG(
      STRUCT(date, close)
      ORDER BY date ASC
      LIMIT 1
    )[OFFSET(0)] AS first_day,
    ARRAY_AGG(
      STRUCT(date, close)
      ORDER BY date DESC
      LIMIT 1
    )[OFFSET(0)] AS last_day
  FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`
  GROUP BY symbol, year
),

annual_volatility AS (
  SELECT
    symbol,
    EXTRACT(YEAR FROM date) AS year,
    STDDEV(daily_return) * SQRT(252) AS annualized_volatility
  FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`
  WHERE daily_return IS NOT NULL
  GROUP BY symbol, year
)

SELECT
  p.symbol,
  p.year,
  p.first_day.close AS start_close,
  p.last_day.close AS end_close,
  SAFE_DIVIDE(
    p.last_day.close,
    p.first_day.close
  ) - 1 AS annual_return,
  v.annualized_volatility
FROM annual_prices p
LEFT JOIN annual_volatility v
  ON p.symbol = v.symbol
  AND p.year = v.year
ORDER BY p.symbol, p.year;