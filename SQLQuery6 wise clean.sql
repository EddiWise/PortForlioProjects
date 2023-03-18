--Use [dbo].[NashvilleHousing]

Select PropertyAddress
From PortfolioProject..[NashvilleHousing]


Select
SUBSTRING (PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as Address
,SUBSTRING (PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as Address

From PortfolioProject..[NashvilleHousing]


ALTER TABLE NashvilleHousing
Add PropertySplitAddress Nvarchar(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER TABLE NashvilleHousing
Add PropertySplitCity Nvarchar(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING (PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))

Select PropertySplitAddress
From PortfolioProject..[NashvilleHousing]






Select OwnerAddress
From PortfolioProject..[NashvilleHousing]

Select
PARSENAME(REPLACE(OwnerAddress,',','.'),3),
PARSENAME(REPLACE(OwnerAddress,',','.'),2),
PARSENAME(REPLACE(OwnerAddress,',','.'),1)
From PortfolioProject.dbo.NashvilleHousing



ALTER TABLE NashvilleHousing
Add OwnerSplitAddress Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE NashvilleHousing
Add OwnerSplitCity Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)



ALTER TABLE NashvilleHousing
Add OwnerSplitState Nvarchar(255);

Update NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)



Select *
From PortfolioProject..[NashvilleHousing]



Select Distinct (SoldAsVacant), COUNT(SoldAsVacant)
From PortfolioProject..[NashvilleHousing]
Group By SoldAsVacant
Order By 2

Select SoldAsVacant,
CASE When SoldAsVacant = 'Y' THEN 'YES'
     When SoldAsVacant = 'N' THEN 'NO'
	 ELSE SoldAsVacant
	 END
     
From PortfolioProject..[NashvilleHousing]

Update NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'YES'
     When SoldAsVacant = 'N' THEN 'NO'
	 ELSE SoldAsVacant
	 END



	 WITH ROWNUMCTE As(
	 Select *,
	 ROW_NUMBER() OVER (
	 PARTITION BY ParcelID,
	              PropertyAddress,
				  SalePrice,
				  SaleDate,
				  LegalReference
				  ORDER BY
				  UniqueID) Row_Num

	 
	 From PortfolioProject..[NashvilleHousing]
	 --Order By ParcelID
	 )
	 Select *
	 From ROWNUMCTE
	 Where Row_Num >1
	 --Order By PropertyAddress

	 Select *
	 From PortfolioProject..[NashvilleHousing]

	 ALTER TABLE PortfolioProject..[NashvilleHousing]
	 DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate

	 ALTER TABLE PortfolioProject..[NashvilleHousing]
	 DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate