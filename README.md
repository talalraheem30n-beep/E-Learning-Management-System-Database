# E-Learning Management System Database (LMS Core)

[![MySQL Version](https://img.shields.io/badge/MySQL-8.0%2B-orange?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Storage Engine](https://img.shields.io/badge/Storage%20Engine-InnoDB-blue?style=for-the-badge)](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Interface](https://img.shields.io/badge/Interface-phpMyAdmin-lightgrey?style=for-the-badge&logo=phpmyadmin&logoColor=white)](https://www.phpmyadmin.net/)

An enterprise-grade, fully normalized relational database blueprint designed to power a modern E-Learning Management System (LMS). This repository serves as a production-ready SQL database layer for educational platforms, providing robust structures for managing student profiles, instructor workloads, course curriculums, enrollments, grading systems (quizzes/assignments), financial transactions, feedback collection, live sessions, and automated certificate generation.

---

## 📌 Project Overview

This database architecture was engineered to address the scalability and data integrity challenges faced by digital learning platforms. By moving away from flat-file or poorly structured data representations, this design incorporates rigorous constraints, relational models, and normalization principles to ensure zero data redundancy and maximum transactional reliability.

### Core Features Managed:
- **User Directory**: Distinct schemas for students and instructors, including support for multivalued contact attributes (emails and phone numbers).
- **Curriculum Management**: Multi-tiered course structure including courses, sequential lessons, assignments, and quizzes.
- **Academic Progress & Grading**: Granular tracking of course enrollments, progress status, assignment submissions, quiz attempts, and final grading metrics.
- **Live Classroom Operations**: Scheduling live remote digital classrooms, allocating instructors, and logging student attendance.
- **Financial Ledger**: Automated tracking of invoice payments, receipts, payment methods, and transaction status logs.
- **Engagement & Communication**: System notifications, student course evaluations, and instructor feedback logs.
- **Verifiable Achievements**: Automatic tracking and issuance of certificates with unique verification codes.

---

## ⚙️ Technologies Used

- **Database Management System (DBMS)**: MySQL 8.0+
- **Storage Engine**: InnoDB (for full foreign key support, ACID transactional compliance, and row-level locking)
- **Database Administration Tool**: phpMyAdmin
- **Query Language**: Structured Query Language (SQL) - DDL & DML

---

## 📊 Database Statistics

The schema is populated with realistic mock data simulating an active educational institution:

| Metric | Value |
| :--- | :--- |
| **Total Interconnected Tables** | 19 |
| **Storage Engine** | InnoDB |
| **Seeded Records per Table** | ~55 records |
| **Primary/Foreign Key Constraints** | 20+ relationships |
| **Database Normalization Level** | 3NF / BCNF |

---

## 🗄️ Database Tables Overview

The database is divided into four main logical domains:

### 1. User Profiles & Contact Data
- [`STUDENT`](database/database_schema.sql#L14): Stores personal student profiles.
- [`STUDENT_EMAIL`](database/database_schema.sql#L78): Handles email addresses for students (1:N weak entity).
- [`STUDENT_PHONE`](database/database_schema.sql#L71): Stores contact numbers for students (1:N weak entity).
- [`INSTRUCTOR`](database/database_schema.sql#L5): Maintains instructor professional profiles and credentials.
- [`INSTRUCTOR_EMAIL`](database/database_schema.sql#L84): Stores email addresses for instructors (1:N weak entity).

### 2. Course Curriculum & Materials
- [`COURSE`](database/database_schema.sql#L25): Tracks academic courses, fees, difficulty levels, and assigned instructors.
- [`LESSON`](database/database_schema.sql#L110): Breaks courses down into sequential lessons with duration and content types.
- [`LIVESESSION`](database/database_schema.sql#L162): Details for scheduled live remote digital classrooms.
- [`LIVE_ATTENDANCE`](database/database_schema.sql#L174): Attendance ledger mapping student presence in live sessions.

### 3. Enrollments, Grading & Feedback
- [`ENROLLMENT`](database/database_schema.sql#L99): Bridges students and courses with active tracking of progress and grades.
- [`ASSIGNMENT`](database/database_schema.sql#L121): Tracks course grading requirements, instructions, and deadlines.
- [`ASSIGNMENT_SUBMISSION`](database/database_schema.sql#L132): Records student assignment upload timestamps and codes.
- [`QUIZ`](database/database_schema.sql#L141): Hosts assessment benchmarks, passing scores, and attempt limits.
- [`QUIZ_ATTEMPT`](database/database_schema.sql#L152): Logs quiz attempts, dates, and student scores.
- [`FEEDBACK`](database/database_schema.sql#L183): Stores course evaluations and instructor ratings.

### 4. Transactions, Notifications & Certificates
- [`PAYMENT`](database/database_schema.sql#L36): Records student invoices, transaction status, and payment logs.
- [`PAYMENT_METHOD`](database/database_schema.sql#L90): Maps transaction processing parameters to invoices.
- [`CERTIFICATE`](database/database_schema.sql#L46): Issues credentials, grades, and unique verification numbers.
- [`NOTIFICATION`](database/database_schema.sql#L57): Broadcasts system alerts and message logs.

---

## 📁 Repository Structure

```text
E-Learning-Management-System-Database/
├── README.md                # Project landing page (this file)
├── LICENSE                  # MIT License
├── .gitignore               # SQL-specific ignore patterns
├── CHANGELOG.md             # Version history and releases
├── CONTRIBUTING.md          # Guide for project contributions
├── SECURITY.md              # Security practices and disclosures
├── database/
│   ├── database_schema.sql  # Complete MySQL table definitions (DDL)
│   ├── sample_data.sql      # Seeding statements with 55+ rows per table (DML)
│   └── sample_queries.sql   # 20 practical analytical and reporting queries
├── diagrams/
│   ├── ERD.png              # Entity-Relationship Diagram
│   ├── EERD.png             # Enhanced ERD
│   └── Relational_Schema.png# Relational Schema Design Mapping
├── screenshots/
│   ├── phpmyadmin_dashboard.png # phpMyAdmin database view
│   ├── student_table.png    # Sample records in Student table
│   ├── course_table.png     # Sample records in Course table
│   └── sample_data.png      # Sample data query results
└── docs/
    ├── Project_Report.pdf   # Technical design report
    ├── installation.md      # Step-by-step MySQL/phpMyAdmin setup guide
    ├── database_overview.md # Schema normalization & constraints analysis
    └── folder_structure.md  # Detailed documentation of file structure
```

For a comprehensive explanation of every file, see the [Folder Structure Guide](docs/folder_structure.md).

---

## 🚀 Quick Start & Installation

To deploy the database locally:

### Prerequisites
- MySQL Server (v8.0 or later)
- phpMyAdmin (optional, for web UI management) or MySQL Workbench/CLI

### Import Database
1. Open your terminal or MySQL command line:
   ```bash
   mysql -u your_username -p
   ```
2. Create the target database:
   ```sql
   CREATE DATABASE elearning_db;
   USE elearning_db;
   ```
3. Import the schema (DDL):
   ```bash
   mysql -u your_username -p elearning_db < database/database_schema.sql
   ```
4. Import the sample dataset (DML):
   ```bash
   mysql -u your_username -p elearning_db < database/sample_data.sql
   ```

For detailed platform-specific steps, view the [Installation Guide](docs/installation.md).

---

## 📈 Database Architecture & Schema Design

This database is built on relational integrity and third-normal-form (3NF) validation to support enterprise transactions:

### Entity-Relationship Diagrams (ERD)
The database structure is mapped via standard ERD & EERD principles. Multivalued attributes have been normalized into distinct relational tables to prevent indexing degradation.

*   **Entity-Relationship Diagram (ERD)**: Conceptual data model mapping user nodes and content matrices. [ERD.png](diagrams/ERD.png)
*   **Enhanced Entity-Relationship Diagram (EERD)**: Logical modeling showing the decomposition of M:N relationships into weak identifying entities. [EERD.png](diagrams/EERD.png)
*   **Relational Schema Mapping**: High-definition relational map depicting exact primary key and foreign key bindings. [Relational_Schema.png](diagrams/Relational_Schema.png)

> [!NOTE]
> Detailed analysis of architecture, relationships, constraints, and normalization is available in the [Database Overview Document](docs/database_overview.md).

---

## 📊 Analytical Reports & Sample Queries

The repository includes a collection of 20 production-oriented SQL queries to simulate business intelligence reporting. These can be executed inside the `database/sample_queries.sql` file.

Examples of queries included:
- **Enrollment Metrics**: Identifies the most popular courses by active student enrollment count.
- **Academic Performance Reports**: Extracts average exam scores per student and course, identifying individuals who pass or fail based on thresholds.
- **Financial Reconciliation Ledger**: Summarizes payments received, pending amounts, and transactional failure rates across students.
- **Curriculum Sequencing**: Maps specific course lessons along with their sequential positions and durations.

See [sample_queries.sql](database/sample_queries.sql) to run and analyze these queries.

---

## 🎓 Key Engineering Outcomes

1. **Schema Normalization**: Resolved composite attributes (e.g., student name split to `First_Name` / `Last_Name`) and multivalued values (e.g., telephone/email split to separate tables) to ensure 3NF compliance.
2. **ACID Compliance**: Set storage engine explicitly to `InnoDB` to enforce constraints across 19 interconnected entities and secure transactions.
3. **Data Integrity Guardrails**: Implemented logical delete propagations using `ON DELETE CASCADE` and `ON DELETE SET NULL` constraints to handle dependencies (such as deleting a student record cleanly deleting associated emails, phone numbers, and enrollments).

---

## 🔮 Future Improvements

- **Stored Procedures**: Implement automated routines to issue certificates when student `Progress` reaches 100% in the `ENROLLMENT` table.
- **Indices Optimization**: Create indexing strategies on highly searched fields like `Course_Title` and student/instructor names.
- **Audit Logs**: Build an archive table and MySQL triggers to log changes made to student grades and financial payment status.

---

## 👥 Author

- **Talal Raheem** - *Database Architect & Software Engineer* - [GitHub](https://github.com/)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
