-- Insert data into Hospital table
INSERT INTO "Hospital" ("h_id","h_name","h_address","h_city")
VALUES
(1,'City General','500 Health St','New York'),
(2,'Maplewood Clinic','600 Wellness Ave','Chicago');

-- Insert data into Patient table
INSERT INTO "Patient" ("p_id","p_name","p_diagnosis","p_address","hosp_id")
VALUES
(101,'hamza farghali','Flu','123 Main St',1),
(102,'mohamed salem','Hypertension','456 Elm St',2),
(103,'ahmed elgendy','Diabetes','789 Pine St',1);

-- Insert data into Doctor table
INSERT INTO "Doctor" ("d_id","hosp_id","d_name","qualification","specialization","salary")
VALUES
(201,1,'Dr. Emily White','MD','Cardiology',150000),
(202,2,'Dr. Robert Green','PhD','Pediatrics',180000),
(203,1,'Dr. Linda Black','DO','Neurology',140000);

-- Insert data into Medical_Record table
INSERT INTO "Medical_Record" ("m_id","patient_id","examination_date","problem")
VALUES
(301,101,'2024-01-10','Fever'),
(302,102,'2024-02-15','Chest Pain'),
(303,103,'2024-03-20','Headache');

-- Retrieve all patients and their assigned hospital
SELECT "Patient"."p_name", "Hospital"."h_name", "Hospital"."h_city"
FROM "Patient"
JOIN "Hospital" ON "Patient"."hosp_id" = "Hospital"."h_id";

-- Get all doctors working in a specific hospital
SELECT d."d_name", d."specialization", h."h_name"
FROM "Doctor" d
JOIN "Hospital" h ON d."hosp_id" = h."h_id"
WHERE h."h_id" = 1;

-- List the highest-paid doctors
SELECT d."d_name", d."specialization", d."salary"
FROM "Doctor" d
ORDER BY d."salary" DESC
LIMIT 2;


