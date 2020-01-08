INSERT INTO POSITION
VALUES(1, 'SELLER', 500, 'SELLS PRODUCTS');

CREATE OR REPLACE PROCEDURE GET_STAFF IS
    TEMP NUMBER := 0;

    CURSOR CREW IS
    SELECT ID_STUFF, STAFF_NAME, E_MAIL FROM INVOICE;
BEGIN
    FOR EMPLOYEE IN CREW
    LOOP
        SELECT COUNT(*) INTO TEMP FROM STUFF WHERE ID_STUFF = EMPLOYEE.ID_STUFF;
        
        IF NOT REGEXP_LIKE(EMPLOYEE.E_MAIL, '^[A-Za-z0-9 ._-]+@[a-zA-Z]+\.[a-zA-Z]+$') THEN
        INSERT INTO ERROR_LOG
        VALUES(ERROR_SEQ.NEXTVAL, CURRENT_DATE, CONCAT('ERROR WITH E_MAIL: ', EMPLOYEE.E_MAIL));
        
        ELSIF TEMP > 0 THEN CONTINUE;
        
        ELSE INSERT INTO STUFF
        VALUES(EMPLOYEE.ID_STUFF, 1, GET_FIRST_NAME(EMPLOYEE.STAFF_NAME), GET_LAST_NAME(EMPLOYEE.STAFF_NAME), GENERATE_PHONE_NUMBER(), GENERATE_ADDRESS(), EMPLOYEE.E_MAIL);
        
        END IF;
    END LOOP;
END GET_STAFF;



