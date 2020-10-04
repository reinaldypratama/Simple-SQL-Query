USE RamenShop;

--1
SELECT r.ramenId AS [RamenId], r.ramenName AS [RamenName], (CAST(COUNT(i.ingredientId) AS VARCHAR) + ' Ingredients') AS [Total Ingredient]
FROM MsRamen r
JOIN RecipeDetail rd
ON r.ramenId = rd.ramenId
JOIN MsIngredient i
ON rd.ingredientId = i.ingredientId
WHERE i.ingredientStock < 25 
GROUP BY r.ramenid, r.ramenName
HAVING COUNT(i.ingredientId) > 1;

-- EITHER ONE

SELECT r.ramenId AS [RamenID], r.ramenName AS [RamenName], (CAST(ingredientStock AS VARCHAR) + ' Ingredients') AS [Total Ingredient]
FROM MsRamen r, MsIngredient i, RecipeDetail rd
WHERE r.ramenId = rd.ramenId AND rd.ingredientId = i.ingredientId AND i.ingredientStock < 25 AND i.ingredientStock > 0;

--2
SELECT COUNT(ST.salesTransactionId) AS [NumberOfTransaction], C.customerName AS [CustomerName], LEFT(C.customerGender,1) AS [CustomerGender], Staff.staffName AS [StaffName]
FROM SalesTransaction ST
JOIN MsCustomer C
ON ST.customerId = C.customerId
JOIN MsStaff Staff
ON ST.staffId = Staff.staffId
WHERE Staff.staffGender = 'Female'
GROUP BY C.customerName, C.customerGender, Staff.staffName
HAVING (SUM(YEAR(customerDob) - YEAR(staffDob)) < 5)

--3
SELECT CONVERT(VARCHAR, supplytransactionDate, 105) AS [Purchase Date], st.staffName AS [StaffName], sp.supplierName AS [SupplierName], 
(CAST(purchaseQuantityIngredient AS VARCHAR) + ' Ingredients') AS [Total Ingredient], (purchaseQuantityIngredient + ingredientStock) AS [Total Quantity]
FROM PurchaseTransaction pt
JOIN MsStaff st
ON pt.staffId = st.staffId
JOIN MsSupplier sp
ON pt.supplierId = sp.supplierId
JOIN PTDetail ptd
ON pt.purchaseTransactionId = ptd.purchaseTransactionId
JOIN MsIngredient i
ON ptd.ingredientId = i.ingredientId
WHERE YEAR(supplytransactionDate) = 2016 AND LEN(supplierName) < 15;

-- EITHER ONE

SELECT CONVERT(VARCHAR, supplytransactionDate, 105) AS [Purchase Date], st.staffName AS [StaffName], sp.supplierName AS [SupplierName], 
(CAST(COUNT(ptd.ingredientId) AS VARCHAR) + ' Ingredients') AS [Total Ingredient], SUM(purchaseQuantityIngredient) AS [Total Quantity]
FROM PurchaseTransaction pt
JOIN MsStaff st
ON pt.staffId = st.staffId
JOIN MsSupplier sp
ON pt.supplierId = sp.supplierId
JOIN PTDetail ptd
ON pt.purchaseTransactionId = ptd.purchaseTransactionId
WHERE YEAR(supplytransactionDate) = 2016 AND LEN(supplierName) < 15
GROUP BY supplytransactionDate, staffName, supplierName;

--4
SELECT C.customerName, C.customerPhone, DATENAME(WEEKDAY, ST.transactionDate) AS [SALES DAY], COUNT(R.ramenName) AS [Ramen Sold]
FROM SalesTransaction ST
JOIN MsCustomer C
ON ST.customerId = C.customerId
JOIN STDetail STD
ON ST.salesTransactionId = STD.salesTransactionId
JOIN MsRamen R
ON STD.ramenId = R.ramenId
WHERE MONTH(ST.transactionDate) = 3
GROUP BY C.customerName, C.customerPhone, ST.transactionDate
HAVING SUM(STD.quantityRamen) > 10

--5
SELECT pt.purchaseTransactionId AS [PurchaseID], ingredientName AS [RamenIngredientName], purchaseQuantityIngredient AS [Quantity], s.staffName AS [StaffName],
STUFF(s.staffPhone, 1, 1, '+62') AS [Staff Phone], ('Rp. ' + CAST(s.staffSalary AS VARCHAR)) AS [Staff Salary]
FROM PurchaseTransaction pt
JOIN PTDetail ptd
ON pt.purchaseTransactionId = ptd.purchaseTransactionId
JOIN MsStaff s
ON pt.staffId = s.staffId
JOIN MsIngredient i
ON ptd.ingredientId = i.ingredientId
WHERE YEAR(supplytransactionDate) = 2017 AND
staffSalary >
(
	SELECT AVG(staffSalary) 
	FROM MsStaff
);

-- EITHER ONE

SELECT pt.purchaseTransactionId AS [PurchaseID], ingredientName AS [RamenIngredientName], purchaseQuantityIngredient AS [Quantity], s.staffName AS [StaffName],
STUFF(s.staffPhone, 1, 1, '+62') AS [Staff Phone], ('Rp. ' + CAST(s.staffSalary AS VARCHAR)) AS [Staff Salary]
FROM PurchaseTransaction pt
JOIN PTDetail ptd
ON pt.purchaseTransactionId = ptd.purchaseTransactionId
JOIN MsStaff s
ON pt.staffId = s.staffId
JOIN MsIngredient i
ON ptd.ingredientId = i.ingredientId, (
	SELECT AVG(staffSalary) AS average
	FROM MsStaff
) AS x
WHERE YEAR(supplytransactionDate) = 2017 
AND staffSalary > x.average;

