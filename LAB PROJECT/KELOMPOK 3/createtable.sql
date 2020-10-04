USE RamenShop

-- TABLE CUSTOMER
SELECT * FROM MsCustomer;

CREATE TABLE MsCustomer (	
	customerId CHAR(5) NOT NULL PRIMARY KEY,
	customerName VARCHAR (50),
	customerDob DATE,
	customerGender CHAR(6),
	customerAddress VARCHAR(100),
	customerPhone VARCHAR(50),

	CONSTRAINT cekCustomerId CHECK (customerId LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT cekGender CHECK (customerGender IN('Male','Female')),
	CONSTRAINT cekAddress CHECK (customerAddress LIKE '%Street')	
)

-- TABLE STAFF

CREATE TABLE MsStaff (
	staffId CHAR(5) NOT NULL PRIMARY KEY,
	staffName VARCHAR (50),
	staffGender CHAR(6),
	staffDob DATE,
	staffPhone VARCHAR(50),
	staffAddress VARCHAR(50),
	staffSalary INT,

	CONSTRAINT cekStaffId CHECK (staffId LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT cekStaffGender CHECK (staffGender IN('Male','Female')),
	CONSTRAINT cekStaffAddress CHECK (staffAddress LIKE '%Street'),
	CONSTRAINT cekStaffSalary CHECK ((staffSalary)>=1500000 OR (staffSalary)<=3500000) 
)

-- TABLE RAMEN

CREATE TABLE MsRamen (
	ramenId CHAR(5) NOT NULL PRIMARY KEY,
	ramenName VARCHAR(50), 
	ramenPrice INT,
	CONSTRAINT cekramenId CHECK (ramenId LIKE 'RA[0-9][0-9][0-9]'),
	CONSTRAINT cekramenName CHECK (ramenName LIKE '% %')
)

-- TABLE INGREDIENT

CREATE TABLE MsIngredient (
	ingredientId CHAR(5) NOT NULL PRIMARY KEY,
	ingredientName VARCHAR(50),
	ingredientStock INT,
	CONSTRAINT cekingredientId CHECK (ingredientId LIKE 'RI[0-9][0-9][0-9]')
)

-- TABLE SUPPLIER

CREATE TABLE MsSupplier (
	supplierId CHAR(5) NOT NULL PRIMARY KEY,
	supplierName VARCHAR(50),
	supplierAddress VARCHAR (100),
	supplierPhone VARCHAR(50),
	CONSTRAINT cekSupplierId CHECK (supplierId LIKE 'SP[0-9][0-9][0-9]' ),
	CONSTRAINT cekSupplierName CHECK (LEN(supplierName)>=5 OR (supplierName) <=50 ),
	CONSTRAINT cekSupplierAddress CHECK (supplierAddress LIKE '%Street')
)

-------------------------------------------------------------------------------------------------------------------

-- RECIPE DETAIL

CREATE TABLE RecipeDetail (
	ramenId CHAR(5),
	ingredientId CHAR(5),
	quantityIngredient INT,

	FOREIGN KEY (ramenId) REFERENCES MsRamen(ramenId),
	FOREIGN KEY (ingredientId) REFERENCES MsIngredient(ingredientId)
)

-- SALES TRANSACTION

CREATE TABLE SalesTransaction (
	salesTransactionId CHAR(5) NOT NULL PRIMARY KEY,
	customerId CHAR(5),
	staffId CHAR(5),
	transactionDate DATE,

	CONSTRAINT cekSalesTransactionId CHECK (salesTransactionId LIKE 'SL[0-9][0-9][0-9]'),
	FOREIGN KEY (customerId) REFERENCES MsCustomer(customerId),
	FOREIGN KEY (staffId) REFERENCES MsStaff(staffId)
)

-- SALES TRANSACTION DETAIL

CREATE TABLE STDetail (
	salesTransactionId CHAR(5) NOT NULL,
	ramenId CHAR(5),
	quantityRamen INT,

	FOREIGN KEY (salesTransactionId) REFERENCES salesTransaction(salesTransactionId),
	FOREIGN KEY (ramenId) REFERENCES MsRamen(ramenId)
)

-- PURCHASE TRANSACTION

CREATE TABLE PurchaseTransaction (
	purchaseTransactionId CHAR(5) NOT NULL PRIMARY KEY,
	staffId CHAR(5),
	supplierId CHAR(5),
	supplytransactionDate DATE,

	CONSTRAINT cekpTransactionId CHECK (purchaseTransactionId LIKE 'PU[0-9][0-9][0-9]'),
	FOREIGN KEY (staffId) REFERENCES MsStaff(staffId),
	FOREIGN KEY (supplierId) REFERENCES MsSupplier(supplierId),
)

-- PURCHASE TRANSACTION DETAIL

CREATE TABLE PTDetail (
	purchaseTransactionId CHAR(5) NOT NULL,
	ingredientId CHAR(5),
	purchaseQuantityIngredient INT,

	FOREIGN KEY (purchaseTransactionId) REFERENCES purchaseTransaction(purchaseTransactionId),
	FOREIGN KEY (ingredientId) REFERENCES MsIngredient(ingredientId)
)