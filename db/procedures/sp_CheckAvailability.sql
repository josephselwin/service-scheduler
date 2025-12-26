CREATE OR ALTER PROCEDURE sp_CheckAvailability
    @ProfessionalId INT,
    @StartDateTime DATETIME2,
    @EndDateTime DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Appointments
        WHERE ProfessionalId = @ProfessionalId
          AND Status IN ('Scheduled', 'InProgress')
          AND (
                @StartDateTime < EndDateTime
            AND @EndDateTime > StartDateTime
          )
    )
        SELECT CAST(0 AS BIT) AS IsAvailable;
    ELSE
        SELECT CAST(1 AS BIT) AS IsAvailable;
END;
