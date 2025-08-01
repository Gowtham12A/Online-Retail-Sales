-- Data reporting

-- Year wise sales 
SELECT 
YEAR(invoice_date) as year_wise,
SUM(Sales) as Total_sales
FROM sales_data
GROUP BY YEAR(invoice_date);

-- Month wise sales
SELECT 
FORMAT(CAST(invoice_date AS DATE), 'MMM') as month_wise,
SUM(Sales) as Total_sales
FROM sales_data
GROUP BY FORMAT(CAST(invoice_date as DATE), 'MMM')
ORDER BY Total_sales DESC

-- Country wise sales
SELECT TOP 5
country as Country,
SUM(Sales) as Total_sales
FROM sales_data
GROUP BY country
ORDER BY Total_sales DESC;

--TOP 10 Customers with highest sales AND BOTTOM 10 customers with lowest sales
SELECT 
* 
FROM (
	SELECT TOP 10
		customer_id as CustomerID,
		SUM(Sales) as Total_sales,
		'Top 10' as Sales_rank -- Top 10 customers
		FROM sales_data
		WHERE customer_id IS NOT NULL
		GROUP BY customer_id
		ORDER BY Total_sales DESC
) AS Top_customers
UNION ALL
SELECT 
*
FROM (
	SELECT TOP 10
		customer_id as CustomerID,
		SUM(Sales) as Total_sales,
		'Bottom 10' as Sales_rank -- Bottom 10 customers
		FROM sales_data
		WHERE customer_id IS NOT NULL
		GROUP BY customer_id
		ORDER BY Total_sales ASC
) AS Bottom_customers ;