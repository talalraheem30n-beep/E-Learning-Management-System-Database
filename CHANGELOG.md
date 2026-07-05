# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-07-05

### Added
- **Core Schema (DDL)**: Created 19 fully normalized relational tables covering students, instructors, courses, lessons, enrollments, grading, payments, certificates, and system notifications.
- **ACID & Referential Integrity**: Explicitly configured tables with the MySQL `InnoDB` storage engine. Handled delete propagation using `ON DELETE CASCADE` and `ON DELETE SET NULL` constraints.
- **Sample Dataset (DML)**: Seeded approximately 55 realistic records per table to simulate platform activities.
- **Analytical Reports**: Wrote 20 production-oriented SQL queries inside `database/sample_queries.sql` representing reporting use-cases (e.g., student progress, revenue logs, exam attempts, course ratings, attendance).
- **Extended Documentation**: Published step-by-step setup walkthroughs (`installation.md`), architectural notes (`database_overview.md`), and repository file structure diagrams (`folder_structure.md`).
