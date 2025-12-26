CREATE TABLE ProfessionalAvailability (
    AvailabilityId INT IDENTITY PRIMARY KEY,
    ProfessionalId INT NOT NULL,
    DayOfWeek TINYINT NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (ProfessionalId) REFERENCES ServiceProfessionals(ProfessionalId)
);
