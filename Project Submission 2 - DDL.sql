 SET sql_mode='oracle';

-- DDL
 CREATE TABLE PAY_SCALE(
 GRADE INT PRIMARY KEY,
 MIN_SALARY DECIMAL(10,2) NOT NULL,
 MAX_SALARY DECIMAL(10,2) NOT NULL);
  

 CREATE TABLE STAFF_TYPE(
 ID INT PRIMARY KEY,
 DESCRIPTION VARCHAR2(30) NOT NULL,
 LEVEL VARCHAR(6) NOT NULL,
 SPECIALIST VARCHAR2(1) NOT NULL,
 PAY_GRADE INT NOT NULL,
 FOREIGN KEY (PAY_GRADE) REFERENCES PAY_SCALE (GRADE));
 
 
 CREATE TABLE STAFF(
 ID INT PRIMARY KEY,
 FIRSTNAME VARCHAR2(30) NOT NULL,
 MIDDLE_NAME VARCHAR2(30) NOT NULL,
 LAST_NAME VARCHAR2(30) NOT NULL,
 DOB DATE NOT NULL,
 ADDRESS VARCHAR2(100) NOT NULL,
 HOMEPHONE VARCHAR2(18) NOT NULL,
 QUALIFICATIONS VARCHAR2(20) NOT NULL,
 SEX VARCHAR2(10) NOT NULL,
 STAFF_TYPE INT NOT NULL,
 FOREIGN KEY (STAFF_TYPE) REFERENCES STAFF_TYPE (ID));


 CREATE TABLE PATIENTS(
 ID INT PRIMARY KEY,
 FIRSTNAME VARCHAR2(30) NOT NULL,
 MIDDLE_NAME VARCHAR2(30)  NULL,
 LAST_NAME VARCHAR2(30) NOT NULL,
 DOB DATE NOT NULL,
 ADDRESS VARCHAR2(100) NULL,
 HOMEPHONE VARCHAR2(18) NOT NULL,
 EMAIL VARCHAR2(60) NULL,
 EMERGENCY_CONTACT VARCHAR2(18) NULL,
 INSURANCE_NUMBER VARCHAR2(50) NOT NULL,
 SEX VARCHAR2(10) NOT NULL,
 BLOOD_TYPE VARCHAR2(4) NOT NULL);


 CREATE TABLE MEDICATION_TYPE(
 ID INT PRIMARY KEY,
 NAME VARCHAR2 (50) NOT NULL,
 DESCRIPTION VARCHAR2(80) NOT NULL,
 FORM VARCHAR(15) NOT NULL);


 CREATE TABLE MEDICATION(
 ID INT PRIMARY KEY,
 NAME VARCHAR2 (30) NOT NULL,
 DESCRIPTION VARCHAR2(80) NOT NULL,
 DOSAGE_FORM VARCHAR(10) NOT NULL,
 MEDICATION_TYPE INT NOT NULL,
 UNIT_COST_NUMBER DECIMAL(10,2) NOT NULL,
 FOREIGN KEY (MEDICATION_TYPE) REFERENCES MEDICATION_TYPE (ID));


 CREATE TABLE MED_PRESCRIPTIONS(
 ID INT PRIMARY KEY,
 MED_ID INT NOT NULL,
 PATIENT_ID INT NOT NULL,
 ADMINISTERED_DATE DATE NOT NULL,
 COMMENTS VARCHAR2(300) NULL,
 FOREIGN KEY (MED_ID) REFERENCES MEDICATION (ID),
 FOREIGN KEY (PATIENT_ID) REFERENCES PATIENTS (ID));


 CREATE TABLE APPOINTMENTS(
 ID INT PRIMARY KEY,
 STAFF_ID INT NOT NULL,
 PATIENT_ID INT NOT NULL,
 APPOINTMENT DATETIME NOT NULL,
 DIAGNOSIS VARCHAR2(200) NULL,
 FOREIGN KEY (STAFF_ID) REFERENCES STAFF (ID),
 FOREIGN KEY (PATIENT_ID) REFERENCES PATIENTS (ID));