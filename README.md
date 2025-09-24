# Medical-Insurance-SQL-Project
This project uses a medical insurance dataset (1,338 records) to practice SQL basics:
- Data cleaning
- Table restructuring
- Basic CRUD operations (Insert, Update, Delete)

## Dataset

| Column   | Description                                                   |
|----------|---------------------------------------------------------------|
| age      | Age of the insurance beneficiary                              |
| gender   | Male or Female                                                |
| bmi      | Body Mass Index (body fat estimate based on height & weight)  |
| children | Number of children covered by the insurance                   |
| smoker   | Smoking status (yes / no)                                     |
| region   | Residential region in the US (northeast, northwest, etc.)     |
| charges  | Medical insurance cost billed to the beneficiary              |

--- 
## 🔧 What I Practiced

- Exploring data with `SELECT` and `COUNT`
- Checking and cleaning missing or invalid values
- Renaming columns
- Creating a table with an `id` column
- CRUD operations:
  - **INSERT**: add new data
  - **UPDATE**: correct data
  - **DELETE**: remove unwanted data

--- 

## 💻 Example SQL Queries

### 1️⃣ Explore Data
```sql
-- Show first 10 rows
SELECT * FROM insurance LIMIT 10;

-- Count rows
SELECT COUNT(*) FROM insurance;

-- Check for NULL or empty values
SELECT *
FROM insurance
WHERE age IS NULL OR age = ''
   OR bmi IS NULL OR bmi = ''
   OR charges IS NULL OR charges = ''
   OR children IS NULL OR children = ''
   OR region IS NULL OR region = ''
   OR gender IS NULL OR gender = ''
   OR smoker IS NULL OR smoker = '';
--- 
2️⃣ Rename Column
ALTER TABLE insurance
RENAME COLUMN sex TO gender;

3️⃣ Create New Table with id
CREATE TABLE insurance_with_id AS
SELECT ROW_NUMBER() OVER () AS id, * 
FROM insurance;

4️⃣ INSERT Example
INSERT INTO insurance_with_id
(id, age, gender, bmi, children, smoker, region, charges)
VALUES
(2000, 30, 'female', 26.5, 1, 'no', 'southeast', 4200);

5️⃣ UPDATE Example
UPDATE insurance_with_id
SET smoker = 'yes'
WHERE id = 2000;

6️⃣ DELETE Example
DELETE FROM insurance_with_id
WHERE id = 2000;




