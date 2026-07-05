# Contributing Guidelines

Thank you for your interest in contributing to the **E-Learning Management System Database** project! Contributions from database developers, software engineers, and technical writers are always welcome.

To ensure a smooth collaboration, please follow the guidelines outlined below.

---

## 🛠️ Code of Conduct
By participating in this project, you agree to maintain a professional, respectful, and inclusive environment for everyone.

---

## 🎯 How Can I Contribute?

### 1. Reporting Bugs / Issues
If you identify errors in the SQL schema definitions (DDL), sample data seeds (DML), or analytical queries, please open an Issue.
- Provide a clear title and description.
- Paste the exact error message and the MySQL server version you are running.
- Provide a minimal reproducible example if applicable.

### 2. Suggesting Schema Enhancements
If you have ideas for indexing strategies, stored procedures, audit tables, or new entities:
- Open an Issue first to discuss the design.
- Explain the business rules, data model changes, and performance benefits.

### 3. Writing and Improving Queries
If you want to contribute new queries to `sample_queries.sql`:
- Ensure the query runs cleanly on the existing schema.
- Follow the SQL style guide (see below).
- Explain what metrics the query extracts and how it benefits developers.

---

## 📜 SQL Style Guide

To maintain a clean and readable codebase, please adhere to these formatting guidelines:

*   **Capitalization**: Write all SQL keywords in **UPPERCASE** (e.g., `SELECT`, `FROM`, `WHERE`, `JOIN`, `ON`, `GROUP BY`, `ORDER BY`).
*   **Identifiers**: Write table names and column names exactly as they are defined in the schema (e.g., `STUDENT`, `Course_ID`, `First_Name`).
*   **Indentation**: Format multi-line queries for readability. Indent clauses by 4 spaces.
    ```sql
    SELECT 
        c.Course_Title,
        COUNT(e.Student_ID) AS Total_Enrollments
    FROM COURSE c
    LEFT JOIN ENROLLMENT e ON c.Course_ID = e.Course_ID
    GROUP BY c.Course_ID, c.Course_Title
    ORDER BY Total_Enrollments DESC;
    ```
*   **Aliases**: Use short, descriptive table aliases when joining (e.g., `s` for `STUDENT`, `e` for `ENROLLMENT`). Always use the `AS` keyword when renaming aggregated columns.
*   **Terminators**: End every SQL statement with a semicolon (`;`).

---

## 🚀 Pull Request Process

1.  **Fork the Repository**: Create a personal copy of this repository on GitHub.
2.  **Create a Feature Branch**:
    ```bash
    git checkout -b feature/your-feature-name
    ```
3.  **Validate Changes**: Import the modified schema or query file to a local MySQL server and run it to verify there are no syntax or relational errors.
4.  **Commit Your Changes**: Follow clear commit messaging:
    ```bash
    git commit -m "docs: improve query performance in sample_queries.sql"
    ```
5.  **Submit the PR**: Open a pull request against the `main` branch of this repository. Provide a detailed summary of your changes.
