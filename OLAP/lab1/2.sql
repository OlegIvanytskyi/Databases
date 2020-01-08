ALTER TABLE STORE
ADD TEMP NUMBER;

UPDATE STORE
SET QUANTITY = 0
WHERE TRANSLATE(QUANTITY, ' 0123456789', ' ') IS NOT NULL;

UPDATE STORE
SET TEMP = QUANTITY;

ALTER TABLE STORE
DROP COLUMN QUANTITY;
ALTER TABLE STORE RENAME COLUMN TEMP TO QUANTITY;

SELECT SHELF, SUM(QUANTITY)
FROM STORE
GROUP BY SHELF
HAVING SUM(QUANTITY) <= 30;