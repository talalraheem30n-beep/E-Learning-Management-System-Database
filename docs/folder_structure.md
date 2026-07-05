# Folder & File Structure

This document details the organization of files and directories within the **E-Learning-Management-System-Database** repository.

---

## 📂 Directory Tree Overview

```text
E-Learning-Management-System-Database/
├── README.md                # Project home page & general documentation
├── LICENSE                  # Open-source MIT License terms
├── .gitignore               # SQL log and local IDE ignore rules
├── CHANGELOG.md             # Project release history log (v1.0.0)
├── CONTRIBUTING.md          # Query style guides and collaboration flow
├── SECURITY.md              # Educational safety guide & security disclosure
├── database/
│   ├── database_schema.sql  # Database structure definitions (DDL)
│   ├── sample_data.sql      # Seeding inserts with 55+ rows per table (DML)
│   └── sample_queries.sql   # 20 practical analytical/reporting queries
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
    ├── Project_Report.pdf   # Complete database design paper (original report)
    ├── installation.md      # Setup, import, and CLI verification guide
    ├── database_overview.md # Schema normalization (1NF-3NF) & constraints analysis
    └── folder_structure.md  # Detailed repository structural guide (this file)
```

---

## 📄 File Descriptions

### 1. Root Directory

-   **[README.md](../README.md)**: The entry point for recruiters and developers. It includes badges, project summary, logical database table classifications, statistics, and quick installation commands.
-   **[LICENSE](../LICENSE)**: Contains the open-source **MIT License**, authorizing anyone to use, copy, modify, or distribute this database blueprint.
-   **[.gitignore](../.gitignore)**: Tells Git to ignore temporary databases, environment secrets, text logs, and local editor settings (e.g., `.vscode/` or `*.sql.log`).
-   **[CHANGELOG.md](../CHANGELOG.md)**: Implements standard project logging, listing what was added or modified under each major release version.
-   **[CONTRIBUTING.md](../CONTRIBUTING.md)**: Outlines guidelines for pull requests and contains a **SQL Style Guide** ensuring that all submitted SQL statements use uppercase keywords, structured indentations, and proper table aliases.
-   **[SECURITY.md](../SECURITY.md)**: Highlights safe coding practices to prevent SQL injections when connecting the database to applications.

---

### 2. Database Directory (`/database`)

-   **[database_schema.sql](../database/database_schema.sql)**: Defines the Data Definition Language (DDL) scripts. It establishes the 19 tables, autoincrements, primary keys, and foreign keys.
-   **[sample_data.sql](../database/sample_data.sql)**: Contains the Data Manipulation Language (DML) scripts. It populates all tables with ~55 mock profiles and values, serving as a functional test suite.
-   **[sample_queries.sql](../database/sample_queries.sql)**: Includes exactly 20 pre-written SQL scripts covering analytical tasks such as financial reconciliations, grade distributions, and curriculum tracking.

---

### 3. Extended Documentation (`/docs`)

-   **[installation.md](installation.md)**: Step-by-step documentation detailing MySQL server setups for WAMP/XAMPP, database creations, imports, and CLI tests.
-   **[database_overview.md](database_overview.md)**: High-level architectural analysis explaining normalization models (1NF to 3NF) and foreign key delete cascade/nullification rules.
-   **[folder_structure.md](folder_structure.md)**: Detailed breakdown explaining the purpose and location of repository directories (this document).
