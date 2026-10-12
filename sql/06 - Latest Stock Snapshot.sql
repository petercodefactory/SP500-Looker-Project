#Latest Stock Snapshot
WITH latest_stock AS (
  SELECT
    symbol,
    date,
    close,
    daily_return
  FROM `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_stocks`
  QUALIFY ROW_NUMBER() OVER (
    PARTITION BY symbol
    ORDER BY date DESC
  ) = 1
)

SELECT
  s.symbol,
  c.company,
  c.sector,
  c.sub_industry,
  c.headquarters,
  c.date_added,
  c.founded,
  s.date AS latest_date,
  s.close AS latest_close,
  s.daily_return AS latest_daily_return

FROM latest_stock s

LEFT JOIN `project-3a5c9134-5a41-46b4-9d6.sp500_data.sp500_companies` c
  ON s.symbol = c.symbol

ORDER BY s.symbol;