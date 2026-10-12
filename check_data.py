from pathlib import Path

import pandas as pd


# Locate the Data folder relative to this script.
PROJECT_DIR = Path(__file__).resolve().parent
DATA_DIR = PROJECT_DIR / "Data"

companies_file = DATA_DIR / "sp500_companies.csv"

if not companies_file.exists():
    raise FileNotFoundError(
        f"Company dataset not found: {companies_file}"
    )

companies = pd.read_csv(companies_file)

print("Company dataset validation")
print("-" * 30)
print("Rows and columns:", companies.shape)

print("\nFirst five rows:")
print(companies.head())

print("\nColumn information:")
companies.info()

print("\nMissing values by column:")
print(companies.isna().sum())

print("\nDuplicate rows:", companies.duplicated().sum())

print("\nUnique company symbols:", companies["symbol"].nunique())
