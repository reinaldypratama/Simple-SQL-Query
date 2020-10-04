USE RamenShop

SELECT * FROM MsCustomer
SELECT * FROM SalesTransaction 

-- 1. SALES TRANSACTION

BEGIN TRANSACTION

-- TRANSACTION

SELECT * FROM SalesTransaction;

SELECT [Total] = SUM(t.quantityRamen * r.ramenPrice)
FROM SalesTransaction s
JOIN MsCustomer c
ON s.customerId = c.customerId
JOIN STDetail t
ON s.salesTransactionId = t.salesTransactionId
JOIN MsRamen r
ON t.ramenId = r.ramenId
WHERE s.customerId = 'CU005' AND  s.salesTransactionId = 'SL002' AND t.RamenId = 'RA003' 

-- SALES TRANSACTION

BEGIN TRANSACTION

UPDATE MsIngredient
SET MsIngredient.ingredientStock -= RecipeDetail.quantityIngredient
FROM RecipeDetail
WHERE MsIngredient.ingredientId = RecipeDetail.ingredientId AND (RecipeDetail.ingredientId = 'RI007')

SELECT * FROM MsIngredient WHERE ingredientId = 'RI007'

ROLLBACK

-- 2. PURCHASE STOCK

BEGIN TRANSACTION

UPDATE MsIngredient
SET MsIngredient.ingredientStock += PTDetail.purchaseQuantityIngredient 
FROM PTDetail
WHERE MsIngredient.ingredientId = PTDetail.ingredientId AND (PTDetail.ingredientId ='RI003')

SELECT * FROM MsIngredient WHERE ingredientId = 'RI003'

ROLLBACK
