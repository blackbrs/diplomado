--SQL EXPORT GENERADO
-- Generado por Oracle SQL Developer Data Modeler 4.0.0.833
--   en:        2023-08-30 23:16:15 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE COUNTRIES
  (
    COUNTRY_ID   CHAR (2 BYTE) CONSTRAINT COUNTRY_ID_NN NOT NULL ,
    COUNTRY_NAME VARCHAR2 (40 BYTE) ,
    REGION_ID    NUMBER ,
    CONSTRAINT COUNTRY_C_ID_PK PRIMARY KEY ( COUNTRY_ID )
  )
  ORGANIZATION INDEX TABLESPACE USERS LOGGING PCTTHRESHOLD 50 ;
COMMENT ON TABLE COUNTRIES
IS
  'country table. Contains 25 rows. References with locations table.' ;
  COMMENT ON COLUMN COUNTRIES.COUNTRY_ID
IS
  'Primary key of countries table.' ;
  COMMENT ON COLUMN COUNTRIES.COUNTRY_NAME
IS
  'Country name' ;
  COMMENT ON COLUMN COUNTRIES.REGION_ID
IS
  'Region ID for the country. Foreign key to region_id column in the departments table.' ;

CREATE TABLE DEPARTMENTS
  (
    DEPARTMENT_ID   NUMBER (4) NOT NULL ,
    DEPARTMENT_NAME VARCHAR2 (30 BYTE) CONSTRAINT DEPT_NAME_NN NOT NULL ,
    MANAGER_ID      NUMBER (6) ,
    LOCATION_ID     NUMBER (4)
  )
  TABLESPACE USERS LOGGING ;
COMMENT ON TABLE DEPARTMENTS
IS
  'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.' ;
  COMMENT ON COLUMN DEPARTMENTS.DEPARTMENT_ID
IS
  'Primary key column of departments table.' ;
  COMMENT ON COLUMN DEPARTMENTS.DEPARTMENT_NAME
IS
  'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ' ;
  COMMENT ON COLUMN DEPARTMENTS.MANAGER_ID
IS
  'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.' ;
  COMMENT ON COLUMN DEPARTMENTS.LOCATION_ID
IS
  'Location id where a department is located. Foreign key to location_id column of locations table.' ;
