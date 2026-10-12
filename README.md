# S&P 500 Stock Market Analysis

## Project Overview

This project analyses historical stock price data for S&P 500 companies using Python, SQL, Google BigQuery and Looker Studio.

The aim is to explore historical company performance, market-wide trends, sector differences, and the relationship between investment returns and risk. The project combines data cleaning and validation, analytical calculations, cloud-based data processing, and interactive dashboard development.

**Project status:** Core analysis and dashboard functionality complete. Visual presentation improvements and final portfolio screenshots are planned.

## Project Objectives

- Analyse historical annual stock price returns and volatility.
- Compare performance across companies and sectors.
- Explore market breadth by examining the number of companies with positive and negative annual returns.
- Assess company risk and return, including historical maximum drawdown.
- Examine the latest available closing prices and daily price movements.
- Present findings through an interactive Looker Studio dashboard.

## Tools and Technologies

- **Python and pandas** — data cleaning, validation and analysis.
- **SQL** — analytical transformations and aggregations.
- **Google BigQuery** — cloud data storage and analytical queries.
- **Looker Studio** — interactive dashboard and visual reporting.
- **Git and GitHub** — version control and project documentation.

## Dashboard

The dashboard contains four pages:

1. **Market Overview** — annual performance, market breadth, volatility and risk versus return.
2. **Company Performance** — company-level annual performance, risk and return, maximum drawdown and rankings.
3. **Sector Analysis** — sector-level returns and volatility over time, with sector comparisons.
4. **Latest Market Snapshot** — latest available closing prices, daily returns and company-level comparisons.

### Dashboard Screenshots

*Screenshots will be added after the planned visual design improvements.*

- **Market Overview:** `[Screenshot to be added]`
- **Company Performance:** `[Screenshot to be added]`
- **Sector Analysis:** `[Screenshot to be added]`
- **Latest Market Snapshot:** `[Screenshot to be added]`

## Data and Methodology

The project uses historical stock prices and company information from the Kaggle dataset *S&P 500 Stocks: 25 Years of Data (Updated Daily)* by darkmatternet.

The analysis includes daily price returns, annual first-close-to-last-close price returns, annualised volatility, market and sector summaries, and company-level maximum drawdown.

The analysis uses closing prices and does not include dividends in its return calculations.

## Limitations

- **Price returns:** Returns exclude dividends and therefore are not total investment returns.
- **Survivorship bias:** The dataset does not reconstruct historical S&P 500 membership at each point in time. Results should not be interpreted as a complete historical simulation of the index.
- **Partial-year data:** 2026 figures are year-to-date through 25 September 2026 and are not directly comparable with complete calendar years.
- **Latest snapshot:** The latest stock data in this project is historical data through 25 September 2026, not a live market feed.

## Repository Structure

The repository will contain the Python scripts, SQL queries, documentation and supporting project files. Large raw datasets will be documented but may be excluded from version control.

## Future Improvements

- Refine dashboard colours, layout and typography.
- Add final dashboard screenshots.
- Complete repository documentation and reproducibility instructions.
- Publish the finished project on GitHub.
