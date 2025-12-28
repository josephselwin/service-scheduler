CREATE OR ALTER PROCEDURE sp_CheckAvailability
    @ProfessionalId INT,
    @StartDateTime DATETIME2,
    @EndDateTime DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
       /* SELECT 1
        FROM Appointments
        WHERE ProfessionalId = @ProfessionalId
          AND Status IN ('Scheduled', 'InProgress')
          AND (
                @StartDateTime < EndDateTime
            AND @EndDateTime > StartDateTime
          ) */
        SELECT 1
    FROM ProfessionalAvailability PA
    WHERE PA.ProfessionalId = @ProfessionalId
      AND PA.DayOfWeek = DATEPART(WEEKDAY, @StartDateTime)
      /* AND CAST(@StartDateTime AS TIME) BETWEEN PA.StartTime AND PA.EndTime */
    )
        SELECT CAST(0 AS BIT) AS IsAvailable;
    ELSE
        SELECT CAST(1 AS BIT) AS IsAvailable;
END;
