CREATE TABLE passengers (
    "id" INTEGER,
    "first_name" text ,
    "last_name" text ,
    "age" INTEGER,
    PRIMARY KEY("id")
);
CREATE TABLE check_in (
    "id" INTEGER,
    "passener_id" INTEGER,
    "flight_id" INTEGER,
    "date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("passener_id") REFERENCES "passengers"("id"),
     FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);
CREATE TABLE airlines(
    "id" INTEGER,
     "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY ("id")
);
CREATE TABLE flights(
        "id" INTEGER,
        "flight_number" INTEGER,
        "airline_id" INTEGER,
        "depart_code" TEXT,
        "head_code" TEXT,
        "departure_dat" NUMERIC,
        "arrival_date " NUMERIC,
        PRIMARY KEY ("id"),
        FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);
