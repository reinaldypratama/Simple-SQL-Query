USE RamenShop;

-- MASTER TABLE

SELECT * FROM MsCustomer;

INSERT INTO MsCustomer (customerId, customerName, customerDob, customerGender, customerAddress, customerPhone)
VALUES
('CU001', 'Francis Ariyanto', '2000-12-20', 'Male', 'Alam Sutera Street', '081861473999'),
('CU002', 'Cahaya Fanny Rachman', '1986-03-11', 'Female', 'Jemur Andayani Street', '081841646299'),
('CU003', 'Inge Yuliani Tan', '2001-07-31', 'Female', 'Jababeka 11 Kawasan Industri Street', '081564020788'),
('CU004', 'Sudomo Sudirman Kartawijaya', '1973-9-14', 'Male', 'Maulana Yusuf 8 Street', '081455616754'),
('CU005', 'Glenna Sinta Sutedja', '1992-9-6', 'Female', 'Panyawungan 48 Street', '081435864878'),
('CU006', 'Djaja Budi', '1987-9-28', 'Male', 'Tanjung Mas Raya Street', '081319025888'),
('CU007', 'Devi Yuwono', '1992-4-19', 'Female', 'Jend Sudirman Kav 29-31 Street', '081457327112'),
('CU008', 'Handoko Gunawan', '1996-12-13', 'Male', 'Sahadewa No 11 Street', '082727418756'),
('CU009', 'Adi Wibawa Hardja', '1996-6-13', 'Male', 'KH Wahid Hasyim 80 Street', '081841430823'),
('CU010', 'Mega Cahya Kusuma', '1976-8-19', 'Female', 'Pondok Karya Street', '081342184333');

SELECT * FROM MsStaff;

INSERT INTO MsStaff (staffId, staffName, staffGender, staffDob, staffPhone, staffAddress, staffSalary)
VALUES
('ST001', 'Deryl Dimas Darmawan', 'Male', '2000-03-19', '082275614622', 'Alam Sutera Street', 1500000),
('ST002', 'Ivan Putra', 'Male', '2001-03-29', '082730865888', 'Panglima Polim Street', 2900000),
('ST003', 'Adrian Hidayat', 'Male', '2001-10-06', '082422112777', 'Kavling Polri Street', 3000000),
('ST004', 'Adriel Coa', 'Male', '2001-04-10', '084351309833', 'Bendungan Hilir Street', 2500000),
('ST005', 'Yosegon Sutanto', 'Male', '2001-11-20', '081830747666', 'Gading Serpong Street', 2800000),
('ST006', 'Winston Tan', 'Male', '2001-10-19', '081582805766', 'Taman Sentosa Indah Street', 2300000),
('ST007', 'Sri Fanny Atmadjaja', 'Female', '1989-3-11', '081310232911', 'Rasuna Said Kav 8-9 Street', 2000000),
('ST008', 'Eric Wijaya', 'Male', '2001-10-14', '081666036881', 'Sisingamangaraja No 2 Street', 2100000),
('ST009', 'Sharon Ongah', 'Female', '2001-09-13', '081666036881', 'Hang Tuah Kav 2-3 Street', 2450000),
('ST010', 'Jason Aditama', 'Male', '2001-10-20', '080214414054', 'Pantai Mutiara Blok A 5 Street', 2550000);

SELECT * FROM MsSupplier;

INSERT INTO MsSupplier (supplierId, supplierName, supplierAddress, supplierPhone)
VALUES
('SP001', 'Indofood', 'Duta Indah Raya Kav 1-10 Street', '0218464611'),
('SP002', 'Gudang Garam', 'Jend Gatot Subroto Kav 35-36 Street', '0217820465'),
('SP003', 'Greenfields', 'Greenville Indah Kav 2-3 Street', '0213850525'),
('SP004', 'OrangTua Group', 'Palmerah Kav 4-5 Street', '0218304405'),
('SP005', 'Sampoerna', 'KH Wahid Hasyim 3 Street', '0213901201'),
('SP006', 'Unilever Indonesia', 'Danau Semayang Street', '0216125581'),
('SP007', 'Tenaga Baru', 'Yos Sudarso Kav 6 Street', '0218012231'),
('SP008', 'Sinar Sakti', 'Industri Kav 2-3 Street', '0216542730'),
('SP009', 'Soeryasakti Aneka', 'Serpong Raya Kav 1-10 Street', '02165861518'),
('SP010', 'ANC Group', 'Jend Sudirman Kav 1-20 Street', '02165861518');

SELECT * FROM MsRamen;

INSERT INTO MsRamen (ramenId, ramenName, ramenPrice)
VALUES
('RA001', 'Tsukemen Ramen', 50000),
('RA002', 'Champon Ramen', 45000),
('RA003', 'Hakata Ramen', 60000),
('RA004', 'Tonkotsu Ramen', 45000),
('RA005', 'Hokkaido Ramen', 40000),
('RA006', 'Buta Ramen', 55000),
('RA007', 'Curry Ramen', 50000),
('RA008', 'Kagoshima Ramen', 50000),
('RA009', 'Hiyashi Ramen', 50000),
('RA010', 'Naruto Ramen', 50000);

SELECT * FROM MsIngredient;

INSERT INTO MsIngredient (ingredientId, ingredientName, ingredientStock)
VALUES
('RI001', 'Green Onion', 10),
('RI002', 'Chasiu', 20),
('RI003', 'Chicken', 50),
('RI004', 'Egg', 10),
('RI005', 'Bean', 50),
('RI006', 'Naruto', 40),
('RI007', 'Seaweed', 60),
('RI008', 'Butter', 80),
('RI009', 'Olive Oil', 5),
('RI010', 'Corn', 10);

SELECT * FROM RecipeDetail;

INSERT INTO RecipeDetail (ramenId, ingredientId, quantityIngredient)
VALUES
('RA001', 'RI001', 5),
('RA001', 'RI008', 3),
('RA002', 'RI009', 5),
('RA003', 'RI007', 2),
('RA004', 'RI006', 1),
('RA005', 'RI001', 1),
('RA006', 'RI007', 3),
('RA007', 'RI002', 8),
('RA008', 'RI004', 2),
('RA009', 'RI003', 5),
('RA010', 'RI010', 1);