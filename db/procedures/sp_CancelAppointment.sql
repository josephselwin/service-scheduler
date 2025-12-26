CREATE OR ALTER PROCEDURE sp_CancelAppointment
    @AppointmentId INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Appointments
    SET Status = 'Cancelled'
    WHERE AppointmentId = @AppointmentId
      AND Status <> 'Completed';
END;
