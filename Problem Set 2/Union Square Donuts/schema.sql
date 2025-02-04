CREATE TABLE ingredients(
    "id" INTEGER,
    "ingredient_name" TEXT,
    "price" REAL,
    PRIMARY KEY ("id")
);
CREATE TABLE donuts(
    "id" INTEGER,
    "ingredient_id" INTEGER,
    "name" TEXT,
    "gluten-free" NUMERIC,
    "price" REAL,
    PRIMARY KEY ("id")
);
CREATE TABLE orders(
    "order_number" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("order_number"),
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
);
CREATE TABLE customers(
        "id" INTEGER,
        "order_id" INTEGER,
        "first_name" TEXT,
        "last_name" TEXT,
        "history" NUMERIC,
        PRIMARY KEY ("id")
);
 CREATE TABLE ingredients_of_donut(
        "ingredient_id" INTEGER,
         "donut_id" INTEGER,
          PRIMARY KEY ("ingredient_id","donut_id"),
           FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("id"),
          FOREIGN KEY ("donut_id") REFERENCES "donuts" ("id")
 );
CREATE TABLE orders_donuts (
        "order_number" INTEGER,
        "donut_id" INTEGER,
        PRIMARY KEY ("order_number","donut_id"),
        FOREIGN KEY ("order_number") REFERENCES "orders" ("order_no"),
        FOREIGN KEY ("donut_id") REFERENCES "donuts" ("id")
    );
