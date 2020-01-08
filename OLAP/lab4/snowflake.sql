--CLIENT
CREATE SEQUENCE CLIENT_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE CLIENT(
    ID_CLIENT NUMBER PRIMARY KEY,
    CLIENT_NAME VARCHAR2(30) NOT NULL,
    PHONE VARCHAR2(10) CHECK(REGEXP_LIKE(PHONE, '^\d{10}$')) NOT NULL UNIQUE
);

INSERT INTO CLIENT
VALUES(CLIENT_SEQ.NEXTVAL, 'IVANYTSKYI OLEG', '0508771144');
INSERT INTO CLIENT
VALUES(CLIENT_SEQ.NEXTVAL, 'OMELCHENKO INNA', '0987671144');
INSERT INTO CLIENT
VALUES(CLIENT_SEQ.NEXTVAL, 'GREG MAYERS', '9876543144');
INSERT INTO CLIENT
VALUES(CLIENT_SEQ.NEXTVAL, 'THOMAS EDISON', '0508456789');

--PRODUCT
CREATE SEQUENCE PRODUCT_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE PRODUCT(
    ID_PRODUCT NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30) NOT NULL,
    ID_PRODUCT_TYPE NUMBER NOT NULL,
    PRICE NUMBER NOT NULL
);

INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'INSULIN', 1, 100);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'CARDIO DRUGS', 1, 250);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'AMINO ACIDS', 1, 150);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'ENZYMES', 1, 75);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'SHAMPOO', 2, 25);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'TOOTH PASTE', 2, 20);
INSERT INTO PRODUCT
VALUES(PRODUCT_SEQ.NEXTVAL, 'THERMOMETER', 3, 80);

--PRODUCT TYPE
CREATE SEQUENCE PRODUCT_TYPE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE PRODUCT_TYPE(
    ID_PRODUCT_TYPE NUMBER PRIMARY KEY,
    PRODUCT_TYPE_NAME VARCHAR2(30) NOT NULL,
    DESCRIPTION VARCHAR2(50) NOT NULL
);

INSERT INTO PRODUCT_TYPE
VALUES(PRODUCT_TYPE_SEQ.NEXTVAL, 'MEDICINES', 'MEDICINES');
INSERT INTO PRODUCT_TYPE
VALUES(PRODUCT_TYPE_SEQ.NEXTVAL, 'HYGIENE', 'HYGIENE');
INSERT INTO PRODUCT_TYPE
VALUES(PRODUCT_TYPE_SEQ.NEXTVAL, 'MEDICAL PRODUCTS', 'MEDICAL PRODUCTS');

ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_FK0 FOREIGN KEY (ID_PRODUCT_TYPE) REFERENCES PRODUCT_TYPE(ID_PRODUCT_TYPE);

--SUPPLIER
CREATE SEQUENCE SUPPLIER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE SUPPLIER(
    ID_SUPPLIER NUMBER PRIMARY KEY,
    SUPPLIER_NAME VARCHAR2(30) NOT NULL,
    ADDRESS VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(10) CHECK(REGEXP_LIKE(PHONE, '^\d{10}$')) NOT NULL UNIQUE,
    E_MAIL VARCHAR2(30) CHECK(REGEXP_LIKE(E_MAIL, '^.+@.+$')) NOT NULL UNIQUE
);

INSERT INTO SUPPLIER
VALUES(SUPPLIER_SEQ.NEXTVAL, 'MEDICOM', 'KYIV, 17 ST. 17', '0508884443', 'MEDICOM@UKR.NET');
INSERT INTO SUPPLIER
VALUES(SUPPLIER_SEQ.NEXTVAL, 'ULTRAMED', 'KHARKIV, LOBSTER ST. 17-A', '0920887343', 'ULTRAMED@UKR.NET');
INSERT INTO SUPPLIER
VALUES(SUPPLIER_SEQ.NEXTVAL, 'HEALTHUA', 'KYIV, TOWN AVE. 174/4', '0509387143', 'HEALTHUA@UKR.NET');

