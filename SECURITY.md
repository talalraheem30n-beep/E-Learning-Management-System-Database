# Security Policy

## Supported Versions

This project represents a static database schema and sample data model. Only the current major release version is maintained:

| Version | Supported |
| ------- | --------- |
| 1.x     |   ✅      |
| < 1.0   |   ❌      |

---

## 🔒 Safe Database Practices (Educational Notice)

Since this is an educational open-source database design:
- **No Sensitive Production Data**: Do not store real personal details, credit cards, or production credentials in these tables. The provided sample dataset is strictly synthetic.
- **SQL Injection Prevention**: When integrating this database with an application layer (e.g., Node.js, Python, PHP, Java), always use **parameterized queries** or a secure **Object-Relational Mapper (ORM)**. Never concatenate raw user input into SQL queries.
- **Access Control**: Ensure that your local MySQL server is configured with a strong root password. For application connectivity, create a separate user with the minimum required privileges (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) rather than using the root account.

---

## 🛑 Reporting a Vulnerability

If you discover a security issue or logical vulnerability in the schema or query implementations:
1. Please do **not** open a public GitHub issue.
2. Email your findings privately to the repository owner at `talalraheem@outlook.com` (or submit a secure query).
3. We will review your report and respond within 48 hours to discuss a resolution and remediation timeline.
