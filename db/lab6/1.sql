ALTER TABLE "CHECK" DROP CONSTRAINT CHECK_FK0;
ALTER TABLE "CHECK" DROP CONSTRAINT CHECK_FK1;
ALTER TABLE SERVICE_CHECK DROP CONSTRAINT SERVICE_CHECK_FK0;
ALTER TABLE SERVICE_CHECK DROP CONSTRAINT SERVICE_CHECK_FK1;
 
DROP TABLE "CHECK";
DROP TABLE CLIENT;
DROP TABLE LOG;
DROP TABLE ROOM;
DROP TABLE SERVICE;
DROP TABLE SERVICE_CHECK;

CREATE SEQUENCE CLIENT_SEQ
START WITH 4
INCREMENT BY 1
MAXVALUE 100000
NOCYCLE;

CREATE  TABLE "CLIENT"(
"ID" NUMBER,
"NAME" CHAR(40) CONSTRAINT NAME_NOT_NULL NOT NULL,
"PASSPORT" CHAR(8) CONSTRAINT PASSPORT_UNIQUE UNIQUE 
                    CONSTRAINT PASSPORT_CHECK CHECK(REGEXP_LIKE("PASSPORT", '^[A-Za-z]{2}[0-9]{6}$')),
"PHONE_NUMBER" CHAR(13) CONSTRAINT PHONE_CHECK CHECK(REGEXP_LIKE("PHONE_NUMBER", '^[+]380[0-9]{9}$')),
CONSTRAINT "CLIENT_PK" PRIMARY KEY ("ID") 
);

INSERT INTO CLIENT
VALUES(1, 'OLEG', 'AH123456', '+380903772114');
INSERT INTO CLIENT
VALUES(1, 'LARRY', 'AK133430', '+380601834418');
INSERT INTO CLIENT
VALUES(2, '', 'AK133430', '+380601834418');
INSERT INTO CLIENT
VALUES(3, 'LARRY', 'A4133430', '+380601834418');
INSERT INTO CLIENT
VALUES(4, 'LARRY', 'AH123456', '+380601834418');
INSERT INTO CLIENT
VALUES(5, 'LARRY', 'AK133430', '+3806018418');

CREATE TABLE "ROOM"(
"ID" NUMBER,
"PRICE" NUMBER,
"CAPACITY" NUMBER,
"COMFORT" CHAR(20) CONSTRAINT ROOM_FIELD CHECK(REGEXP_LIKE(COMFORT, 'low|medium|high|luxury|party')),
CONSTRAINT ROOM_TUPLE CHECK(PRICE > 0 AND CAPACITY > 0),
CONSTRAINT "ROOM_PK" PRIMARY KEY ("ID") ENABLE
);

INSERT INTO ROOM
VALUES(1, 100, 4, 'low');
INSERT INTO ROOM
VALUES(2, 100, 4, 'small');
INSERT INTO ROOM
VALUES(3, 0, 4, 'low');
INSERT INTO ROOM
VALUES(4, 100, 0, 'low');
INSERT INTO ROOM
VALUES(1, -100, -3, 'low');

CREATE TABLE "CHECK"(
"ID" NUMBER,
"DATE" DATE,
"CHECK_IN" DATE,
"CHECK_OUT" DATE, 
"CLIENT_ID" NUMBER,
"ROOM_ID" NUMBER,
CONSTRAINT "CHECK_PK" PRIMARY KEY ("ID") ENABLE
);

INSERT INTO "CHECK"
VALUES(1, TO_DATE('01-01-18','DD-MM-YY'), TO_DATE('01-01-18','DD-MM-YY'), TO_DATE('10-01-18','DD-MM-YY'), 1, 1);
INSERT INTO "CHECK"
VALUES(2, TO_DATE('01-01-18','DD-MM-YY'), TO_DATE('01-01-18','DD-MM-YY'), TO_DATE('10-01-18','DD-MM-YY'), 50, 1);

CREATE TABLE "SERVICE"(
"ID" NUMBER,
"NAME" CHAR(30),
"PRICE" NUMBER,
CONSTRAINT "SERVICE_PK" PRIMARY KEY ("ID") ENABLE
);
 
CREATE TABLE "SERVICE_CHECK"(
"ID" NUMBER,
"SERVICE_ID" NUMBER,
"CHECK_ID" NUMBER,
CONSTRAINT "SERVICE_CHECK_PK" PRIMARY KEY ("ID") ENABLE
);
 
CREATE TABLE LOG(
INFO CHAR(100)
);

ALTER TABLE "CHECK" ADD CONSTRAINT CHECK_FK0 FOREIGN KEY (CLIENT_ID) REFERENCES "CLIENT"(ID);
ALTER TABLE "CHECK" ADD CONSTRAINT CHECK_FK1 FOREIGN KEY (ROOM_ID) REFERENCES "ROOM"(ID);
ALTER TABLE "SERVICE_CHECK" ADD CONSTRAINT SERVICE_CHECK_FK0 FOREIGN KEY (SERVICE_ID) REFERENCES "SERVICE"(ID);
ALTER TABLE "SERVICE_CHECK" ADD CONSTRAINT SERVICE_CHECK_FK1 FOREIGN KEY (CHECK_ID) REFERENCES "CHECK"(ID);
 
