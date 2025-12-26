CREATE OR ALTER PROCEDURE sp_UpdateAppointmentStatus
    @AppointmentId INT,
    @Status VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Status NOT IN ('Scheduled', 'InProgress', 'Completed', 'Cancelled')
        THROW 50003, 'Invalid status.', 1;

    UPDATE Appointments
    SET Status = @Status
    WHERE AppointmentId = @AppointmentId;
END;
