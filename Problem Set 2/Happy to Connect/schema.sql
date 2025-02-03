CREATE TABLE users(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
 );
 CREATE TABLE schools(
    "id" INTEGER,
    "name" TEXT NOT NULL ,
    "type" TEXT,
    "location" TEXT NOT NULL,
    "founded_year" NUMERIC,
    PRIMARY KEY ("id")
 );
 CREATE TABLE companies(
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
 );
CREATE TABLE user_Connections(
    "userA_id" INTEGER,
    "userB_id" INTEGER,
    PRIMARY KEY ("userA_id","userB_id"),
    FOREIGN KEY ("userA_id") REFERENCES "users"("id"),
      FOREIGN KEY ("userB_id") REFERENCES "users"("id")
);
CREATE TABLE school_Connections(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date"NUMERIC NOT NULL,
    "end_date"NUMERIC NOT NULL,
    "degree_type" TEXT,
    PRIMARY KEY ("user_id","school_id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
     FOREIGN KEY ("school_id") REFERENCES "schools"("id")
);
CREATE TABLE companies_Connections(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date"NUMERIC NOT NULL,
    "end_date"NUMERIC NOT NULL,
    "title" TEXT,
    PRIMARY KEY ("user_id","company_id"),
     FOREIGN KEY ("user_id") REFERENCES "users"("id"),
     FOREIGN KEY ("company_id") REFERENCES "companies"("id")
);
