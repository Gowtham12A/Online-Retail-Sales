CREATE VIEW sales_data AS (
SELECT
InvoiceNo as invoice_no,
TRIM(Stockcode) AS stock_code,
UPPER(TRIM(Description)) AS description,
InvoiceDate as invoice_date,
Quantity  AS quantity,
UnitPrice as price,
CASE WHEN CAST(Quantity as INT) > 0 AND UnitPrice > 0
	THEN CAST(Quantity AS INT) * UnitPrice
	ELSE 0
END AS Sales,
CustomerID  as customer_id,
Country as country
FROM retail_sales
WHERE Country != 'Unspecified' 
AND InvoiceNo IS NOT NULL
AND Quantity IS NOT NULL
AND Description NOT LIKE  '[?*]%'
AND Quantity > 0  or Quantity IS NOT NULL
AND UnitPrice < 0 OR UnitPrice IS NOT NULL
AND CustomerID IS NOT NULL
AND Country != 'Unspecified'
);

SELECT * FROM sales_data;
