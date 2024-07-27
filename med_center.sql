-- Create Doctors table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100)
);

-- Create Patients table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    address VARCHAR(255)
);

-- Create Diseases table
CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create Visits table
CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    visit_date DATE NOT NULL,
    diagnosis TEXT
);

-- Create Visit_Diseases table
CREATE TABLE visit_diseases (
    visit_id INT REFERENCES visits(visit_id),
    disease_id INT REFERENCES diseases(disease_id),
    PRIMARY KEY (visit_id, disease_id)
);

-- Insert sample data
-- Doctors
INSERT INTO doctors (name, specialization) VALUES ('Dr. Smith', 'Cardiology');
INSERT INTO doctors (name, specialization) VALUES ('Dr. Johnson', 'Neurology');

-- Patients
INSERT INTO patients (name, dob, address) VALUES ('John Doe', '1980-01-01', '123 Main St');
INSERT INTO patients (name, dob, address) VALUES ('Jane Doe', '1990-05-15', '456 Elm St');

-- Diseases
INSERT INTO diseases (name, description) VALUES ('Hypertension', 'High blood pressure');
INSERT INTO diseases (name, description) VALUES ('Diabetes', 'Chronic disease that affects insulin regulation');

-- Visits
INSERT INTO visits (patient_id, doctor_id, visit_date, diagnosis) VALUES (1, 1, '2024-07-01', 'Diagnosed with hypertension');
INSERT INTO visits (patient_id, doctor_id, visit_date, diagnosis) VALUES (2, 2, '2024-07-02', 'Diagnosed with diabetes');

-- Visit_Diseases
INSERT INTO visit_diseases (visit_id, disease_id) VALUES (1, 1);
INSERT INTO visit_diseases (visit_id, disease_id) VALUES (2, 2);
