SELECT COUNT(*) AS TotalPOs
FROM PurchaseOrders;

SELECT COUNT(*) AS TotalSuppliers
FROM Suppliers;

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PurchaseOrders'
ORDER BY ORDINAL_POSITION;

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PurchaseOrders'
ORDER BY ORDINAL_POSITION;

INSERT INTO PurchaseOrders
(
    PONumber,
    PODate,
    SupplierID,
    Category,
    Quantity,
    UnitPrice,
    POValue,
    ExpectedDelivery,
    ActualDelivery,
    Status,
    DeliveryCheck
)
SELECT
    PO_Number,
    PO_Date,
    Supplier_ID,
    Category,
    Quantity,
    Unit_Price,
    PO_Value,
    Expected_Delivery,
    Actual_Delivery,
    Status,
    Delivery_Check
FROM PurchaseOrders_Import;

SELECT COUNT(*) AS TotalPOs
FROM PurchaseOrders;

SELECT
    s.SupplierName,
    SUM(p.POValue) AS TotalSpend
FROM PurchaseOrders p
INNER JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY TotalSpend DESC;

SELECT
    Category,
    SUM(POValue) AS TotalSpend
FROM PurchaseOrders
GROUP BY Category
ORDER BY TotalSpend DESC;

SELECT
    YEAR(PODate) AS PO_Year,
    MONTH(PODate) AS PO_Month,
    SUM(POValue) AS TotalSpend
FROM PurchaseOrders
GROUP BY
    YEAR(PODate),
    MONTH(PODate)
ORDER BY
    PO_Year,
    PO_Month;

    EXEC GetSpendByCategory;

    EXEC GetPendingPOsByAge;