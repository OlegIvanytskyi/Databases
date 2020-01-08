INSERT INTO PAYMENT_TYPE
VALUES(1, 'CURRENCY', 'CLIENT PAYS WITH REAL MONEY');
INSERT INTO PAYMENT_TYPE
VALUES(2, 'CREDIT CARD', 'CLIENT PAYS WITH CREDIT CARD');
INSERT INTO PRODUCT_TYPE
VALUES(1, 'TV');
INSERT INTO TYPE_OPER
VALUES(1, 'IN', 'IN OPERATION');
INSERT INTO TYPE_OPER
VALUES(2, 'OUT', 'OUT OPERATION');

CREATE OR REPLACE PROCEDURE GET_SUPPLIER IS
    TEMP NUMBER := 0;

    CURSOR COMPANIES IS
    SELECT SUPPLIER FROM INVOICE;
BEGIN
    FOR COMPANY IN COMPANIES
    LOOP
        SELECT COUNT(*) INTO TEMP FROM SUPPLIER WHERE SUPPLIER_NAME = COMPANY.SUPPLIER;
        
        IF NOT REGEXP_LIKE(COMPANY.SUPPLIER, '^[A-Za-z]+$') THEN
        INSERT INTO ERROR_LOG
        VALUES(ERROR_SEQ.NEXTVAL, CURRENT_DATE, CONCAT('ERROR WITH SUPPLIER, NAME: ', COMPANY.SUPPLIER));
        
        ELSIF TEMP > 0 THEN CONTINUE;
        
        ELSE INSERT INTO SUPPLIER
        VALUES(SUPPLIER_SEQ.NEXTVAL, COMPANY.SUPPLIER, '');
        
        END IF;
    END LOOP;
END GET_SUPPLIER;