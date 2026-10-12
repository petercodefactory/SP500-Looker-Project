#Sector Annual Summary
SELECT
  year,
  sector,

  COUNT(DISTINCT symbol) AS companies,

  AVG(annual_return) AS average_annual_return,

  APPROX_QUANTILES(
    annual_return, 100
  )[OFFSET(50)] AS median_annual_return,

  COUNTIF(annual_return > 0) AS positive_return_stocks,

  COUNTIF(annual_return < 0) AS negative_return_stocks,

  SAFE_DIVIDE(
    COUNTIF(annual_return > 0),
    COUNT(*)
  ) AS percentage_positive,

  AVG(annualized_volatility) AS average_annualized_volatility

FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.annual_company_performance_enriched`

GROUP BY
  year,
  sector

ORDER BY
  year,
  sector;
