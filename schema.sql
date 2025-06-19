-- schema.sql
-- Contains table definitions and relationships for the shift scheduling system


CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

CREATE TABLE Shifts (
    shift_id INT AUTO_INCREMENT PRIMARY KEY,
    shift_name VARCHAR(50) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL
);

CREATE TABLE ShiftAvailability (
    availability_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    available_date DATE,
    shift_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shifts(shift_id)
);

CREATE TABLE LeaveRequests (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    leave_date DATE,
    reason TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE ShiftAssignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    shift_id INT,
    assigned_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shifts(shift_id),
    UNIQUE (employee_id, assigned_date)
);

CREATE TABLE ShiftSwapRequests (
    swap_id INT AUTO_INCREMENT PRIMARY KEY,
    requester_id INT,
    responder_id INT,
    shift_id INT,
    requested_date DATE,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (requester_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (responder_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shifts(shift_id)
);

CREATE TABLE AuditLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(255),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    employee_id INT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);