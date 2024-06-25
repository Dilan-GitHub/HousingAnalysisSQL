SELECT * FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;

-- Standardize Date Format

SELECT SaleDate, CAST(SaleDate AS DATE) AS FormattedSaleDate
FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;

-- Breaking out PropertyAddress into individual columns (Address, City)

SELECT
  SPLIT(propertyaddress, ',')[OFFSET(0)] AS street_address,
  TRIM(SPLIT(propertyaddress, ',')[OFFSET(1)]) AS city,
  UniqueID, ParcelID, LandUse, SaleDate, SalePrice, LegalReference, SoldAsVacant, OwnerName, OwnerAddress, Acreage, TaxDistrict, LandValue, BuildingValue, TotalValue, YearBuilt,  Bedrooms, FullBath, HalfBath
FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;

-- Breaking out OwnerAddress to individual columns (Street, City, State)

SELECT 
  SPLIT(owneraddress, ',')[SAFE_OFFSET(0)] AS street_address,
  TRIM(SPLIT(owneraddress, ',')[SAFE_OFFSET(1)]) AS city,
  TRIM(SPLIT(owneraddress, ',')[SAFE_OFFSET(2)]) AS state
FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;


-- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT (SoldAsVacant), COUNT (SoldAsVacant)
FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`; 
GROUP BY SoldAsVacant
ORDER BY 2

SELECT DISTINCT 
  CASE 
    WHEN SoldAsVacant = true THEN 'Yes'
    WHEN SoldAsVacant = false THEN 'No'
    ELSE NULL 
  END AS SoldAsVacant
FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`; 

-- Removing Duplicates 

WITH RowNumCTE AS (
  SELECT 
    UniqueID,
    ROW_NUMBER() OVER (PARTITION BY ParcelID, PropertyAddress, SalePrice, SaleDate, LegalReference ORDER BY UniqueID) AS row_num
  FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;
)

DELETE FROM `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;
WHERE UniqueID IN (
  SELECT UniqueID
  FROM RowNumCTE
  WHERE row_num > 1
);


-- Delete Unused Columns

DROP TABLE IF EXISTS `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;

CREATE TABLE `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;
AS
SELECT
  UniqueID,
  ParcelID,
  streetaddress,
  cityaddress,
  LandUse,
  SaleDate,
  SalePrice,
  LegalReference,
  SoldAsVacant,
  OwnerName,
  OwnerStreetAddress,
  OwnerCityAddress,
  OwnerStateAddress,
  Acreage,
  LandValue,
  BuildingValue,
  TotalValue,
  YearBuilt,
  Bedrooms,
  FullBath,
  HalfBath 
FROM
  `nashvillehousing-421500.NashvilleHousingDataset.housingtable`;
