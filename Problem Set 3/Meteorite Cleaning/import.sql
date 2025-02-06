.import --csv meteorites.csv "meteorites_temp"
UPDATE "meteorites_temp"
SET "mass" =NULL
WHERE "mass"='';

UPDATE "meteorites_temp"
SET "year" =NULL
WHERE "year"='';

UPDATE "meteorites_temp"
SET "lat" =NULL
WHERE "lat"='';

UPDATE "meteorites_temp"
SET "long" =NULL
WHERE "long "='';

UPDATE "meteorites_temp"
SET "mass" =ROUND("mass",2),
    "lat"  =ROUND("lat",2),
    "long" = ROUND("long",2);

DELETE FROM "meteorites_temp"
 WHERE "nametype"='Relict';



CREATE TABLE meteorites (
    "id" INTEGER ,
    "name" TEXT,
    "class" NUMERIC,
    "mass" REAL,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
    SELECT "name","class","mass","discovery","year","lat","long" FROM "meteorites_temp" ORDER BY "year","name";

