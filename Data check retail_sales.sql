-- Stock code no null
SELECT
InvoiceNo 
FROM retail_sales
WHERE InvoiceNo IS NOT NULL

-- InvoiceDate Varchar into Date format
SELECT TOP 10
CONVERT(DATE, InvoiceDate, 103) as invoice_date_convert
FROM retail_sales

-- Check nulls or negative values in Quantity
SELECT 
Quantity 
FROM retail_sales
WHERE Quantity < 0  or Quantity IS NOT NULL;

-- Check nulls or duplicates in CustomerID
SELECT DISTINCT
CustomerID
FROM retail_sales
WHERE CustomerID IS NULL;

-- Check nulls or unspecific country names
SELECT
Country,
COUNT(*) as country_no
FROM retail_sales
WHERE Country != 'Unspecified'
GROUP BY Country
 
 -- Data standardization and Consistency
 SELECT DISTINCT
 Description,
 COUNT(*) as descrip_no
 FROM retail_sales
 WHERE Description NOT LIKE '%[a-zA-Z0-9 - /]%'
 GROUP BY Description

  SELECT DISTINCT
 Description,
 COUNT(*) as descrip_no
 FROM retail_sales
 WHERE Description  LIKE '% * %'
 GROUP BY Description

 SELECT DISTINCT
UPPER(TRIM (Description)) AS Description,
COUNT(*) as count_no
 FROM retail_sales
 WHERE Description NOT LIKE  '[?*]%'
 GROUP BY Description

-- Check nulls or negative values in unitprice
SELECT
UnitPrice
FROM retail_sales
WHERE UnitPrice < 0 OR UnitPrice IS NULL

-- Datatype changed
ALTER TABLE retail_sales
ALTER COLUMN UnitPrice DECIMAL(10, 2)

ALTER TABLE retail_sales
ALTER COLUMN InvoiceDate DATE;

ALTER TABLE retail_sales
ALTER COLUMN Quantity INT;

-- Create sales column with multiplying quantity * price
SELECT
Quantity,
UnitPrice,
CASE WHEN CAST(Quantity as INT) > 0 AND UnitPrice > 0
	THEN CAST(Quantity AS INT) * UnitPrice
	ELSE 0
END AS Sales
FROM retail_sales

--Check for non-date values
SELECT DISTINCT InvoiceDate
FROM retail_sales
WHERE TRY_CAST(InvoiceDate AS DATE) IS NULL
  AND InvoiceDate IS NOT NULL;

SELECT *,
  TRY_CONVERT(DATETIME, InvoiceDate, 105) AS InvoiceDateFixed
FROM retail_sales;

UPDATE retail_sales
SET InvoiceDate = TRY_CONVERT(DATETIME, InvoiceDate, 105)
WHERE TRY_CONVERT(DATETIME, InvoiceDate, 105) IS NOT NULL;

UPDATE retail_sales
SET InvoiceDate = CAST(TRY_CONVERT(DATETIME, InvoiceDate, 105) AS DATE)
WHERE TRY_CONVERT(DATETIME, InvoiceDate, 105) IS NOT NULL;

select * from  retail_sales;