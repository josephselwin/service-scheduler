CREATE OR ALTER PROCEDURE sp_CreateAppointment
    @CustomerId INT,
    @ProfessionalId INT,
    @ServiceId INT,
    @StartDateTime DATETIME2,
    @Notes NVARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DECLARE @Duration INT;
        DECLARE @EndDateTime DATETIME2;

        SELECT @Duration = DefaultDuration
        FROM Services
        WHERE ServiceId = @ServiceId
          AND IsActive = 1;

        IF @Duration IS NULL
            THROW 50001, 'Invalid or inactive service.', 1;

        SET @EndDateTime = DATEADD(MINUTE, @Duration, @StartDateTime);

        -- Conflict check
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
        THROW 50002, 'Time slot conflict for professional.', 1;

        INSERT INTO Appointments (
            CustomerId,
            ProfessionalId,
            ServiceId,
            StartDateTime,
            EndDateTime,
            Status,
            Notes
        )
        VALUES (
            @CustomerId,
            @ProfessionalId,
            @ServiceId,
            @StartDateTime,
            @EndDateTime,
            'Scheduled',
            @Notes
        );
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
