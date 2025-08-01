CREATE DATABASE online_retail_sales;

USE online_retail_sales;

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
    InvoiceNo    VARCHAR(20),
    StockCode    VARCHAR(20),
    Description  NVARCHAR(255),
    Quantity     VARCHAR(10),       -- Allow all values
    InvoiceDate  VARCHAR(50),
    UnitPrice    VARCHAR(20),
    CustomerID   VARCHAR(20),
    Country      VARCHAR(50)
);


