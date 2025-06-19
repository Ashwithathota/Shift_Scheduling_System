-- sample_data.sql
-- Sample data to demonstrate system functionality

INSERT INTO Roles (role_name) VALUES ('Manager'), ('Cashier'), ('Support');

INSERT INTO Employees (name, email, role_id) VALUES
('Alice', 'alice@example.com', 1),
('Bob', 'bob@example.com', 2),
('Charlie', 'charlie@example.com', 3);

INSERT INTO Shifts (shift_name, start_time, end_time) VALUES
('Morning', '08:00:00', '14:00:00'),
('Evening', '14:00:00', '20:00:00'),
('Night', '20:00:00', '02:00:00');

INSERT INTO ShiftAvailability (employee_id, available_date, shift_id) VALUES
(1, '2025-06-19', 1),
(2, '2025-06-19', 2),
(3, '2025-06-19', 3);

INSERT INTO LeaveRequests (employee_id, leave_date, reason) VALUES
(1, '2025-06-20', 'Medical');

-- To test auto-assignment
-- CALL AutoAssignShifts();