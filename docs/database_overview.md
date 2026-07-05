# Database Architecture & Design Overview

This document provides a technical analysis of the E-Learning Management System Database (LMS Core) architecture. It covers the normalization strategy, relational schema mapping, entity relationships, primary and foreign key constraints, and referential integrity strategies implemented in the project.

---

## 🏛️ Database Architecture

The system uses a relational database design managed by the **MySQL** DBMS and running on the **InnoDB** storage engine. InnoDB was chosen because it enforces **ACID** (Atomicity, Consistency, Isolation, Durability) properties, which are critical for financial logs (`PAYMENT`), grading histories, and academic progress tracking.

The 19 tables in this system are divided into four main domains:
1.  **User Identity Management**: Handles demographics, profile files, and contact paths.
2.  **Course Management**: Structures courses, lessons, and live classrooms.
3.  **Academic Progression & Assessments**: Tracks enrollments, submissions, quizzes, and outcomes.
4.  **Operational Support**: Manages notifications, invoice transactions, and student course feedback.

---

## 📈 Entity Relationships & Weak Entities

To implement a clean relational model, several many-to-many (M:N) conceptual relationships from the initial design were decomposed into **weak identifying entities** (bridge tables) to ensure data integrity and query efficiency:

### 1. Student ↔ Course (M:N)
*   **Decomposition**: Resolved via the [`ENROLLMENT`](../database/database_schema.sql#L99) table.
*   **Relationship**: `STUDENT` (1:N) ↔ `ENROLLMENT` ↔ (N:1) `COURSE`.
*   **Attributes**: Captures `Enrollment_Date`, `Progress` (percentage completed), and the student's current course `Grade`.

### 2. Student ↔ Assignment (M:N)
*   **Decomposition**: Resolved via the [`ASSIGNMENT_SUBMISSION`](../database/database_schema.sql#L132) table.
*   **Relationship**: `STUDENT` (1:N) ↔ `ASSIGNMENT_SUBMISSION` ↔ (N:1) `ASSIGNMENT`.
*   **Attributes**: Logs the exact `Submission_Date` when a student submits an assignment file.

### 3. Student ↔ Quiz (M:N)
*   **Decomposition**: Resolved via the [`QUIZ_ATTEMPT`](../database/database_schema.sql#L152) table.
*   **Relationship**: `STUDENT` (1:N) ↔ `QUIZ_ATTEMPT` ↔ (N:1) `QUIZ`.
*   **Attributes**: Tracks the score achieved (`Score`) and the timestamp (`Attempts_Date`).

### 4. Student ↔ LiveSession (M:N)
*   **Decomposition**: Resolved via the [`LIVE_ATTENDANCE`](../database/database_schema.sql#L174) table.
*   **Relationship**: `STUDENT` (1:N) ↔ `LIVE_ATTENDANCE` ↔ (N:1) `LIVESESSION`.
*   **Attributes**: Records student attendance logs in real-time digital classrooms on a specific `Attendance_Date`.

---

## 📐 Normalization Strategy (1NF to 3NF/BCNF)

To eliminate redundancy and prevent anomalies during insert, update, or delete operations, the schema is designed in accordance with standard normalization rules:

### First Normal Form (1NF)
1.  **Atomicity**: All fields contain atomic values. Conceptual composite attributes like `Name` were flattened into separate `First_Name` and `Last_Name` columns in both [`STUDENT`](../database/database_schema.sql#L14) and [`INSTRUCTOR`](../database/database_schema.sql#L5) tables.
2.  **Eliminating Multivalued Groups**: Multivalued contact options (such as multiple phone numbers or emails per user) were moved into separate child tables:
    *   [`STUDENT_PHONE`](../database/database_schema.sql#L71) (linked to `STUDENT`)
    *   [`STUDENT_EMAIL`](../database/database_schema.sql#L78) (linked to `STUDENT`)
    *   [`INSTRUCTOR_EMAIL`](../database/database_schema.sql#L84) (linked to `INSTRUCTOR`)

### Second Normal Form (2NF)
1.  **Full Functional Dependency**: Every non-key attribute in each table is fully dependent on the entire primary key, not a subset.
2.  In tables with composite keys (such as [`LIVE_ATTENDANCE`](../database/database_schema.sql#L174) which has a primary key composed of `(Student_ID, Session_ID, Attendance_Date)`), the non-key attributes are fully dependent on all three parameters combined.

### Third Normal Form (3NF) & BCNF
1.  **Eliminating Transitive Dependencies**: Non-key attributes do not depend on other non-key attributes. 
2.  For example, in the [`COURSE`](../database/database_schema.sql#L25) table, instead of storing instructor name and contact details directly (which would depend on `Instructor_ID`), the table only stores the foreign key `Instructor_ID`. The instructor details are kept in the parent [`INSTRUCTOR`](../database/database_schema.sql#L5) table.
3.  Similarly, the [`PAYMENT`](../database/database_schema.sql#L36) table isolates student transactions, and payment processing is handled in the 1:1 mapped [`PAYMENT_METHOD`](../database/database_schema.sql#L90) table using `Slip_id`.

---

## 🔒 Key Constraints & Data Integrity

To prevent orphaned records and corrupted relational states, foreign keys are configured with automated delete policies:

### 1. Cascade Deletion (`ON DELETE CASCADE`)
This policy is applied to dependent weak entities. If a parent record is deleted, all matching records in child tables are instantly purged:
- Deleting a `STUDENT` automatically purges their emails, phone numbers, enrollments, quiz attempts, assignment submissions, payments, live attendance, and certificates.
- Deleting a `COURSE` automatically purges its lessons, assignments, quizzes, and live session schedules.

### 2. Nullification (`ON DELETE SET NULL`)
Applied when a child record needs to persist even if the parent entity is removed. 
- In the [`COURSE`](../database/database_schema.sql#L25) table:
  ```sql
  FOREIGN KEY (Instructor_ID) REFERENCES INSTRUCTOR(Instructor_ID) ON DELETE SET NULL
  ```
  If an instructor leaves the platform and their account is deleted, the course remains cataloged with a `NULL` instructor reference, allowing a new teacher to be assigned later without losing student enrollment history.
