-- Hospital Patient Analytics — SQL Analysis

-- ================================
-- 1. Table Creation
-- ================================
CREATE TABLE hospital_patients (
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    blood_type VARCHAR(5),
    medical_condition VARCHAR(50),
    date_of_admission DATE,
    doctor VARCHAR(100),
    hospital VARCHAR(100),
    insurance_provider VARCHAR(50),
    billing_amount DECIMAL(10,2),
    room_number INT,
    admission_type VARCHAR(20),
    discharge_date DATE,
    medication VARCHAR(50),
    test_results VARCHAR(20),
    length_of_stay INT,
    admission_month INT,
    admission_year INT,
    admission_month_name VARCHAR(10),
    day_of_week VARCHAR(15),
    age_group VARCHAR(10)
);

-- ================================
-- 2. Data Import
-- ================================
-- Note: Update file path as per your system before running
COPY hospital_patients
FROM 'path/to/healthcare_cleaned.csv'
DELIMITER ','
CSV HEADER;

-- ================================
-- 3. Key KPI Analysis
-- ================================

-- Total patients
SELECT COUNT(*) AS total_patients
FROM hospital_patients;

-- Average billing
SELECT ROUND(AVG(billing_amount), 2) AS avg_billing
FROM hospital_patients;

-- ================================
-- 4. Patient Segmentation
-- ================================

-- Patients by medical condition
SELECT medical_condition,
       COUNT(*) AS total_patients
FROM hospital_patients
GROUP BY medical_condition
ORDER BY total_patients DESC;

-- Patients by age group
SELECT age_group,
       COUNT(*) AS total_patients
FROM hospital_patients
GROUP BY age_group
ORDER BY age_group;

-- Patients by admission type
SELECT admission_type,
       COUNT(*) AS total_patients
FROM hospital_patients
GROUP BY admission_type
ORDER BY total_patients DESC;

-- ================================
-- 5. Time-Based Analysis
-- ================================

-- Patients by year
SELECT admission_year,
       COUNT(*) AS total_patients
FROM hospital_patients
GROUP BY admission_year
ORDER BY admission_year;

-- ================================
-- 6. Cost & Risk Analysis
-- ================================

-- Average length of stay by condition
SELECT medical_condition,
       ROUND(AVG(length_of_stay), 1) AS avg_stay_days
FROM hospital_patients
GROUP BY medical_condition
ORDER BY avg_stay_days DESC;

-- Average billing by insurance provider
SELECT insurance_provider,
       ROUND(AVG(billing_amount), 2) AS avg_billing
FROM hospital_patients
GROUP BY insurance_provider
ORDER BY avg_billing DESC;

-- Abnormal test rate
SELECT ROUND(
    COUNT(CASE WHEN test_results = 'Abnormal' THEN 1 END) * 100.0
    / COUNT(*), 1
) AS abnormal_rate_percent
FROM hospital_patients;

-- ================================
-- 7. High Value Patients
-- ================================

-- Top 5 highest billed patients
SELECT name, medical_condition, billing_amount
FROM hospital_patients
ORDER BY billing_amount DESC
LIMIT 5;

-- Patients above average billing
SELECT name, billing_amount
FROM hospital_patients
WHERE billing_amount > (
    SELECT AVG(billing_amount) FROM hospital_patients
)
ORDER BY billing_amount DESC;
