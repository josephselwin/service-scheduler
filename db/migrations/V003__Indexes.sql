CREATE INDEX IX_Appointments_Professional_Time
ON Appointments (ProfessionalId, StartDateTime);

CREATE INDEX IX_Appointments_Customer
ON Appointments (CustomerId);
