SELECT ID_PRODUCT, ID_PRODUCT_TYPE, PRICE 
FROM 
(
    SELECT ID_PRODUCT, ID_PRODUCT_TYPE, PRICE,
    RANK() OVER (PARTITION BY ID_PRODUCT_TYPE ORDER BY PRICE) AS RNK
    FROM PRODUCT
)
WHERE RNK = 1 OR RNK = 2
ORDER BY ID_PRODUCT_TYPE, PRICE;

SELECT ID_PRODUCT, ID_PRODUCT_TYPE, PRICE 
FROM 
(
    SELECT ID_PRODUCT, ID_PRODUCT_TYPE, PRICE,
   (
        SELECT COUNT(PRICE) + 1
        FROM PRODUCT
        WHERE PRICE < P.PRICE
        AND ID_PRODUCT_TYPE = P.ID_PRODUCT_TYPE
    ) AS RNK
    FROM PRODUCT P
)
WHERE RNK = 1 OR RNK = 2
ORDER BY ID_PRODUCT_TYPE, PRICE;
