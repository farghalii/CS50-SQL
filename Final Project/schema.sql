-- Table for storing patient details
CREATE TABLE "Patient" (
    "p_id" INTEGER PRIMARY KEY,
    "p_name" TEXT NOT NULL,
    "p_diagnosis" TEXT NOT NULL,
    "p_address" TEXT,
    "hosp_id" INTEGER,
    FOREIGN KEY ("hosp_id") REFERENCES "Hospital" ("h_id")
);

-- Table for storing hospital details
CREATE TABLE "Hospital" (
    "h_id" INTEGER PRIMARY KEY,
    "h_name" TEXT NOT NULL,
    "h_address" TEXT NOT NULL,
    "h_city" TEXT NOT NULL
);

-- Table for storing doctor details
CREATE TABLE "Doctor" (
    "d_id" INTEGER PRIMARY KEY,
    "hosp_id" INTEGER,
    "d_name" TEXT NOT NULL,
    "qualification" TEXT NOT NULL,
    "specialization" TEXT NOT NULL,
    "salary" REAL CHECK ("salary" > 0),
    FOREIGN KEY ("hosp_id") REFERENCES "Hospital" ("h_id")
);

-- Table for storing medical records
CREATE TABLE "Medical_Record" (
    "m_id" INTEGER PRIMARY KEY,
    "patient_id" INTEGER,
    "examination_date" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "problem" TEXT NOT NULL,
    FOREIGN KEY ("patient_id") REFERENCES "Patient" ("p_id")
);

-- View to show patient medical history
CREATE VIEW "Patient_Medical_History" AS
SELECT
    "Patient"."p_id",
    "Patient"."p_name",
    "Medical_Record"."m_id",
    "Medical_Record"."examination_date",
    "Medical_Record"."problem"
FROM "Patient"
JOIN "Medical_Record" ON "Patient"."p_id" = "Medical_Record"."patient_id";

-- View to show doctor details by hospital
CREATE VIEW "doctor_info_by_hospital" AS
SELECT
    "Doctor"."d_id",
    "Doctor"."d_name",
    "Doctor"."specialization",
    "Hospital"."h_name"
FROM "Doctor"
JOIN "Hospital" ON "Hospital"."h_id" = "Doctor"."hosp_id";

-- Index for faster search by patient name
CREATE INDEX "patient_name_index" ON "Patient" ("p_name");

-- Index for faster search by hospital city
CREATE INDEX "hospital_city_index" ON "Hospital" ("h_city");

-- Index for faster search by doctor specialization
CREATE INDEX "doctor_specialization_index" ON "Doctor" ("specialization");
