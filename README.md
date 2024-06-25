# Nashville Housing Data Analysis

## About

This project involves cleaning and analyzing the Nashville housing dataset using SQL. The dataset includes various attributes related to housing properties in Nashville, such as sale dates, prices, addresses, and more. The primary objective is to clean the data, standardize formats, and perform analyses to gain insights into the housing market in Nashville.

## Purposes Of The Project

The major aim of this project is to clean and analyze the Nashville housing data to understand trends in the housing market, identify key factors affecting property values, and provide insights for stakeholders in the real estate industry.

## About Data

The dataset used for this project includes the following columns:

| Column           | Description                              | Data Type      |
| :--------------- | :--------------------------------------- | :------------- |
| UniqueID         | Unique identifier for each property      | INT            |
| ParcelID         | Parcel identifier                        | VARCHAR(50)    |
| PropertyAddress  | Address of the property                  | VARCHAR(100)   |
| SaleDate         | Date of the sale                         | DATE           |
| SalePrice        | Price at which the property was sold     | DECIMAL(10, 2) |
| LegalReference   | Legal reference for the property         | VARCHAR(50)    |
| SoldAsVacant     | Indicates if the property was sold as vacant | BOOLEAN       |
| OwnerName        | Name of the property owner               | VARCHAR(100)   |
| OwnerAddress     | Address of the property owner            | VARCHAR(100)   |
| Acreage          | Size of the property in acres            | DECIMAL(10, 2) |
| TaxDistrict      | Tax district of the property             | VARCHAR(50)    |
| LandValue        | Value of the land                        | DECIMAL(10, 2) |
| BuildingValue    | Value of the building                    | DECIMAL(10, 2) |
| TotalValue       | Total value of the property              | DECIMAL(10, 2) |
| YearBuilt        | Year the property was built              | INT            |
| Bedrooms         | Number of bedrooms                       | INT            |
| FullBath         | Number of full bathrooms                 | INT            |
| HalfBath         | Number of half bathrooms                 | INT            |

### Analysis List

1. Standardize Date Format
   > Convert the sale date to a standardized date format.

2. Address Breakdown
   > Break down the property and owner addresses into individual components (street, city, state).

3. Sold As Vacant
   > Standardize the "Sold as Vacant" field to use "Yes" and "No" instead of "Y" and "N".

4. Duplicate Removal
   > Identify and remove duplicate records from the dataset.

5. Unused Columns
   > Remove columns that are not needed for the analysis.

## Approach Used

1. **Data Cleaning:**
   - Standardize date formats to ensure consistency.
   - Break down addresses into individual components for better analysis.
   - Convert "Y" and "N" values in the "Sold as Vacant" field to "Yes" and "No".
   - Identify and remove duplicate records using Common Table Expressions (CTE).
   - Drop unused columns to streamline the dataset.

# Conclusion

This project involves cleaning and analyzing the Nashville housing dataset to provide insights into the housing market. By standardizing data formats, breaking down addresses, and removing duplicates, the dataset is prepared for detailed analysis to identify trends and patterns in property values.

For more details, you can view the full SQL script file [HERE](https://github.com/Dilan-GitHub/HousingAnalysisSQL/blob/main/NashvilleHousing.sql)
