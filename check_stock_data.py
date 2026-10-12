from pathlib import Path

import pandas as pd


# --------------------------------------------------
# 1. File paths and configuration
# --------------------------------------------------

PROJECT_DIR = Path(__file__).resolve().parent
DATA_DIR = PROJECT_DIR / "Data"

STOCKS_FILE = DATA_DIR / "sp500_stocks.csv"
COMPANIES_FILE = DATA_DIR / "sp500_companies.csv"

if not STOCKS_FILE.exists():
    raise FileNotFoundError(f"Stock dataset not found: {STOCKS_FILE}")

if not COMPANIES_FILE.exists():
    raise FileNotFoundError(
        f"Company dataset not found: {COMPANIES_FILE}"
    )


# --------------------------------------------------
# 2. Load and validate the source datasets
# --------------------------------------------------

print("Loading source datasets...")

stocks = pd.read_csv(STOCKS_FILE, parse_dates=["date"])
companies = pd.read_csv(COMPANIES_FILE)

required_stock_columns = {
    "date", "open", "high", "low", "close", "volume", "symbol"
}
required_company_columns = {
    "symbol", "company", "sector", "sub_industry"
}

missing_stock_columns = required_stock_columns - set(stocks.columns)
missing_company_columns = required_company_columns - set(companies.columns)

if missing_stock_columns:
    raise ValueError(
        f"Missing stock columns: {sorted(missing_stock_columns)}"
    )

if missing_company_columns:
    raise ValueError(
        f"Missing company columns: {sorted(missing_company_columns)}"
    )

print("\nStock dataset")
print("Rows and columns:", stocks.shape)
print("Missing values by column:")
print(stocks.isna().sum())
print("Duplicate rows:", stocks.duplicated().sum())
print("Date range:", stocks["date"].min(), "to", stocks["date"].max())
print("Unique stock symbols:", stocks["symbol"].nunique())

print("\nCompany dataset")
print("Rows and columns:", companies.shape)
print("Missing values by column:")
print(companies.isna().sum())
print("Duplicate rows:", companies.duplicated().sum())
print("Unique company symbols:", companies["symbol"].nunique())

company_symbols = set(companies["symbol"].dropna())
stock_symbols = set(stocks["symbol"].dropna())

print("\nStock symbols without company information:")
print(sorted(stock_symbols - company_symbols))

print("\nCompanies without stock data:")
print(sorted(company_symbols - stock_symbols))


# --------------------------------------------------
# 3. Clean and save the datasets
# --------------------------------------------------

print("\nSorting stock records by symbol and date...")

stocks = stocks.sort_values(["symbol", "date"]).copy()

companies["date_added"] = pd.to_datetime(
    companies["date_added"], errors="coerce"
)

stocks.to_csv(DATA_DIR / "sp500_stocks_clean.csv", index=False)
companies.to_csv(DATA_DIR / "sp500_companies_clean.csv", index=False)

print("Cleaned datasets saved.")


# --------------------------------------------------
# 4. Calculate daily returns
# --------------------------------------------------

print("\nCalculating daily returns...")

stocks["daily_return"] = (
    stocks.groupby("symbol")["close"].pct_change()
)

print("Missing daily returns:", stocks["daily_return"].isna().sum())
print("Minimum daily return:", stocks["daily_return"].min())
print("Maximum daily return:", stocks["daily_return"].max())

large_moves = stocks.loc[stocks["daily_return"].abs() > 0.20]

print("Daily moves greater than 20%:", len(large_moves))
print(
    "Percentage of observations:",
    len(large_moves) / len(stocks) * 100
)

stocks.to_csv(DATA_DIR / "sp500_stocks_analysis.csv", index=False)

print("Stock analysis file saved.")


# --------------------------------------------------
# 5. Calculate annual returns
# --------------------------------------------------

print("\nCalculating annual returns...")

stocks["year"] = stocks["date"].dt.year

annual_returns = (
    stocks.groupby(["symbol", "year"])
    .agg(
        start_close=("close", "first"),
        end_close=("close", "last")
    )
    .reset_index()
)

annual_returns["annual_return"] = (
    annual_returns["end_close"] / annual_returns["start_close"] - 1
)

annual_returns.to_csv(
    DATA_DIR / "sp500_annual_returns.csv",
    index=False
)

print("Annual returns file saved.")


# --------------------------------------------------
# 6. Calculate annualised volatility
# --------------------------------------------------

print("\nCalculating annualised volatility...")

annual_volatility = (
    stocks.groupby(["symbol", "year"])["daily_return"]
    .std()
    .mul(252 ** 0.5)
    .reset_index(name="annualized_volatility")
)

annual_performance = annual_returns.merge(
    annual_volatility,
    on=["symbol", "year"],
    how="left"
)

annual_performance.to_csv(
    DATA_DIR / "sp500_annual_performance.csv",
    index=False
)

print("Annual performance file saved.")


# --------------------------------------------------
# 7. Calculate maximum drawdown
# --------------------------------------------------

print("\nCalculating maximum drawdown...")

running_max = stocks.groupby("symbol")["close"].cummax()

stocks["drawdown"] = stocks["close"] / running_max - 1

max_drawdown = (
    stocks.groupby("symbol")["drawdown"]
    .min()
    .reset_index(name="max_drawdown")
)

max_drawdown.to_csv(
    DATA_DIR / "sp500_max_drawdown.csv",
    index=False
)

print("Maximum drawdown file saved.")

print("\nAll processing steps completed successfully.")
