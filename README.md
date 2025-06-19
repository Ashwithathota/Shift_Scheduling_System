🕒 Shift Scheduling System (MySQL Only)
A robust Shift Scheduling System built entirely with MySQL (no frontend/backend code). This project manages employee shifts, detects scheduling conflicts, supports leave/availability tracking, and includes advanced features like automated shift assignments, audit logs, and role-based scheduling — all implemented using SQL schemas, triggers, and stored procedures.

📋 Features
✅ Core Functionalities
Employee Management: Create/update employee details and roles

Shift Management: Define shifts (morning/evening/night)

Shift Assignment: Assign employees to specific shift dates

Conflict Detection: Prevent overlapping or duplicate assignments

Availability Tracking: Manage and query employee shift availability

Leave Integration: Prevent shift assignment during leave

Shift Swap Requests: Allow swap requests with approval status

Audit Logs: Record all changes to assignments

✨ Bonus Features
Auto Shift Assignment: Automatically assign employees to shifts based on availability

Role-Based Scheduling: Assign shifts depending on employee roles/skills

Leave Conflict Trigger: Prevent shifts on requested leave dates

Historical Audit Log: Track assignment history and changes

🛠️ Tech Stack
Database: MySQL 5.7+

Tools Used: SQL (DDL, DML), Triggers, Stored Procedures, Views

📂 File Structure
File	Description
schema.sql	Contains table definitions for employees, shifts, assignments, etc.
triggers.sql	Includes triggers for conflict/leave detection
procedures.sql	Includes the AutoAssignShifts() procedure
sample_data.sql	Sample data for employees, shifts, and availability
README.md	Project overview and usage instructions

🚀 How to Run
Create a new database in MySQL:

sql
Copy
Edit
CREATE DATABASE shift_scheduler;
USE shift_scheduler;
Run SQL files in this order:

schema.sql

triggers.sql

procedures.sql

sample_data.sql

(Optional) Test automatic assignment:

sql
Copy
Edit
CALL AutoAssignShifts();
(Optional) View audit log:

sql
Copy
Edit
SELECT * FROM AuditLog;
📊 Sample Queries
sql
Copy
Edit
-- See assigned shifts
SELECT * FROM ShiftAssignments;

-- Check availability of an employee
SELECT * FROM ShiftAvailability WHERE employee_id = 1;

-- Leave requests on a date
SELECT * FROM LeaveRequests WHERE leave_date = '2025-06-20';
✅ Evaluation Checklist
 Proper relational schema with foreign keys

 Triggers and procedures implemented

 Leave conflict and assignment constraints

 Sample data included

 Bonus features integrated

📄 License
This project is open for academic use and learning purposes.
