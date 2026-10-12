#Joining annual company performance table with the companies table
SELECT
  p.symbol,
  c.company,
  c.sector,
  c.sub_industry,
  c.headquarters,
  c.date_added,
  c.founded,
  p.year,
  p.start_close,
  p.end_close,
  p.annual_return,
  p.annualized_volatility
FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.annual_company_performance` p
LEFT JOIN `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_companies` c
  ON p.symbol = c.symbol
ORDER BY p.symbol, p.year;