USE RamenShop;

-- TRANSACTION DETAIL TABLE

SELECT * FROM STDetail;

INSERT INTO STDetail (salesTransactionId, ramenId, quantityRamen)
VALUES
('SL001', 'RA009', 2),
('SL001', 'RA006', 1),
('SL001', 'RA004', 1),
('SL002', 'RA001', 1),
('SL002', 'RA003', 2),
('SL003', 'RA010', 4),
('SL004', 'RA004', 1),
('SL004', 'RA007', 2),
('SL005', 'RA001', 3),
('SL006', 'RA002', 2),
('SL007', 'RA008', 1),
('SL007', 'RA002', 1),
('SL007', 'RA003', 1),
('SL008', 'RA007', 2),
('SL009', 'RA002', 4),
('SL010', 'RA007', 2),
('SL011', 'RA008', 3),
('SL012', 'RA007', 1),
('SL012', 'RA001', 1),
('SL013', 'RA005', 1),
('SL013', 'RA003', 2),
('SL014', 'RA009', 1),
('SL014', 'RA003', 1),
('SL014', 'RA004', 1),
('SL015', 'RA008', 1),
('SL015', 'RA002', 1),
('SL015', 'RA003', 5),
('SL015', 'RA006', 10);

SELECT * FROM PTDetail;

INSERT INTO PTDetail (purchaseTransactionId, ingredientId, purchaseQuantityIngredient)
VALUES
('PU001', 'RI005', 10),
('PU001', 'RI006', 22),
('PU001', 'RI001', 38),
('PU002', 'RI003', 42),
('PU002', 'RI002', 17),
('PU002', 'RI009', 49),
('PU003', 'RI010', 7),
('PU003', 'RI005', 20),
('PU004', 'RI008', 47),
('PU005', 'RI001', 2),
('PU005', 'RI010', 20),
('PU005', 'RI002', 30),
('PU006', 'RI004', 14),
('PU007', 'RI006', 21),
('PU008', 'RI010', 50),
('PU009', 'RI003', 15),
('PU009', 'RI004', 30),
('PU010', 'RI001', 45),
('PU011', 'RI006', 49),
('PU012', 'RI002', 28),
('PU013', 'RI004', 38),
('PU014', 'RI006', 10),
('PU014', 'RI001', 50),
('PU015', 'RI007', 37),
('PU015', 'RI004', 57),
('PU015', 'RI006', 20),
('PU016', 'RI002', 57),
('PU016', 'RI003', 20),
('PU017', 'RI005', 3),
('PU017', 'RI006', 15),
('PU018', 'RI007', 30);