--FEEDBACK
CREATE SEQUENCE FEEDBACK_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE FEEDBACK(
    ID_FEEDBACK NUMBER PRIMARY KEY,
    HAS_LEFT NUMBER NOT NULL,
    CONTENT VARCHAR2(50)
);

INSERT INTO FEEDBACK
VALUES(FEEDBACK_SEQ.NEXTVAL, 1, 'RUDE STAFF');
INSERT INTO FEEDBACK
VALUES(FEEDBACK_SEQ.NEXTVAL, 0, '');
INSERT INTO FEEDBACK
VALUES(FEEDBACK_SEQ.NEXTVAL, 0, '');
INSERT INTO FEEDBACK
VALUES(FEEDBACK_SEQ.NEXTVAL, 1, 'EVERYTHING WAS PERFECT');

--PHARMACY
CREATE SEQUENCE PHARMACY_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE PHARMACY(
    ID_PHARMACY NUMBER PRIMARY KEY,
    ADDRESS VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(10) CHECK(REGEXP_LIKE(PHONE, '^\d{10}$')) NOT NULL UNIQUE
);

INSERT INTO PHARMACY
VALUES(PHARMACY_SEQ.NEXTVAL, 'KYIV LISOVA ST. 12', '0500500500');
INSERT INTO PHARMACY
VALUES(PHARMACY_SEQ.NEXTVAL, 'KYIV BANDERA AVE. 111', '0111123500');
INSERT INTO PHARMACY
VALUES(PHARMACY_SEQ.NEXTVAL, 'KYIV SHEVCHENKO BLV. 12/65', '0507858475');

--PAYMENT TYPE
CREATE SEQUENCE PAYMENT_TYPE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE PAYMENT_TYPE(
    ID_PAYMENT_TYPE NUMBER PRIMARY KEY,
    PAYMENT_TYPE_NAME VARCHAR2(30) NOT NULL,
    DESCRIPTION VARCHAR2(50) NOT NULL
);

INSERT INTO PAYMENT_TYPE
VALUES(PAYMENT_TYPE_SEQ.NEXTVAL, 'CURRENCY', 'PHYSICAL MONEY TRANSFER');
INSERT INTO PAYMENT_TYPE
VALUES(PAYMENT_TYPE_SEQ.NEXTVAL, 'CREDIT CARD', 'DIGITAL MONEY TRANSFER');

--STAFF
CREATE SEQUENCE STAFF_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE STAFF(
    ID_STAFF NUMBER PRIMARY KEY,
    STAFF_NAME VARCHAR2(30) NOT NULL,
    ID_POSITION NUMBER NOT NULL,
    E_MAIL VARCHAR2(30) CHECK(REGEXP_LIKE(E_MAIL, '^.+@.+$')) NOT NULL UNIQUE,
    PHONE VARCHAR2(10) CHECK(REGEXP_LIKE(PHONE, '^\d{10}$')) NOT NULL UNIQUE
);

INSERT INTO STAFF
VALUES(STAFF_SEQ.NEXTVAL, 'LARRY EMERSON', 1, 'LARRY@UKR.NET', '1234567890');
INSERT INTO STAFF
VALUES(STAFF_SEQ.NEXTVAL, 'BOB STIVENSON', 1, 'BOB@UKR.NET', '0987654321');

CREATE SEQUENCE POSITION_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE POSITION(
    ID_POSITION NUMBER PRIMARY KEY,
    POSITION_NAME VARCHAR2(30) NOT NULL,
    SALARY NUMBER NOT NULL
);

INSERT INTO POSITION
VALUES(POSITION_SEQ.NEXTVAL, 'CASHIER', 2000);

