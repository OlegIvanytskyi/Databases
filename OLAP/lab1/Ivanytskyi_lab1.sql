CREATE TABLE Pharmacy (
	Id NUMBER,
	Staff_id NUMBER,
	Product_id NUMBER,
	Price NUMBER,
	Supplier CHAR(40),
	Quantity NUMBER,
    Invoice_id NUMBER,
	constraint PHARMACY_PK PRIMARY KEY (Id) ENABLE
);

CREATE TABLE Staff (
	Id NUMBER,
	Name CHAR(40),
	E_mail CHAR(40),
	constraint STAFF_PK PRIMARY KEY (Id) ENABLE
);

CREATE TABLE Product (
	Id NUMBER,
	Parent_id NUMBER,
	Product_name CHAR(40),
	constraint PRODUCT_PK PRIMARY KEY (Id) ENABLE
);

CREATE TABLE Invoice (
    Id NUMBER,
    Invoice_date DATE,
    Operation_type CHAR(5),
    Sum NUMBER,
    constraint INVOICE_PK PRIMARY KEY (Id) ENABLE
);

ALTER TABLE Pharmacy ADD CONSTRAINT "Pharmacy_fk0" FOREIGN KEY (Staff_id) REFERENCES Staff(Id);
ALTER TABLE Pharmacy ADD CONSTRAINT "Pharmacy_fk1" FOREIGN KEY (Product_id) REFERENCES Product(Id);
ALTER TABLE Pharmacy ADD CONSTRAINT "Pharmacy_fk2" FOREIGN KEY (Invoice_id) REFERENCES Invoice(Id);
ALTER TABLE Product ADD CONSTRAINT "Product_fk0" FOREIGN KEY (Parent_id) REFERENCES Product(Id);

INSERT INTO Product
VALUES (1, NULL, 'Medicines');
INSERT INTO Product
VALUES (2, NULL, 'Medical_products');
INSERT INTO Product
VALUES (3, NULL, 'Hygiene');
INSERT INTO Product
VALUES (4, 1, 'Metabolism');
INSERT INTO Product
VALUES (5, 4, 'Diabetes');
INSERT INTO Product
VALUES (6, 5, 'Insulin');
INSERT INTO Product
VALUES (7, 4, 'Liver');
INSERT INTO Product
VALUES (8, 7, 'Enzymes');
INSERT INTO Product
VALUES (9, 7, 'Amino_acids');
INSERT INTO Product
VALUES (10, 4, 'Stomach');
INSERT INTO Product
VALUES (11, 10, 'Gastritis');
INSERT INTO Product
VALUES (12, 1, 'Cardiovascular_system');
INSERT INTO Product
VALUES (13, 12, 'Cardio_drugs');
INSERT INTO Product
VALUES (14, 13, 'Arrhythmia');
INSERT INTO Product
VALUES (15, 13, 'Heart_failure');
INSERT INTO Product
VALUES (16, 12, 'Vascular_drugs');
INSERT INTO Product
VALUES (17, 16, 'Varicose_veins');
INSERT INTO Product
VALUES (18, 2, 'Home_equipment');
INSERT INTO Product
VALUES (19, 18, 'Thermometer');
INSERT INTO Product
VALUES (20, 19, 'Mercury_thermometer');
INSERT INTO Product
VALUES (21, 19, 'Electonic_thermometer');
INSERT INTO Product
VALUES (22, 3, 'Hair_care');
INSERT INTO Product
VALUES (23, 22, 'Shampoo');
INSERT INTO Product
VALUES (24, 23, 'Head_and_Shoulders');
INSERT INTO Product
VALUES (25, 23, 'Nivea');
INSERT INTO Product
VALUES (26, 3, 'Mouth_care');
INSERT INTO Product
VALUES (27, 26, 'Tooth_paste');
INSERT INTO Product
VALUES (28, 27, 'Paradontax');
INSERT INTO Product
VALUES (29, 27, 'Colgate');
INSERT INTO Product
VALUES (30, 26, 'Tooth_brush');
INSERT INTO Product
VALUES (31, 30, 'Oral_B');

INSERT INTO Staff
VALUES (1, 'Robert Downey Jr.', 'ironman@gmail.com');
INSERT INTO Staff
VALUES (2, 'Scarlett Johansson', 'blackwidow@gmail.com');
INSERT INTO Staff
VALUES (3, 'Chris Evans', 'captainamerica@gmail.com');
INSERT INTO Staff
VALUES (4, 'Stan Lee', 'crazyman@gmail.com');
INSERT INTO Staff
VALUES (5, 'Scott Lang', 'antman@gmail.com');
INSERT INTO Staff
VALUES (6, 'Sam Wilson', 'uselessguy@gmail.com');
INSERT INTO Staff
VALUES (7, 'Steven Strange', 'sherlock@gmail.com');
INSERT INTO Staff
VALUES (8, 'Chris Hemsworth', 'godofthunder@gmail.com');

INSERT INTO Invoice
VALUES (1, TO_DATE('28-01-18','DD-MM-YY'), 'In', 100000);
INSERT INTO Invoice
VALUES (2, TO_DATE('20-02-18','DD-MM-YY'), 'In', 150000);
INSERT INTO Invoice
VALUES (3, TO_DATE('04-11-17','DD-MM-YY'), 'Out', 25000);
INSERT INTO Invoice
VALUES (4, TO_DATE('13-01-18','DD-MM-YY'), 'In', 130000);
INSERT INTO Invoice
VALUES (5, TO_DATE('01-01-18','DD-MM-YY'), 'Out', 1100);
INSERT INTO Invoice
VALUES (6, TO_DATE('31-12-16','DD-MM-YY'), 'In', 10000);

INSERT INTO Pharmacy
VALUES (1, 1, 6, 200, 'Insulin Ltd.', 20, 1);
INSERT INTO Pharmacy
VALUES (2, 1, 8, 300, 'Better Liver Company', 40, 2);
INSERT INTO Pharmacy
VALUES (3, 2, 9, 450, 'Better Liver Company', 35, 3);
INSERT INTO Pharmacy
VALUES (4, 3, 11, 50, 'Healty Stomach', 400, 1);
INSERT INTO Pharmacy
VALUES (5, 3, 14, 100, 'From Heart For Heart', 50, 4);
INSERT INTO Pharmacy
VALUES (6, 4, 15, 150, 'From Heart For Heart', 10, 5);
INSERT INTO Pharmacy
VALUES (7, 5, 17, 75, 'From Heart For Heart', 15, 1);
INSERT INTO Pharmacy
VALUES (8, 5, 20, 70, 'Homie', 20, 2);
INSERT INTO Pharmacy
VALUES (9, 7, 21, 100, 'Homie', 10, 6);
INSERT INTO Pharmacy
VALUES (10, 8, 24, 25, 'Head and Shoulders', 25, 2);
INSERT INTO Pharmacy
VALUES (11, 8, 25, 30, 'Nivea', 30, 1);
INSERT INTO Pharmacy
VALUES (12, 6, 28, 15, 'Paradontax', 40, 1);
INSERT INTO Pharmacy
VALUES (13, 2, 29, 25, 'Colgate', 40, 3);
INSERT INTO Pharmacy
VALUES (14, 5, 31, 20, 'Oral-B', 50, 6);

SELECT LPAD(Product_name, LENGTH(Product_name)+LEVEL*2-2, '-') AS Product_name
FROM Product
CONNECT BY PRIOR Id = Parent_id
START WITH Parent_id is NULL;