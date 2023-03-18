Select *
From PortfolioProject..[NashvilleHousing]


Select
SUBSTRING (OwnerName, 1, CHARINDEX(',', OwnerName)) as OwnerFirstName
,SUBSTRING (OwnerName, CHARINDEX(',', OwnerName)+1, LEN(OwnerName)) as OwnerLastName

From PortfolioProject..[NashvilleHousing]


ALTER TABLE NashvilleHousing
--Add OwnerNameSplit Nvarchar(255);
Add OwnerFirstNameSplit Nvarchar(255);

Update NashvilleHousing
SET OwnerFirstName = SUBSTRING(OwnerFirstName, 1, CHARINDEX(',', OwnerFirstName) -1 )


ALTER TABLE NashvilleHousing
--Add OwnerFirstNameSplit
Add OwnerLastNameSplit
 Nvarchar(255);

Update NashvilleHousing
SET OwnerLastName = SUBSTRING (OwnerLastName
, CHARINDEX(',', OwnerLastName
) + 1, LEN(OwnerLastName))

Select *
From PortfolioProject..[NashvilleHousing]






Select OwnerName
From PortfolioProject..[NashvilleHousing]

Select
PARSENAME(REPLACE(OwnerName,',','.'),3),
PARSENAME(REPLACE(OwnerName,',','.'),2),
PARSENAME(REPLACE(OwnerName,',','.'),1)
From PortfolioProject.dbo.NashvilleHousing



ALTER TABLE NashvilleHousing
Add OwnerFirstNameSplit Nvarchar(255);

Update NashvilleHousing
SET OwnerFirstNameSplit = PARSENAME(REPLACE(OwnerName, ',', '.') , 3)


ALTER TABLE NashvilleHousing
Add OwnerLastNameSplit Nvarchar(255);

Update NashvilleHousing
SET OwnerLastNameSplit = PARSENAME(REPLACE(OwnerName, ',', '.') , 2)



--ALTER TABLE NashvilleHousing
--Add OwnerSplitState Nvarchar(255);

--Update NashvilleHousing
--SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)



Select *
From PortfolioProject..[NashvilleHousing]



ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN NewOwnerNameSplitFirst, NewOnwerNameSplitLast