--6
SELECT REPLACE(S.staffId, LEFT(S.staffId, 2), 'Staff ') AS [StaffId] , S.staffName AS [StaffName], FORMAT(ST.transactionDate,'MM dd,yyyy') AS [Sales Date]
FROM MsStaff S
JOIN SalesTransaction ST
ON S.staffId = ST.staffId
WHERE S.staffSalary =
(
	SELECT COUNT(staffSalary) FROM MsStaff
                WHERE staffName LIKE '% % %'
                GROUP BY staffSalary
                HAVING staffSalary < AVG(staffSalary)
)

-- EITHER ONE

SELECT REPLACE(ms.staffId, LEFT(ms.staffId, 2), 'Staff ') AS [StaffId], ms.staffName, st.transactionDate, std.quantityRamen
FROM MsStaff ms
JOIN SalesTransaction st
ON ms.staffId = st.staffId
JOIN STDetail std
ON st.salesTransactionId = std.salesTransactionId,
(
	SELECT AVG(staffSalary) AS average
	FROM MsStaff
) AS x
WHERE ms.staffSalary > x.average
AND ms.staffName LIKE '% % %';

--7
SELECT COUNT(std.ramenId) AS [Total Ramen Sold],
REVERSE(SUBSTRING(REVERSE(c.customerName), 1, CHARINDEX(' ', REVERSE(c.customerName)))) AS [Last Name], s.staffName AS [StaffName], st.transactionDate AS [SalesDate]
FROM SalesTransaction st
JOIN STDetail std
ON st.salesTransactionId = std.salesTransactionId
JOIN MsCustomer c
ON st.customerId = c.customerId
JOIN MsStaff s
ON st.staffId = s.staffId,
(
	SELECT AVG(quantityRamen) AS average
	FROM STDetail
) AS x
WHERE quantityRamen < x.average
AND LEN(customerName) > 15
GROUP BY st.salesTransactionId, c.customerName, s.staffName, st.transactionDate;

-- GET LAST NAME
SELECT staffName, REVERSE(SUBSTRING(REVERSE(StaffName), 1, CHARINDEX(' ', REVERSE(staffName)))) AS [Last Name]
FROM MsStaff

-- ANOTHER ONE

SELECT staffName,
LEFT(staffName, CHARINDEX(' ', staffName)) AS FirstName,
CASE WHEN CHARINDEX(' ', staffName) <> LEN(staffName) - CHARINDEX(' ', REVERSE(staffName)) + 1 THEN
SUBSTRING(staffName, CHARINDEX(' ', staffName) + 1, LEN(staffName) - CHARINDEX(' ', REVERSE(staffName))-CHARINDEX(' ', staffName))
END AS Middle,
RIGHT(staffName, CHARINDEX(' ', REVERSE(staffName))) AS LastName
FROM MsStaff

--8
SELECT st.salesTransactionId, c.customerName, c.customerGender, r.ramenName, (CAST((r.ramenPrice * std.quantityRamen) AS VARCHAR) + ' IDR') AS [Total Price]
FROM SalesTransaction st
JOIN MsCustomer c
ON st.customerId = c.customerId
JOIN STDetail std
ON st.salesTransactionId = std.salesTransactionId
JOIN MsRamen r
ON std.ramenId = r.ramenId,
(
	SELECT MIN(ramenPrice) AS minimum
	FROM MsRamen
) AS x
WHERE r.ramenPrice > x.minimum
AND
YEAR(GETDATE()) - YEAR(c.customerDob) < 21

-- 9
CREATE VIEW ViewSales AS
SELECT c.customerName, COUNT(st.salesTransactionId) AS [Number of Sales], SUM(ramenPrice * quantityRamen) AS [Total Price]
FROM MsCustomer c
JOIN SalesTransaction st
ON c.customerId = st.customerId
JOIN STDetail std
ON st.salesTransactionId = std.salesTransactionId
JOIN MsRamen r
ON std.ramenId = r.ramenId
WHERE YEAR(st.transactionDate) < 2017 AND c.customerAddress LIKE 'Pasar%'
GROUP BY c.customerName;

--10
CREATE VIEW PurchaseDetail AS
SELECT CAST(SUM(STD.quantityRamen) AS VARCHAR) + ' pcs' AS [PURCHASE DETAIL],
COUNT(st.salesTransactionId) AS [Number of transaction],
MSP.supplierName, MST.staffName
FROM STDetail STD
JOIN SalesTransaction ST
ON STD.salesTransactionId = ST.salesTransactionId
JOIN MsStaff MST
ON ST.staffId = MST.staffId
JOIN PurchaseTransaction PT
ON MST.staffId = PT.staffId
JOIN MsSupplier MSP
ON PT.supplierId = MSP.supplierId
WHERE YEAR(ST.transactionDate) = 2016 and MST.staffGender = 'Male'
GROUP BY MSP.supplierName, MST.staffName;