ALTER TABLE STAFF ADD CONSTRAINT STAFF_FK0 FOREIGN KEY (ID_POSITION) REFERENCES POSITION(ID_POSITION);

--INVOICE
CREATE SEQUENCE INVOICE_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE TABLE INVOICE(
    ID_INVOICE NUMBER PRIMARY KEY,
    ID_STAFF NUMBER NOT NULL,
    ID_CLIENT NUMBER NOT NULL,
    ID_PRODUCT NUMBER NOT NULL,
    ID_SUPPLIER NUMBER NOT NULL,
    ID_PAYMENT_TYPE NUMBER NOT NULL,
    ID_PHARMACY NUMBER NOT NULL,
    ID_FEEDBACK NUMBER NOT NULL,
    QUANTITY NUMBER NOT NULL,
    PURCHASE_DATE DATE NOT NULL
);

INSERT INTO INVOICE
VALUES(INVOICE_SEQ.NEXTVAL, 1, 1, 1, 1, 1, 1, 1, 1, TO_DATE('10-02-2018', 'DD-MM-YY'));
INSERT INTO INVOICE
VALUES(INVOICE_SEQ.NEXTVAL, 2, 2, 2, 2, 2, 2, 2, 2, TO_DATE('26-10-2017', 'DD-MM-YY'));
INSERT INTO INVOICE
VALUES(INVOICE_SEQ.NEXTVAL, 1, 3, 5, 3, 2, 3, 4, 5, TO_DATE('01-01-2018', 'DD-MM-YY'));
INSERT INTO INVOICE
VALUES(INVOICE_SEQ.NEXTVAL, 2, 2, 3, 2, 1, 1, 3, 3, TO_DATE('20-08-2018', 'DD-MM-YY'));

ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK0 FOREIGN KEY (ID_STAFF) REFERENCES STAFF(ID_STAFF);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK1 FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT(ID_CLIENT);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK2 FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCT(ID_PRODUCT);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK3 FOREIGN KEY (ID_SUPPLIER) REFERENCES SUPPLIER(ID_SUPPLIER);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK4 FOREIGN KEY (ID_PAYMENT_TYPE) REFERENCES PAYMENT_TYPE(ID_PAYMENT_TYPE);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK5 FOREIGN KEY (ID_PHARMACY) REFERENCES PHARMACY(ID_PHARMACY);
ALTER TABLE INVOICE ADD CONSTRAINT INVOICE_FK6 FOREIGN KEY (ID_FEEDBACK) REFERENCES FEEDBACK(ID_FEEDBACK);

SELECT 'CLIENT ' || CLIENT.CLIENT_NAME || ' NEEDS PRODUCTS FROM ' ||
PRODUCT_TYPE.PRODUCT_TYPE_NAME || ' CATEGORY' AS INFO
FROM INVOICE
INNER JOIN CLIENT ON INVOICE.ID_CLIENT = CLIENT.ID_CLIENT
INNER JOIN PRODUCT ON INVOICE.ID_PRODUCT = PRODUCT.ID_PRODUCT
INNER JOIN PRODUCT_TYPE ON PRODUCT.ID_PRODUCT_TYPE = PRODUCT_TYPE.ID_PRODUCT_TYPE;

SELECT 'CLIENT ' || CLIENT.CLIENT_NAME || ' BOUGHT ' ||
PRODUCT.PRODUCT_NAME || ' FROM ' ||
POSITION.POSITION_NAME || ' CALLED ' ||
STAFF.STAFF_NAME AS INFO
FROM INVOICE
INNER JOIN CLIENT ON INVOICE.ID_CLIENT = CLIENT.ID_CLIENT
INNER JOIN PRODUCT ON INVOICE.ID_PRODUCT = PRODUCT.ID_PRODUCT
INNER JOIN STAFF ON INVOICE.ID_STAFF = STAFF.ID_STAFF
INNER JOIN POSITION ON STAFF.ID_POSITION = POSITION.ID_POSITION;