# CollegeDB SQL Lab Sheets (MySQL)

SQL solutions for Lab Sheets 1–5 from the uploaded lab sheet, prepared for MySQL Workbench and GitHub.

## Files
- `00_setup.sql` — creates `CollegeDB` and the shared tables/sample data.
- `01_lab_sheet_1_ddl.sql` — DDL: `CREATE`, `ALTER`, `TRUNCATE`, `DROP`.
- `02_lab_sheet_2_dml.sql` — DML: `INSERT`, `UPDATE`, `DELETE`.
- `03_lab_sheet_3_functions.sql` — number, aggregate, character, conversion, and date functions.
- `04_lab_sheet_4_operators.sql` — arithmetic, logical, comparison, special, and set-operation examples.
- `05_lab_sheet_5_joins.sql` — join examples and student/course/department reports.

## How to run
1. Open MySQL Workbench and connect to your MySQL server.
2. Run `00_setup.sql` first.
3. Run each lab file in numerical order.
4. Some statements in Lab 1 that delete or drop objects are commented out intentionally, so they do not destroy tables needed by later labs. Uncomment them only when you want to demonstrate those operations.
5. The lab scripts use sample data. Re-running the setup script resets the shared tables and sample data.

## Notes
- MySQL syntax is used. `INTERSECT` and `EXCEPT` require newer MySQL versions (MySQL 8.0.31+); alternatives are shown in comments where appropriate.
- This is a learning/demo project. Review statements before running them on a database containing important data.
