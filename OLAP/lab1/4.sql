SELECT ID_STUFF, STAFF_NAME
FROM(
SELECT DISTINCT ID_STUFF, STAFF_NAME, E_MAIL
FROM INVOICE
)
GROUP BY ID_STUFF, STAFF_NAME
HAVING COUNT(E_MAIL) = 1;