CREATE TRIGGER CHECK_UPDATE
AFTER UPDATE ON "CHECK"
FOR EACH ROW
WHEN(NEW.CHECK_IN > OLD.CHECK_OUT)
    BEGIN
        UPDATE "CHECK"
        SET CHECK_IN = :OLD.CHECK_IN;
END CHECK_UPDATE;

UPDATE "CHECK"
SET CHECK_IN = TO_DATE('05-01-2018', 'DD-MM-YY')
WHERE ID = 1;
UPDATE "CHECK"
SET CHECK_IN = TO_DATE('15-01-2018', 'DD-MM-YY')
WHERE ID = 1;

CREATE TRIGGER ROOM_DELETE
BEFORE DELETE ON "ROOM"
BEGIN
    ROLLBACK;
END;

DELETE FROM ROOM
WHERE ID = 1;

CREATE TRIGGER CLIENT_INSERT
AFTER INSERT ON "CLIENT"
FOR EACH ROW
BEGIN
    INSERT INTO LOG VALUES('NEW CLIENT ADDED');
END;

INSERT INTO CLIENT
VALUES(2, 'LARRY', 'AL985356', '+380509881103');
INSERT INTO CLIENT
VALUES(3, 'GREG', 'AH129386', '+380945093387');

CREATE UNIQUE INDEX CLIENT_INDEX ON CLIENT (NAME);
CREATE INDEX ROOM_INDEX ON ROOM (CAPACITY, COMFORT);
 
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Jake Peralta', 'QW123456', '+380234567890');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Nicola Tesla', 'QE123457', '+380234567891');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Chris Evans', 'QQ123458', '+380234567892');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Tirion Lannister', 'QR123459', '+380234567893');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Semuel Jackson', 'QT123450', '+380234567894');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Rick Bradly', 'QY123451', '+380234567895');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Rosa Diaz', 'QU123452', '+380234567896');
INSERT INTO "CLIENT"
VALUES (CLIENT_SEQ.NEXTVAL, 'Harold Patcher', 'QI120052', '+380234987896');

INSERT INTO ROOM
VALUES (2, 250, 2, 'low');
INSERT INTO ROOM
VALUES (3, 350, 1, 'medium');
INSERT INTO ROOM
VALUES (4, 450, 2, 'medium');
INSERT INTO ROOM
VALUES (5, 700, 1, 'high');
INSERT INTO ROOM
VALUES (6, 1000, 2, 'high');
INSERT INTO ROOM
VALUES (7, 1500, 2, 'luxury');
INSERT INTO ROOM
VALUES (8, 5000, 10, 'party');

INSERT INTO "SERVICE"
VALUES(1, 'massage', 150);
INSERT INTO "SERVICE"
VALUES(2, 'spa', 250);
INSERT INTO "SERVICE"
VALUES(3, 'bar', 50);
INSERT INTO "SERVICE"
VALUES(4, 'tennis', 30);
INSERT INTO "SERVICE"
VALUES(5, 'bowling', 25);
INSERT INTO "SERVICE"
VALUES(6, 'gym', 10);

INSERT INTO "CHECK"
VALUES(2, TO_DATE('01-01-18','DD-MM-YY'), TO_DATE('03-01-18','DD-MM-YY'), TO_DATE('13-01-18','DD-MM-YY'), 2, 2);
INSERT INTO "CHECK"
VALUES(3, TO_DATE('28-01-18','DD-MM-YY'), TO_DATE('11-02-18','DD-MM-YY'), TO_DATE('21-02-18','DD-MM-YY'), 3, 1);
INSERT INTO "CHECK"
VALUES(4, TO_DATE('26-03-18','DD-MM-YY'), TO_DATE('29-03-18','DD-MM-YY'), TO_DATE('02-04-18','DD-MM-YY'), 4, 3);
INSERT INTO "CHECK"
VALUES(5, TO_DATE('01-04-18','DD-MM-YY'), TO_DATE('06-04-18','DD-MM-YY'), TO_DATE('08-04-18','DD-MM-YY'), 5, 7);
INSERT INTO "CHECK"
VALUES(6, TO_DATE('01-04-18','DD-MM-YY'), TO_DATE('01-04-18','DD-MM-YY'), TO_DATE('10-04-18','DD-MM-YY'), 6, 4);
INSERT INTO "CHECK"
VALUES(7, TO_DATE('30-07-18','DD-MM-YY'), TO_DATE('08-08-18','DD-MM-YY'), TO_DATE('18-08-18','DD-MM-YY'), 7, 2);

INSERT INTO SERVICE_CHECK
VALUES(1, 1, 1);
INSERT INTO SERVICE_CHECK
VALUES(2, 2, 1);
INSERT INTO SERVICE_CHECK
VALUES(3, 4, 1);
INSERT INTO SERVICE_CHECK
VALUES(4, 3, 2);
INSERT INTO SERVICE_CHECK
VALUES(5, 1, 3);
INSERT INTO SERVICE_CHECK
VALUES(6, 5, 3);
INSERT INTO SERVICE_CHECK
VALUES(7, 6, 4);
INSERT INTO SERVICE_CHECK
VALUES(8, 3, 5);
INSERT INTO SERVICE_CHECK
VALUES(9, 4, 5);
INSERT INTO SERVICE_CHECK
VALUES(10, 6, 5);