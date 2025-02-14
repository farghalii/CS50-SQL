# Design Document

By Hamza Farghali

Video Overview: [Watch Here](https://youtu.be/F3LB2_jjVAE)

## Scope
* Purpose of the Database
The purpose of this database is to efficiently manage and store information related to hospital operations.
It tracks essential data about patients, doctors, hospitals, and medical records, facilitating streamlined data
retrieval and updates. The database maintains the integrity of relationships between entities such as patients
and their assigned hospitals, doctors and their specializations, and patients' medical histories.

* Included in the Scope
The following entities are included in the scope of the database:
Patients: Personal information including name, diagnosis, address, and associated hospital.
Doctors: Professional details such as name, qualifications, specialization, salary, and affiliated hospital.
Hospitals: Information about hospital facilities, including name, address, and city.
Medical Records: Records of patient examinations, including dates and medical issues identified.

* The database does not cover:
Detailed billing or financial transactions.
Inventory or supply chain management for hospital resources.
Scheduling or appointment management.

## Functional Requirements
* A user of this database can
1. Manage Patient Information
2. Manage Doctor Information
3. Manage Hospital Information
4. Manage Medical Records
5. Retrieve and Analyze Data

*  beyond the scope
1. Financial & Billing Operations
2. Scheduling & Appointments
3. User Authentication & Access Control
## Representation

### Entities

#### Entities and Relationships

Patients are linked to Hospitals through a foreign key (`hosp_id`), indicating the hospital where they are receiving treatment.

Doctors are associated with Hospitals via the `hosp_id` foreign key, denoting their place of employment.

Medical Records are connected to Patients through the `patient_id` foreign key, documenting each patient's medical history.


#### Data Types and Constraints

Primary Keys: Unique identifiers (INTEGER) for each table to ensure entity uniqueness.

Foreign Keys: Establish relationships between tables, enforcing referential integrity.

Not Null Constraints: Applied to essential fields to prevent incomplete data entries.

Check Constraints: For example, ensuring that the salary field in the Doctor table is greater than zero.

### Relationships
1- Patient - Hospital (Many-to-One)

One hospital can have many patients.
Each patient is admitted to one hospital.
Relationship: Hospital (1) -> Patient (M)
 Foreign Key:
Patient.hosp_id -> Hospital.h_id


2- Doctor - Hospital (Many-to-One)

One hospital can employ many doctors.
Each doctor is assigned to one hospital.
Relationship: Hospital (1)-> Doctor (M)
Foreign Key:
Doctor.hosp_id -> Hospital.h_id


3- Medical_Record - Patient (Many-to-One)

One patient can have many medical records over time.
Each medical record belongs to one patient.
Relationship: Patient (1) -> Medical_Record (M)
Foreign Key:
Medical_Record.patient_id -> Patient.p_id



Here’s the entity-relationship diagram (ERD):

Entity Relationship Diagram: [View ERD](https://drive.google.com/file/d/1HcZhlnxRoLsDU5VLyslq9k2fqE6GCQHm/view)


## Optimizations

Indexes

To enhance query performance, the following indexes are implemented:

1. `patient_name_index` on the `p_name` column in the Patient table.
2. `hospital_city_index` on the `h_city` column in the Hospital table.
3. `doctor_specialization_index` on the `specialization` column in the Doctor table.

Views

Two views are created to simplify data retrieval:

1. `Patient_Medical_History`: Combines patient information with their medical records.
2. `Doctor_info_by_hospital`: Displays doctors' details alongside their associated hospital information.

## Limitations

The database does not handle historical data for entities; for instance, if a doctor's specialization changes,
previous records are not retained.

It assumes that each patient is associated with only one hospital and each doctor is employed by a single hospital.

The current design does not support many-to-many relationships, such as doctors working in multiple hospitals or
patients visiting multiple hospitals.
