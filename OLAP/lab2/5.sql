SELECT PRODUCT.ID_PRODUCT, PRICE, PURCHASE_TIME, COUNT(*) OVER 
(ORDER BY INVOICE.PURCHASE_TIME RANGE BETWEEN INTERVAL '1' MONTH PRECEDING AND INTERVAL '1' MONTH FOLLOWING) AS NUM_OF_ROWS
FROM PRODUCT
INNER JOIN INVOICE_DETAIL ON PRODUCT.ID_PRODUCT = INVOICE_DETAIL.ID_PRODUCT
INNER JOIN INVOICE ON INVOICE.ID_INVOICE = INVOICE_DETAIL.ID_INVOICE;

SELECT PRODUCT.ID_PRODUCT, ID_PRODUCT_TYPE, PRICE, PURCHASE_TIME, COUNT(*) OVER 
(PARTITION BY ID_PRODUCT_TYPE ORDER BY INVOICE.PURCHASE_TIME RANGE BETWEEN INTERVAL '1' MONTH PRECEDING AND INTERVAL '1' MONTH FOLLOWING) AS NUM_OF_ROWS
FROM PRODUCT
INNER JOIN INVOICE_DETAIL ON PRODUCT.ID_PRODUCT = INVOICE_DETAIL.ID_PRODUCT
INNER JOIN INVOICE ON INVOICE.ID_INVOICE = INVOICE_DETAIL.ID_INVOICE;

SELECT PRODUCT.ID_PRODUCT, ID_PRODUCT_TYPE, PRICE, PURCHASE_TIME, COUNT(*) OVER 
(PARTITION BY ID_PRODUCT_TYPE, PRICE) AS NUM_OF_ROWS
FROM PRODUCT
INNER JOIN INVOICE_DETAIL ON PRODUCT.ID_PRODUCT = INVOICE_DETAIL.ID_PRODUCT
INNER JOIN INVOICE ON INVOICE.ID_INVOICE = INVOICE_DETAIL.ID_INVOICE
ORDER BY ID_PRODUCT_TYPE;

SELECT PRODUCT.ID_PRODUCT, ID_PRODUCT_TYPE, PRICE, PURCHASE_TIME, COUNT(*) OVER 
(PARTITION BY ID_PRODUCT_TYPE, PRICE ORDER BY PURCHASE_TIME
RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS NUM_OF_ROWS
FROM PRODUCT
INNER JOIN INVOICE_DETAIL ON PRODUCT.ID_PRODUCT = INVOICE_DETAIL.ID_PRODUCT
INNER JOIN INVOICE ON INVOICE.ID_INVOICE = INVOICE_DETAIL.ID_INVOICE
ORDER BY ID_PRODUCT_TYPE;