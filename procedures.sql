-- procedures.sql
-- Stored procedure to auto-assign shifts based on availability

DELIMITER //
CREATE PROCEDURE AutoAssignShifts()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE shift_id INT;
    DECLARE shift_date DATE;
    DECLARE cur CURSOR FOR
        SELECT employee_id, shift_id, available_date FROM ShiftAvailability;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO emp_id, shift_id, shift_date;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF NOT EXISTS (
            SELECT 1 FROM ShiftAssignments
            WHERE employee_id = emp_id AND assigned_date = shift_date
        ) THEN
            INSERT INTO ShiftAssignments (employee_id, shift_id, assigned_date)
            VALUES (emp_id, shift_id, shift_date);

            INSERT INTO AuditLog (action, employee_id)
            VALUES (CONCAT('Auto-assigned shift ', shift_id, ' on ', shift_date), emp_id);
        END IF;
    END LOOP;
    CLOSE cur;
END;//
DELIMITER ;