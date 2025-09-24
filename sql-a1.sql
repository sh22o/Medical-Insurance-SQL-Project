--SQL A-1 
--STEP 1 : Data cleaning 

--FOR EXPLORE DATA ROWS WITH LIMIT 10 
SELECT * FROM insurance i LIMIT 10 ; 

--COUNT OF Data = 1,338 
SELECT COUNT (*) FROM insurance i ; 

---- CHECK FOR NULL VALUE  
 SELECT * 
FROM insurance i
WHERE i.age IS NULL OR i.age = ''
   OR i.bmi IS NULL OR i.bmi = ''
   OR i.charges IS NULL OR i.charges =''
   OR i.children IS NULL OR i.children=''
   OR i.region IS NULL OR i.region = ''
   OR i.sex IS NULL OR i.sex = ''
   OR i.smoker IS NULL OR i.smoker = '';
 
 -- END STEP 1 

--STEP 2 : Data data exploration 

--update table name from sex to gender 
ALTER TABLE insurance
RENAME COLUMN sex TO gender;

-- view all data from gender to check update right  
SELECT i.gender FROM insurance i  

--insert id as primary key auto on all dataset   

-- recreate table with id 
CREATE TABLE insurance_with_id AS
SELECT 
    ROW_NUMBER() OVER () AS id,
    *
FROM insurance; 

SELECT COUNT(iwi.id ) FROM insurance_with_id iwi 

-- EXPLORING TABLE 
SELECT * FROM insurance_with_id iwi 

--CHECK IF we have zero value on charge or not 
SELECT *
FROM insurance_with_id
WHERE charges = 0;

--insert for table 
INSERT INTO insurance_with_id (age, gender, bmi, children, smoker, region, charges)
VALUES (25 , 'female', 26.5, 2, 'no', 'Egypt', 5400.75); 

Select * from insurance_with_id iwi 
WHERE region = 'Egypt'

--this quary (error without AS >> SQL LIGHT NEED AS )
UPDATE insurance_with_id AS iwi
SET id = 101
WHERE iwi.region = 'Egypt';

Select * from insurance_with_id iwi 
WHERE region = 'Egypt' 

--delete case 
DELETE FROM insurance_with_id
WHERE id = 2;

--recheck quary work 
select * from insurance_with_id iwi 
 