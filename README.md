# S&P 500 Stock Market Analysis

## Project Overview

This project analyses historical stock price data for S&P 500 companies using Python, SQL, Google BigQuery and Looker Studio.

The aim is to explore historical company performance, market-wide trends, sector differences, and the relationship between investment returns and risk. The project combines data cleaning and validation, analytical calculations, cloud-based data processing, and interactive dashboard development.

**Project status:** Core analysis and dashboard functionality complete. Final dashboard presentation improvements and portfolio screenshots are planned.

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

Screenshots will be added after the planned visual design improvements.

- **Market Overview:** Screenshot to be added.
- **Company Performance:** Screenshot to be added.
- **Sector Analysis:** Screenshot to be added.
- **Latest Market Snapshot:** Screenshot to be added.

## Data and Methodology

The project uses historical stock prices and company information from the Kaggle dataset *S&P 500 Stocks: 25 Years of Data (Updated Daily)* by darkmatternet.

Python and pandas are used to validate the source data, calculate daily price returns, and generate company-level analytical datasets.

The analysis includes:

- **Daily price returns** calculated from consecutive closing prices for each company.
- **Annual price returns** calculated using each company's first and last recorded closing prices within a calendar year.
- **Annualised volatility** calculated from daily returns.
- **Market and sector summaries** comparing annual company-level performance.
- **Company risk and return analysis** examining average annual returns, volatility and positive or negative years.
- **Maximum drawdown** measuring the largest peak-to-trough decline in historical closing prices.
- **Latest stock snapshot** summarising the most recent available closing prices and daily returns.

SQL queries in Google BigQuery create the analytical tables and summaries used by Looker Studio.

Market-wide summaries describe the distribution of returns across the companies represented in the dataset. They are not official S&P 500 index returns.

## Limitations

- **Price returns:** Returns exclude dividends and therefore do not represent total investment returns.
- **Survivorship bias:** The dataset does not reconstruct historical S&P 500 membership at each point in time. Results should not be interpreted as a complete historical simulation of the index.
- **Partial-year data:** 2026 figures are year-to-date through 25 September 2026 and are not directly comparable with complete calendar years.
- **Latest snapshot:** The latest stock data in this project is historical data through 25 September 2026, not a live market feed.

## Repository Structure

The GitHub repository contains the Python scripts, SQL queries, dependency specification and project documentation.

```text
SP500-Looker-Project/
├── .gitignore
├── README.md
├── requirements.txt
├── check_data.py
├── check_stock_data.py
└── sql/
    ├── 01 - Stock Data Quality Check.sql
    ├── 02 - Annual Company Performance.sql
    ├── 03 - Enriched Annual Company Performance.sql
    ├── 04 - Market Annual Summary.sql
    ├── 05 - Sector Annual Summary.sql
    ├── 06 - Latest Stock Snapshot.sql
    ├── 07 - Company Risk & Return Summary.sql
    └── 08 - Market Return Breadth.sql
```

The raw datasets, generated CSV files, Python virtual environment and local IDE settings are excluded from Git version control.

## Reproducing the Analysis

The repository includes the Python scripts and dependency specification. To reproduce the Python analysis, obtain the source CSV datasets separately from the original Kaggle dataset and place them in a local `Data/` directory.

From the project root, install the required Python dependency:

```bash
python -m pip install -r requirements.txt
```

Run the company-data validation script:

```bash
python check_data.py
```

Run the stock-data validation and analysis pipeline:

```bash
python check_stock_data.py
```

The analysis script generates cleaned datasets and derived CSV files in the local `Data/` directory. These files remain local and are excluded from Git version control.

The SQL queries are provided for the analytical transformations performed in BigQuery. Reproducing the complete dashboard also requires the corresponding BigQuery tables and Looker Studio configuration.

## Future Improvements

- Refine dashboard colours, layout and typography.
- Add final dashboard screenshots.
- Finalise the README and reproducibility documentation.
- Review the repository for a potential public release.