CREATE UNIQUE INDEX DEPT_ID_PK ON DEPARTMENTS
  (
    DEPARTMENT_ID ASC
  )
  TABLESPACE USERS LOGGING ;
  CREATE INDEX DEPT_LOCATION_IX ON DEPARTMENTS
    (
      LOCATION_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  ALTER TABLE DEPARTMENTS ADD CONSTRAINT DEPT_ID_PK PRIMARY KEY ( DEPARTMENT_ID ) USING INDEX DEPT_ID_PK ;

CREATE TABLE EMPLOYEES
  (
    EMPLOYEE_ID    NUMBER (6) NOT NULL ,
    FIRST_NAME     VARCHAR2 (20 BYTE) ,
    LAST_NAME      VARCHAR2 (25 BYTE) CONSTRAINT EMP_LAST_NAME_NN NOT NULL ,
    EMAIL          VARCHAR2 (25 BYTE) CONSTRAINT EMP_EMAIL_NN NOT NULL ,
    PHONE_NUMBER   VARCHAR2 (20 BYTE) ,
    HIRE_DATE      DATE CONSTRAINT EMP_HIRE_DATE_NN NOT NULL ,
    JOB_ID         VARCHAR2 (10 BYTE) CONSTRAINT EMP_JOB_NN NOT NULL ,
    SALARY         NUMBER (8,2) ,
    COMMISSION_PCT NUMBER (2,2) ,
    MANAGER_ID     NUMBER (6) ,
    DEPARTMENT_ID  NUMBER (4)
  )
  TABLESPACE USERS LOGGING ;
ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_SALARY_MIN CHECK ( salary > 0) ;
COMMENT ON TABLE EMPLOYEES
IS
  'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.' ;
  COMMENT ON COLUMN EMPLOYEES.EMPLOYEE_ID
IS
  'Primary key of employees table.' ;
  COMMENT ON COLUMN EMPLOYEES.FIRST_NAME
IS
  'First name of the employee. A not null column.' ;
  COMMENT ON COLUMN EMPLOYEES.LAST_NAME
IS
  'Last name of the employee. A not null column.' ;
  COMMENT ON COLUMN EMPLOYEES.EMAIL
IS
  'Email id of the employee' ;
  COMMENT ON COLUMN EMPLOYEES.PHONE_NUMBER
IS
  'Phone number of the employee; includes country code and area code' ;
  COMMENT ON COLUMN EMPLOYEES.HIRE_DATE
IS
  'Date when the employee started on this job. A not null column.' ;
  COMMENT ON COLUMN EMPLOYEES.JOB_ID
IS
  'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.' ;
  COMMENT ON COLUMN EMPLOYEES.SALARY
IS
  'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)' ;
  COMMENT ON COLUMN EMPLOYEES.COMMISSION_PCT
IS
  'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage' ;
  COMMENT ON COLUMN EMPLOYEES.MANAGER_ID
IS
  'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)' ;
  COMMENT ON COLUMN EMPLOYEES.DEPARTMENT_ID
IS
  'Department id where employee works; foreign key to department_id
column of the departments table' ;
CREATE UNIQUE INDEX EMP_EMAIL_UK ON EMPLOYEES
  (
    EMAIL ASC
  )
  TABLESPACE USERS LOGGING ;
CREATE UNIQUE INDEX EMP_EMP_ID_PK ON EMPLOYEES
  (
    EMPLOYEE_ID ASC
  )
  TABLESPACE USERS LOGGING ;
  CREATE INDEX EMP_DEPARTMENT_IX ON EMPLOYEES
    (
      DEPARTMENT_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX EMP_JOB_IX ON EMPLOYEES
    (
      JOB_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX EMP_MANAGER_IX ON EMPLOYEES
    (
      MANAGER_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX EMP_NAME_IX ON EMPLOYEES
    (
      LAST_NAME ASC ,
      FIRST_NAME ASC
    )
    TABLESPACE USERS LOGGING ;
  ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_EMP_ID_PK PRIMARY KEY ( EMPLOYEE_ID ) USING INDEX EMP_EMP_ID_PK ;
  ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_EMAIL_UK UNIQUE ( EMAIL ) USING INDEX EMP_EMAIL_UK ;

CREATE TABLE JOBS
  (
    JOB_ID     VARCHAR2 (10 BYTE) NOT NULL ,
    JOB_TITLE  VARCHAR2 (35 BYTE) CONSTRAINT JOB_TITLE_NN NOT NULL ,
    MIN_SALARY NUMBER (6) ,
    MAX_SALARY NUMBER (6)
  )
  TABLESPACE USERS LOGGING ;
COMMENT ON TABLE JOBS
IS
  'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.' ;
  COMMENT ON COLUMN JOBS.JOB_ID
IS
  'Primary key of jobs table.' ;
  COMMENT ON COLUMN JOBS.JOB_TITLE
IS
  'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT' ;
  COMMENT ON COLUMN JOBS.MIN_SALARY
IS
  'Minimum salary for a job title.' ;
  COMMENT ON COLUMN JOBS.MAX_SALARY
IS
  'Maximum salary for a job title' ;
CREATE UNIQUE INDEX JOB_ID_PK ON JOBS
  (
    JOB_ID ASC
  )
  TABLESPACE USERS LOGGING ;
  ALTER TABLE JOBS ADD CONSTRAINT JOB_ID_PK PRIMARY KEY ( JOB_ID ) USING INDEX JOB_ID_PK ;

CREATE TABLE JOB_HISTORY
  (
    EMPLOYEE_ID   NUMBER (6) CONSTRAINT JHIST_EMPLOYEE_NN NOT NULL ,
    START_DATE    DATE CONSTRAINT JHIST_START_DATE_NN NOT NULL ,
    END_DATE      DATE CONSTRAINT JHIST_END_DATE_NN NOT NULL ,
    JOB_ID        VARCHAR2 (10 BYTE) CONSTRAINT JHIST_JOB_NN NOT NULL ,
    DEPARTMENT_ID NUMBER (4)
  )
  TABLESPACE USERS LOGGING ;
ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_DATE_INTERVAL CHECK (end_date > start_date) ;
COMMENT ON TABLE JOB_HISTORY
IS
  'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.' ;
  COMMENT ON COLUMN JOB_HISTORY.EMPLOYEE_ID
IS
  'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table' ;
  COMMENT ON COLUMN JOB_HISTORY.START_DATE
IS
  'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)' ;
  COMMENT ON COLUMN JOB_HISTORY.END_DATE
IS
  'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)' ;
  COMMENT ON COLUMN JOB_HISTORY.JOB_ID
IS
  'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.' ;
  COMMENT ON COLUMN JOB_HISTORY.DEPARTMENT_ID
IS
  'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table' ;
CREATE UNIQUE INDEX JHIST_EMP_ID_ST_DATE_PK ON JOB_HISTORY
  (
    EMPLOYEE_ID ASC , START_DATE ASC
  )
  TABLESPACE USERS LOGGING ;
  CREATE INDEX JHIST_JOB_IX ON JOB_HISTORY
    (
      JOB_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX JHIST_EMPLOYEE_IX ON JOB_HISTORY
    (
      EMPLOYEE_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX JHIST_DEPARTMENT_IX ON JOB_HISTORY
    (
      DEPARTMENT_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_EMP_ID_ST_DATE_PK PRIMARY KEY ( EMPLOYEE_ID, START_DATE ) USING INDEX JHIST_EMP_ID_ST_DATE_PK ;

CREATE TABLE LOCATIONS
  (
    LOCATION_ID    NUMBER (4) NOT NULL ,
    STREET_ADDRESS VARCHAR2 (40 BYTE) ,
    POSTAL_CODE    VARCHAR2 (12 BYTE) ,
    CITY           VARCHAR2 (30 BYTE) CONSTRAINT LOC_CITY_NN NOT NULL ,
    STATE_PROVINCE VARCHAR2 (25 BYTE) ,
    COUNTRY_ID     CHAR (2 BYTE)
  )
  TABLESPACE USERS LOGGING ;
COMMENT ON TABLE LOCATIONS
IS
  'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ' ;
  COMMENT ON COLUMN LOCATIONS.LOCATION_ID
IS
  'Primary key of locations table' ;
  COMMENT ON COLUMN LOCATIONS.STREET_ADDRESS
IS
  'Street address of an office, warehouse, or production site of a company.
Contains building number and street name' ;
  COMMENT ON COLUMN LOCATIONS.POSTAL_CODE
IS
  'Postal code of the location of an office, warehouse, or production site
of a company. ' ;
  COMMENT ON COLUMN LOCATIONS.CITY
IS
  'A not null column that shows city where an office, warehouse, or
production site of a company is located. ' ;
  COMMENT ON COLUMN LOCATIONS.STATE_PROVINCE
IS
  'State or Province where an office, warehouse, or production site of a
company is located.' ;
  COMMENT ON COLUMN LOCATIONS.COUNTRY_ID
IS
  'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.' ;
CREATE UNIQUE INDEX LOC_ID_PK ON LOCATIONS
  (
    LOCATION_ID ASC
  )
  TABLESPACE USERS LOGGING ;
  CREATE INDEX LOC_CITY_IX ON LOCATIONS
    (
      CITY ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX LOC_STATE_PROVINCE_IX ON LOCATIONS
    (
      STATE_PROVINCE ASC
    )
    TABLESPACE USERS LOGGING ;
  CREATE INDEX LOC_COUNTRY_IX ON LOCATIONS
    (
      COUNTRY_ID ASC
    )
    TABLESPACE USERS LOGGING ;
  ALTER TABLE LOCATIONS ADD CONSTRAINT LOC_ID_PK PRIMARY KEY ( LOCATION_ID ) USING INDEX LOC_ID_PK ;

CREATE TABLE REGIONS
  (
    REGION_ID   NUMBER CONSTRAINT REGION_ID_NN NOT NULL ,
    REGION_NAME VARCHAR2 (25 BYTE)
  )
  TABLESPACE USERS LOGGING ;
CREATE UNIQUE INDEX REG_ID_PK ON REGIONS
  (
    REGION_ID ASC
  )
  TABLESPACE USERS LOGGING ;
  ALTER TABLE REGIONS ADD CONSTRAINT REG_ID_PK PRIMARY KEY ( REGION_ID ) USING INDEX REG_ID_PK ;

ALTER TABLE COUNTRIES ADD CONSTRAINT COUNTR_REG_FK FOREIGN KEY ( REGION_ID ) REFERENCES REGIONS ( REGION_ID ) NOT DEFERRABLE ;

ALTER TABLE DEPARTMENTS ADD CONSTRAINT DEPT_LOC_FK FOREIGN KEY ( LOCATION_ID ) REFERENCES LOCATIONS ( LOCATION_ID ) NOT DEFERRABLE ;

ALTER TABLE DEPARTMENTS ADD CONSTRAINT DEPT_MGR_FK FOREIGN KEY ( MANAGER_ID ) REFERENCES EMPLOYEES ( EMPLOYEE_ID ) NOT DEFERRABLE ;

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_DEPT_FK FOREIGN KEY ( DEPARTMENT_ID ) REFERENCES DEPARTMENTS ( DEPARTMENT_ID ) NOT DEFERRABLE ;

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_JOB_FK FOREIGN KEY ( JOB_ID ) REFERENCES JOBS ( JOB_ID ) NOT DEFERRABLE ;

ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_MANAGER_FK FOREIGN KEY ( MANAGER_ID ) REFERENCES EMPLOYEES ( EMPLOYEE_ID ) NOT DEFERRABLE ;

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_DEPT_FK FOREIGN KEY ( DEPARTMENT_ID ) REFERENCES DEPARTMENTS ( DEPARTMENT_ID ) NOT DEFERRABLE ;

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_EMP_FK FOREIGN KEY ( EMPLOYEE_ID ) REFERENCES EMPLOYEES ( EMPLOYEE_ID ) NOT DEFERRABLE ;

ALTER TABLE JOB_HISTORY ADD CONSTRAINT JHIST_JOB_FK FOREIGN KEY ( JOB_ID ) REFERENCES JOBS ( JOB_ID ) NOT DEFERRABLE ;

ALTER TABLE LOCATIONS ADD CONSTRAINT LOC_C_ID_FK FOREIGN KEY ( COUNTRY_ID ) REFERENCES COUNTRIES ( COUNTRY_ID ) NOT DEFERRABLE ;

CREATE OR REPLACE TRIGGER SECURE_EMPLOYEES 
    BEFORE INSERT OR UPDATE OR DELETE ON EMPLOYEES 
BEGIN
  secure_dml;
END secure_employees; 
/



CREATE OR REPLACE TRIGGER UPDATE_JOB_HISTORY 
    AFTER UPDATE OF JOB_ID, DEPARTMENT_ID ON EMPLOYEES 
    FOR EACH ROW 
BEGIN
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END; 
/



--CONSULTAS PRIMER LABORATORIO GUILLERMO ALEXANDER CORNEJO ARGUETA
--Consulta 1
SELECT FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, HIRE_DATE DESC;

--Consulta 2
SELECT 
    e1.EMPLOYEE_ID || ' ' || e1.FIRST_NAME || ' ' || e1.LAST_NAME AS Employee,
    e2.EMPLOYEE_ID || ' ' || e2.FIRST_NAME || ' ' || e2.LAST_NAME AS Manager
FROM 
    EMPLOYEES e1,
    EMPLOYEES e2
WHERE 
    e1.MANAGER_ID = e2.EMPLOYEE_ID;

--Consulta 3
SELECT 
    r.REGION_ID, REGION_NAME, COUNTRY_NAME
FROM 
    REGIONS r, COUNTRIES c
WHERE 
    r.REGION_ID = c.REGION_ID;

--Consulta 4
SELECT 
    e.EMPLOYEE_ID, FIRST_NAME, LAST_NAME, START_DATE, END_DATE
FROM 
    EMPLOYEES e, JOB_HISTORY j
WHERE 
    e.EMPLOYEE_ID = j.EMPLOYEE_ID;

--Consulta 5

SELECT 
    FIRST_NAME || ' ' || LAST_NAME AS Employee, 
    SALARY AS Salary, 
    COMMISSION_PCT AS Percentage,
    NVL(COMMISSION_PCT * SALARY, 0) AS Commission, 
    SALARY + NVL(COMMISSION_PCT * SALARY, 0) AS "Total Salary"
FROM 
    EMPLOYEES;

--Consulta 6
SELECT 
    JOB_TITLE, SALARY
FROM 
    EMPLOYEES e, JOBS j
WHERE 
    e.JOB_ID = j.JOB_ID
    AND (MANAGER_ID = 100 OR MANAGER_ID = 125)
    AND SALARY > 6000;

--Consulta 7

SELECT 
    l.LOCATION_ID, CITY, DEPARTMENT_NAME
FROM 
    DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE 
    d.LOCATION_ID = l.LOCATION_ID
    AND l.COUNTRY_ID = c.COUNTRY_ID
    AND c.COUNTRY_ID != 'US';

--Consulta 8
SELECT 
    r.REGION_ID, REGION_NAME, COUNTRY_NAME
FROM 
    REGIONS r, COUNTRIES c
WHERE 
    r.REGION_ID = c.REGION_ID 
    AND REGION_NAME = 'Asia';

--Consulta 9 
SELECT 
    r.REGION_ID, REGION_NAME, l.LOCATION_ID, c.COUNTRY_ID, COUNTRY_NAME
FROM 
    LOCATIONS l, REGIONS r, COUNTRIES c
WHERE 
    l.COUNTRY_ID = c.COUNTRY_ID
    AND c.REGION_ID = r.REGION_ID
    AND l.LOCATION_ID > 2400;

--Consulta 10
SELECT 
    a.REGION_ID AS "Region", 
    a.REGION_NAME AS "Nombre region", 
    'Codigo Pais :' || b.COUNTRY_ID || ' Nombre :' || b.COUNTRY_NAME AS "Pais", 
    c.LOCATION_ID AS "Localización", 
    c.ADDRESS AS "Direccion", 
    c.POSTAL_CODE AS "Código Postal"
FROM 
    REGIONS a, COUNTRIES b, LOCATIONS c
WHERE 
    a.REGION_ID = b.REGION_ID
    AND b.COUNTRY_ID = c.COUNTRY_ID
    AND c.POSTAL_CODE IS NOT NULL;

--Consulta 11
SELECT 
    AVG(SALARY)
FROM 
    EMPLOYEES
WHERE 
    DEPARTMENT_ID IN (30, 80);

--Consulta 12
SELECT 
    REGION_NAME AS REGION_NOMBRE,
    COUNTRY_NAME AS PAIS_NOMBRE,
    STATE_PROVINCE AS PROVINCIA,
    e.MANAGER_ID AS GERENTE_ID,
    e.FIRST_NAME AS PRIMER_NOMBRE,
    e.LAST_NAME AS APELLIDO
FROM 
    EMPLOYEES e,
    DEPARTMENTS d,
    LOCATIONS l,
    COUNTRIES c,
    REGIONS r
WHERE 
    e.MANAGER_ID = d.MANAGER_ID
    AND d.LOCATION_ID = l.LOCATION_ID
    AND l.COUNTRY_ID = c.COUNTRY_ID
    AND c.REGION_ID = r.REGION_ID
    AND c.COUNTRY_ID IN ('UK', 'US')
    AND STATE_PROVINCE IN ('Washington', 'Oxford');

--Consulta 13
SELECT FIRST_NAME || ' ' || LAST_NAME, COUNTRY_NAME
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID
AND l.COUNTRY_ID = c.COUNTRY_ID
AND COUNTRY_NAME LIKE 'C%';

--Consulta 14
SELECT JOB_TITLE, FIRST_NAME || ' ' || LAST_NAME
FROM JOBS j, EMPLOYEES e
WHERE j.JOB_ID = e.JOB_ID
AND EMAIL = 'NKOCHHAR'
AND HIRE_DATE = '1989/09/21';

--Consulta 15
SELECT FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10, 20, 80)
AND MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 6
AND COMMISSION_PCT >= 0.2
AND (FIRST_NAME LIKE 'J%' OR LAST_NAME LIKE 'J%');

--Consulta 16
SELECT FIRST_NAME || ' ' || LAST_NAME, DEPARTMENT_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND PHONE_NUMBER LIKE '515%'
AND LENGTH(PHONE_NUMBER) <= 12;

--Consulta 17
SELECT e.EMPLOYEE_ID, FIRST_NAME || ',' || LAST_NAME AS "Full Name", SALARY AS Salary,
d.DEPARTMENT_ID AS "Department Code", DEPARTMENT_NAME AS Description
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND DEPARTMENT_NAME = 'IT'
ORDER BY SALARY DESC;

--Consulta 18
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_NAME, STREET_ADDRESS, POSTAL_CODE, CITY
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID
AND d.DEPARTMENT_ID IN (100, 80, 50)
AND CITY = 'South San Francisco'
AND SALARY BETWEEN 4000 AND 8000;

--Consulta 19
SELECT EMPLOYEE_ID AS Code, LAST_NAME || ', ' || FIRST_NAME AS Names, 
       INITCAP(email) || '@eisi.ues.edu.sv' AS email,
       '(' || SUBSTR(PHONE_NUMBER, 1, 3) || ') - ' || SUBSTR(PHONE_NUMBER, 5, 3) || ' - ' || SUBSTR(PHONE_NUMBER, 9, 4) AS Phone
FROM EMPLOYEES
WHERE LENGTH(PHONE_NUMBER) <= 12
UNION
SELECT EMPLOYEE_ID AS Code, LAST_NAME || ', ' || FIRST_NAME AS Names, 
       INITCAP(email) || '@eisi.ues.edu.sv' AS email,
       '(' || SUBSTR(PHONE_NUMBER, 1, 3) || ') - ' || SUBSTR(PHONE_NUMBER, 5, 2) || ' - ' || SUBSTR(PHONE_NUMBER, 8, 4) || ' - ' || SUBSTR(PHONE_NUMBER, 13, 6) AS Phone
FROM EMPLOYEES
WHERE LENGTH(PHONE_NUMBER) > 12
ORDER BY 1;

--Consulta 20
SELECT CITY, COUNTRY_ID,
       (CASE
           WHEN COUNTRY_ID IN (SELECT COUNTRY_ID FROM COUNTRIES WHERE COUNTRY_NAME = 'United Kingdom') THEN
               'UNKing'
           ELSE
               'Non-UNKing'
       END) AS "Is UNKing?"
FROM LOCATIONS
WHERE CITY LIKE 'S%';

--Consulta 21
SELECT DEPARTMENT_ID AS "Department Code", COUNT(*) AS "Number of Employees"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY 2;

--Consulta 22
SELECT FIRST_NAME
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) > 1;

--Consulta 23
SELECT FIRST_NAME
FROM EMPLOYEES
GROUP BY FIRST_NAME
HAVING COUNT(*) = 1;

--Consulta 24
SELECT r.REGION_ID, REGION_NAME, COUNT(*)
FROM REGIONS r, COUNTRIES c
WHERE r.REGION_ID = c.REGION_ID
GROUP BY r.REGION_ID, REGION_NAME
ORDER BY 3 DESC;

--Consulta 25
SELECT j.JOB_ID, COUNT(*) AS "number"
FROM EMPLOYEES e, JOBS j
WHERE e.JOB_ID = j.JOB_ID
GROUP BY j.JOB_ID
ORDER BY 2 DESC;

--Consulta 26
SELECT d.DEPARTMENT_ID, DEPARTMENT_NAME, COUNT(*)
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME;

--Consulta 27
SELECT r.REGION_ID, COUNT(*)
FROM DEPARTMENTS d, LOCATIONS l, COUNTRIES c, REGIONS r
WHERE d.LOCATION_ID = l.LOCATION_ID
AND l.COUNTRY_ID = c.COUNTRY_ID
AND c.REGION_ID = r.REGION_ID
GROUP BY r.REGION_ID
ORDER BY 1 ASC;

--Consulta 28
SELECT d.DEPARTMENT_ID, DEPARTMENT_NAME, SUM(SALARY)
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, DEPARTMENT_NAME
ORDER BY 3 DESC;

--Consulta 29
SELECT EXTRACT(YEAR FROM HIRE_DATE) AS "Year",
       MIN(SALARY) AS "Minimum Salary",
       MAX(SALARY) AS "Maximum Salary",
       AVG(SALARY) AS "Average Salary"
FROM EMPLOYEES
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY 1 DESC;

--Consulta 30
SELECT d.DEPARTMENT_ID AS "Department Code", j.JOB_ID AS "Job Position", COUNT(*) AS "Count"
FROM DEPARTMENTS d, JOBS j, EMPLOYEES e
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND e.JOB_ID = j.JOB_ID
AND d.DEPARTMENT_ID IN (50, 80)
GROUP BY d.DEPARTMENT_ID, j.JOB_ID
ORDER BY d.DEPARTMENT_ID DESC, j.JOB_ID DESC;

--Consulta 31
SELECT DEPARTMENT_ID AS "Department Code", JOB_ID AS "Job Position", COUNT(*) AS "Count"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
HAVING COUNT(*) = 1;

--Consulta 32
SELECT CITY, COUNT(*)
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.LOCATION_ID = l.LOCATION_ID
AND SALARY >= 5000
GROUP BY CITY
HAVING COUNT(*) > 3;

--Consulta 33
SELECT DEPARTMENT_ID AS "Department Code", COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 10;

--Consulta 34
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

--Consulta 35
SELECT DEPARTMENT_NAME, FIRST_NAME, LAST_NAME
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND d.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'John');

--Consulta 36
SELECT DEPARTMENT_ID, FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES e1
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES e2 WHERE e1.DEPARTMENT_ID = e2.DEPARTMENT_ID);

--Consulta 37
SELECT d.DEPARTMENT_ID, DEPARTMENT_NAME, SALARY
FROM DEPARTMENTS d, EMPLOYEES e
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES e2 WHERE e.DEPARTMENT_ID = e2.DEPARTMENT_ID);

--Consulta 38
SELECT *
FROM EMPLOYEES e1
WHERE 2 = (SELECT COUNT(*) FROM EMPLOYEES e2 WHERE e1.DEPARTMENT_ID = e2.DEPARTMENT_ID);

--Consulta 39
SELECT DEPARTMENT_ID, FIRST_NAME || ' ' || LAST_NAME
FROM EMPLOYEES e1
WHERE (SELECT COUNT(*) FROM EMPLOYEES e2 WHERE e1.DEPARTMENT_ID = e2.DEPARTMENT_ID) < 10
ORDER BY DEPARTMENT_ID;

--Consulta 40
SELECT DEPARTMENT_ID, FIRST_NAME || ' ' || LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30
AND SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 30);

--Consulta 41
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS d
WHERE NOT EXISTS (SELECT * FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID);

--Consulta 42
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> 30
AND SALARY > ALL (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = 30);

--Consulta 43
SELECT e1.EMPLOYEE_ID, e1.FIRST_NAME || ' ' || e1.LAST_NAME, COUNT(*)
FROM EMPLOYEES e1, EMPLOYEES e2
WHERE e2.MANAGER_ID = e1.EMPLOYEE_ID
AND e2.MANAGER_ID IN (SELECT d.MANAGER_ID FROM DEPARTMENTS d WHERE d.MANAGER_ID IS NOT NULL)
AND (SELECT COUNT(*)
     FROM EMPLOYEES e3, EMPLOYEES e4
     WHERE e3.MANAGER_ID = e4.EMPLOYEE_ID
     AND e3.MANAGER_ID = e1.EMPLOYEE_ID) > 5
GROUP BY e1.EMPLOYEE_ID, e1.FIRST_NAME || ' ' || e1.LAST_NAME;

--Consulta 44
SELECT a.EMPLOYEE_ID, a.LAST_NAME, a.SALARY, b.REGION_NAME, c.COUNTRY_NAME, d.STATE_PROVINCE,
       e.DEPARTMENT_ID, e.DEPARTMENT_NAME
FROM EMPLOYEES a, REGIONS b, COUNTRIES c, LOCATIONS d, DEPARTMENTS e
WHERE a.DEPARTMENT_ID = e.DEPARTMENT_ID
AND e.LOCATION_ID = d.LOCATION_ID
AND d.COUNTRY_ID = c.COUNTRY_ID
AND c.REGION_ID = b.REGION_ID
AND a.SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEES g
                WHERE a.DEPARTMENT_ID = g.DEPARTMENT_ID)
AND d.STATE_PROVINCE <> 'Texas'
AND e.DEPARTMENT_NAME <> 'Finance'
ORDER BY a.EMPLOYEE_ID;
