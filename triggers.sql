-- triggers.sql
-- Contains trigger to block assignment if employee is on leave

DELIMITER //
CREATE TRIGGER prevent_shift_on_leave
BEFORE INSERT ON ShiftAssignments
FOR EACH ROW
BEGIN
    DECLARE leave_exists INT;
    SELECT COUNT(*) INTO leave_exists FROM LeaveRequests
    WHERE employee_id = NEW.employee_id AND leave_date = NEW.assigned_date;
    IF leave_exists > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee has leave on this date';
    END IF;
END;//
DELIMITER ;