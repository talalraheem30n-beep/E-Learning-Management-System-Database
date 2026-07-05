# Database Installation & Setup Guide

This guide details how to install the local database environment, import the schema and sample dataset, and verify the installation.

---

## 📋 Prerequisites

To run this project, you need:
- **MySQL Server** (v8.0 or later recommended)
- **phpMyAdmin** (optional, recommended for web GUI administration) or **MySQL Workbench** / **dBeaver**
- A terminal or command prompt (if installing via command-line interface)

---

## 🛠️ Step 1: Install MySQL Server

### Windows
1. Download the **MySQL Installer** from the [MySQL Downloads Portal](https://dev.mysql.com/downloads/installer/).
2. Run the installer and choose **Developer Default** or **Server Only**.
3. During setup, configure the server to run as a service, and specify a strong password for the `root` account.
4. Keep the default port `3306` open.

### macOS
1. Install using Homebrew:
   ```bash
   brew install mysql
   ```
2. Start the MySQL service:
   ```bash
   brew services start mysql
   ```
3. Secure the installation and set the root password:
   ```bash
   mysql_secure_installation
   ```

### Linux (Ubuntu/Debian)
1. Update system packages and install MySQL Server:
   ```bash
   sudo apt update
   sudo apt install mysql-server
   ```
2. Start the service:
   ```bash
   sudo systemctl start mysql.service
   ```
3. Secure the configuration:
   ```bash
   sudo mysql_secure_installation
   ```

---

## 🌐 Step 2: Open and Set Up phpMyAdmin

If you are using a local web development environment (such as XAMPP, WAMP, or MAMP):
1. Start the **Apache** and **MySQL** modules from the control panel.
2. Open your web browser and navigate to `http://localhost/phpmyadmin`.
3. Log in using your MySQL credentials (the default user is usually `root` with a blank or configured password).

---

## 🗃️ Step 3: Create the Database

### Option A: Using phpMyAdmin (GUI)
1. On the left sidebar of the phpMyAdmin dashboard, click **New**.
2. Set the **Database name** to `elearning_db`.
3. In the collation dropdown, select `utf8mb4_general_ci` or `utf8mb4_unicode_ci` for modern character support.
4. Click **Create**.

### Option B: Using MySQL CLI
1. Log in to the MySQL command line:
   ```bash
   mysql -u root -p
   ```
2. Run the creation query:
   ```sql
   CREATE DATABASE elearning_db CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   ```

---

## 📥 Step 4: Import SQL Scripts

The setup files must be imported in a specific order: first the schema structure (DDL), then the mock dataset (DML).

### Order of Imports:
1.  [`database_schema.sql`](../database/database_schema.sql)
2.  [`sample_data.sql`](../database/sample_data.sql)

### Option A: Using phpMyAdmin
1. Select your newly created database `elearning_db` from the left sidebar.
2. Click the **Import** tab on the top menu.
3. Click **Choose File** and select `database/database_schema.sql`.
4. Click **Import** (or **Go** depending on your phpMyAdmin version) at the bottom.
5. Once complete, click the **Import** tab again.
6. Click **Choose File** and select `database/sample_data.sql`.
7. Click **Import** (or **Go**) to populate the tables.

### Option B: Using MySQL CLI
1. Navigate to the root directory where you cloned the repository.
2. Execute the schema script:
   ```bash
   mysql -u username -p elearning_db < database/database_schema.sql
   ```
3. Execute the data seeding script:
   ```bash
   mysql -u username -p elearning_db < database/sample_data.sql
   ```

---

## 🔍 Step 5: Verify Successful Installation

Ensure all tables were created and populated successfully.

### Option A: Check Tables via phpMyAdmin
1. Click on the database `elearning_db` in phpMyAdmin.
2. Verify that **19 tables** appear under the structure tab.
3. Click on the `student` or `course` table to view seeded entries.

### Option B: Run Verification Queries via CLI
Log in to MySQL and run:
```sql
USE elearning_db;

-- 1. Verify the list of tables (should return 19 rows)
SHOW TABLES;

-- 2. Count the student records (should return 55)
SELECT COUNT(*) FROM STUDENT;

-- 3. Count the course records (should return 55)
SELECT COUNT(*) FROM COURSE;

-- 4. Test a relational JOIN
SELECT 
    c.Course_Title, 
    CONCAT(i.First_Name, ' ', i.Last_Name) AS Instructor_Name
FROM COURSE c
INNER JOIN INSTRUCTOR i ON c.Instructor_ID = i.Instructor_ID
LIMIT 5;
```

If the tables are populated and the JOIN returns active records, your installation is complete and verified!
