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

-- Count total rows
SELECT COUNT(*) FROM insurance;

-- Check for NULL or empty values
SELECT *
FROM insurance
WHERE age IS NULL OR age = ''
   OR bmi IS NULL OR bmi = ''
   OR charges IS NULL OR charges = ''
   OR children IS NULL OR children = ''
   OR region IS NULL OR region = ''
   OR sex IS NULL OR sex = ''
   OR smoker IS NULL OR smoker = '';

 ``` 

--- 

### 2️⃣ Rename Column 
```sql
-- Rename 'sex' column to 'gender'
ALTER TABLE insurance
RENAME COLUMN sex TO gender;

-- Verify change
SELECT gender FROM insurance;

```

--- 
### 3️⃣ Add an ID Column 
```sql
-- Create a new table with auto-generated ID
CREATE TABLE insurance_with_id AS
SELECT ROW_NUMBER() OVER () AS id, *
FROM insurance;

-- Check total rows with IDs
SELECT COUNT(id) FROM insurance_with_id;

-- View data with IDs
SELECT * FROM insurance_with_id LIMIT 10;
```
--- 
### 4️⃣ CRUD Operations  
## ➕ INSERT
```sql
INSERT INTO insurance_with_id
(age, gender, bmi, children, smoker, region, charges)
VALUES (25, 'female', 26.5, 2, 'no', 'Egypt', 5400.75);
```
--- 
## ✏️ UPDATE 
```sql
UPDATE insurance_with_id
SET region = 'North Africa'
WHERE id = 101;
 
```
--- 
## 🗑️ DELETE 

```sql
DELETE FROM insurance_with_id
WHERE id = 2;
```
---  
## 🚀 How to Use This Project

1. **Clone or download the repository**
   ```bash
   git clone https://github.com/<your-username>/Medical-Insurance-SQL-Project.git
   ```
   --- 
2-**Open your SQL environment**
You can use any tool like SQLite, MySQL Workbench, DBeaver, or PostgreSQL. 
--- 

3-**Import the dataset**
Load the insurance.csv file
--- 
   
## 🙋‍♀️ About Me
**Shereen Wagdy**  
📩 Email: shereenwagdy214@gmail.com  
💼 Role: Junior Data & Product Analyst — SQL • Data Cleaning • CRUD Operations  

I’m passionate about turning raw data into meaningful insights.  
This project was created to practice real SQL skills, including data exploration, cleaning, table restructuring, and CRUD operations, on a medical insurance dataset.








-
