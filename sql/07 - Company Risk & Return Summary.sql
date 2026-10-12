-- Company Risk & Return Summary
-- Complete calendar years are used for annual metrics.
-- Companies without sufficient historical data are retained.

WITH daily_drawdown AS (
  SELECT
    symbol,
    date,
    close,

    close / MAX(close) OVER (
      PARTITION BY symbol
      ORDER BY date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) - 1 AS drawdown

  FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`
),

max_drawdowns AS (
  SELECT
    symbol,
    MIN(drawdown) AS max_drawdown
  FROM daily_drawdown
  GROUP BY symbol
),

annual_summary AS (
  SELECT
    symbol,

    COUNT(*) AS years_observed,

    AVG(annual_return) AS average_annual_return,

    AVG(annualized_volatility) AS average_annualized_volatility,

    COUNTIF(annual_return > 0) AS positive_years,

    COUNTIF(annual_return < 0) AS negative_years

  FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.annual_company_performance_enriched`

  WHERE year < 2026

  GROUP BY symbol
)

SELECT
  c.symbol,
  c.company,
  c.sector,
  c.sub_industry,

  a.years_observed,
  a.average_annual_return,
  a.average_annualized_volatility,

  d.max_drawdown,

  a.positive_years,
  a.negative_years

FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_companies` c

LEFT JOIN annual_summary a
  ON c.symbol = a.symbol

LEFT JOIN max_drawdowns d
  ON c.symbol = d.symbol

ORDER BY c.symbol;