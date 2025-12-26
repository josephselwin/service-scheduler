CREATE TABLE Users (
    UserId INT IDENTITY PRIMARY KEY,
    UserType VARCHAR(20) NOT NULL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(20),
    IsActive BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

CREATE TABLE ServiceProfessionals (
    ProfessionalId INT PRIMARY KEY,
    HireDate DATE,
    HourlyRate DECIMAL(10,2),
    FOREIGN KEY (ProfessionalId) REFERENCES Users(UserId)
);

CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    Notes NVARCHAR(500),
    FOREIGN KEY (CustomerId) REFERENCES Users(UserId)
);

CREATE TABLE Services (
    ServiceId INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100),
    DefaultDuration INT,
    Price DECIMAL(10,2),
    IsActive BIT DEFAULT 1
);

CREATE TABLE Appointments (
    AppointmentId INT IDENTITY PRIMARY KEY,
    CustomerId INT,
    ProfessionalId INT,
    ServiceId INT,
    StartDateTime DATETIME2,
    EndDateTime DATETIME2,
    Status VARCHAR(20),
    Notes NVARCHAR(500),
    CreatedAt DATETIME2 DEFAULT SYSUTCDATETIME(),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (ProfessionalId) REFERENCES ServiceProfessionals(ProfessionalId),
    FOREIGN KEY (ServiceId) REFERENCES Services(ServiceId)
);
