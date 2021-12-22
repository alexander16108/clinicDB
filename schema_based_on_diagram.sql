--checking if tables exist and deleting them
DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS medical_histories;
DROP TABLE IF EXISTS invoice_items;
DROP TABLE IF EXISTS invoices;

-- creating the basic tables for Schema 
CREATE TABLE patients(
  id SERIAL NOT NULL PRIMARY KEY,
  patients_name VARCHAR(200),
  date_of_birth date
);

CREATE TABLE invoices(
id SERIAL NOT NULL PRIMARY KEY,
total_amount DECIMAL,
generated_at timestamp,
payed_at timestamp,
medical_history_id INT,
 CONSTRAINT fk_medical_his FOREIGN KEY(medical_history_id)
    REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
id SERIAL NOT NULL PRIMARY KEY,
admitted_at timestamp,
patient_id INT,
status VARCHAR(200),
 CONSTRAINT fk_patients FOREIGN KEY(patient_id)
    REFERENCES patients(id)
);

CREATE TABLE invoice_items(
id SERIAL NOT NULL PRIMARY KEY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
 CONSTRAINT fk_invoice FOREIGN KEY(invoice_id)
    REFERENCES invoices(id),
  CONSTRAINT fk_treatment FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
);

CREATE TABLE treatments(
id SERIAL NOT NULL PRIMARY KEY,
type VARCHAR(200),
name VARCHAR(250)
);

--There is a many-to-many relationship between the tables patient and treatment: a patient with a disease can have multiple treatment, and a treatment for a disease can be for multiple patients. called disease to handle this relationship.

CREATE TABLE disease(
id SERIAL NOT NULL PRIMARY KEY,
name_of_disease VARCHAR(250)
);

