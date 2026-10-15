# University Course Management System (SQL Project)

## 📌 Project Overview

The University Course Management System is a database management project developed using MySQL. It is designed to manage university departments, students, courses, instructors, and student enrollments.

This project demonstrates how SQL can be used to create relational databases, manage academic records, retrieve information, and perform data analysis using SQL queries.

## 🎯 Project Objectives

- Create and manage a university database.
- Store student, course, department, instructor, and enrollment details.
- Establish relationships between tables using primary keys and foreign keys.
- Perform CRUD operations (Create, Read, Update, Delete).
- Retrieve and filter records using SQL queries.
- Analyze data using aggregate functions.
- Practice INNER JOIN and LEFT JOIN.
- Use subqueries, conditional statements, date functions, and window functions.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Query Language:** SQL
- **Database Tool:** MySQL Workbench (or another compatible MySQL client)

## 🗂️ Database Name

`university_course_management`

## 📋 Database Tables

This project contains five relational tables.

### 1. Departments

Stores information about university departments.

| Column | Description |
|---|---|
| departmentid | Unique department ID (Primary Key) |
| departmentname | Department name |

### 2. Students

Stores student information and university enrollment dates.

| Column | Description |
|---|---|
| studentid | Unique student ID (Primary Key) |
| firstname | Student's first name |
| lastname | Student's last name |
| email | Unique student email |
| birthdate | Student's date of birth |
| enrollmentdate | University enrollment date |

### 3. Courses

Stores course details and their associated departments.

| Column | Description |
|---|---|
| courseid | Unique course ID (Primary Key) |
| coursename | Course name |
| departmentid | Department ID (Foreign Key) |
| credits | Course credits |

### 4. Instructors

Stores instructor details, department assignments, and salaries.

| Column | Description |
|---|---|
| instructorid | Unique instructor ID (Primary Key) |
| firstname | Instructor's first name |
| lastname | Instructor's last name |
| email | Unique instructor email |
| departmentid | Department ID (Foreign Key) |
| salary | Instructor's salary |

### 5. Enrollments

Stores student enrollment records for courses.

| Column | Description |
|---|---|
| enrollmentid | Unique enrollment ID (Primary Key) |
| studentid | Student ID (Foreign Key) |
| courseid | Course ID (Foreign Key) |
| enrollmentdate | Course enrollment date |

## 🔗 Database Relationships

- One department can have multiple courses.
- One department can have multiple instructors.
- One student can enroll in multiple courses.
- One course can have multiple students.
- The enrollments table connects students and courses using foreign keys.

These relationships help maintain referential integrity between the tables.

## 📚 SQL Concepts Covered

### Database and Table Management
- `CREATE DATABASE IF NOT EXISTS`
- `USE`
- `CREATE TABLE`
- Primary Keys
- Foreign Keys
- `NOT NULL` and `UNIQUE` constraints

### Data Manipulation
- `INSERT INTO`
- `UPDATE`
- `DELETE`

### Data Retrieval and Filtering
- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- Date-based filtering

### Joins
- `INNER JOIN`
- `LEFT JOIN`

### Aggregate Functions
- `COUNT()`
- `AVG()`
- `MAX()`

### Grouping and Filtering
- `GROUP BY`
- `HAVING`
- `DISTINCT`

### Advanced SQL
- Subqueries
- `IN`
- `CONCAT()`
- `YEAR()`
- `CURDATE()`
- `DATE_SUB()`
- `CASE WHEN`
- Window Functions
- `COUNT() OVER()`

## 📊 Queries and Analysis Performed

The project includes SQL queries to:

1. Display records from all five tables.
2. Insert a new student record.
3. Update a student's email address.
4. Delete a student record.
5. Retrieve students enrolled from a specified date onward.
6. Find Mathematics department courses using INNER JOIN.
7. Count distinct students enrolled in each course.
8. Find students enrolled in both Introduction to SQL and Data Structures.
9. Calculate the average credits of all courses.
10. Find the highest instructor salary in the Computer Science department.
11. Count distinct enrolled students by department.
12. Display student names and their enrolled courses using INNER JOIN.
13. Display all students and their course details using LEFT JOIN.
14. Find students enrolled in courses with more than ten distinct students.
15. Extract the enrollment year for each student.
16. Display instructors' full names using CONCAT().
17. Calculate a running total of enrollment records.
18. Classify students as senior or junior based on their university enrollment date.

## ⚙️ How to Run the Project

### Step 1: Install MySQL

Install MySQL Server and a SQL client such as MySQL Workbench.

### Step 2: Create the SQL File

Save the SQL code in a file named:

`university_course_management.sql`

### Step 3: Open MySQL Workbench

Connect to your MySQL server and open the saved SQL file.

### Step 4: Execute the SQL Script

Run the SQL statements in order:

1. Create and select the database.
2. Create the five tables.
3. Insert the sample records.
4. Execute the SELECT queries.
5. Run the INSERT, UPDATE, DELETE, JOIN, and analysis queries.

### Step 5: Verify the Results

Use the SELECT statements to verify table records and confirm the query results.

**Note:** The script does not drop existing tables before creating them. If you run the entire script again in the same database, MySQL may return table-already-exists or duplicate-key errors. Use a fresh database or prepare a suitable reset procedure before rerunning the full script.

## 🧪 Sample Dataset

The project includes:

- **Departments:** 2 records
- **Students:** 6 initial records
- **Courses:** 6 records
- **Instructors:** 4 records
- **Enrollments:** 10 records

An additional student record is inserted, updated, and deleted to demonstrate data manipulation operations.

## 💡 Key Learnings

Through this project, I practiced:

- Relational database design.
- Creating tables and defining relationships.
- Managing data with CRUD operations.
- Writing multi-table JOIN queries.
- Applying aggregate functions for analysis.
- Using GROUP BY and HAVING to filter grouped results.
- Writing subqueries for advanced filtering.
- Working with SQL date and string functions.
- Applying CASE statements for conditional classification.
- Calculating running totals using window functions.

## 🚀 Future Improvements

- Add more departments, students, courses, and instructors.
- Add validation rules for credits and salaries.
- Prevent duplicate enrollments in the same course.
- Add indexes to improve query performance.
- Create additional reports for department and course analysis.
- Develop a front-end application connected to the database.

## 👨‍💻 Author

**University Course Management System — SQL Project**

Created as a learning project to practice MySQL, relational database management, and SQL data analysis.

## 📄 License

This project is intended for educational and learning purposes.
