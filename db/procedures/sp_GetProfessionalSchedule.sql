CREATE OR ALTER PROCEDURE sp_GetProfessionalSchedule
    @ProfessionalId INT,
    @FromDate DATETIME2,
    @ToDate DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        A.AppointmentId,
        A.StartDateTime,
        A.EndDateTime,
        A.Status,
        S.Name AS ServiceName,
        U.FirstName + ' ' + U.LastName AS CustomerName
    FROM Appointments A
    JOIN Services S ON A.ServiceId = S.ServiceId
    JOIN Users U ON A.CustomerId = U.UserId
    WHERE A.ProfessionalId = @ProfessionalId
      AND A.StartDateTime BETWEEN @FromDate AND @ToDate
    ORDER BY A.StartDateTime;
END;
