1. OnlineRating Table and Insert Procedure
CREATE TABLE OnlineRating (
    RatingID        INT             NOT NULL IDENTITY(100,1),
    CustomerID      INT             NOT NULL,
    WorkID          INT             NOT NULL,
    RatingScore     INT             NOT NULL CHECK (RatingScore BETWEEN 1 AND 5),
    Comments        VARCHAR(500),
    RatingDate      DATE            DEFAULT GETDATE(),
    CONSTRAINT RatingPK PRIMARY KEY (RatingID),
    CONSTRAINT RatingCustomerFK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT RatingWorkFK FOREIGN KEY (WorkID) REFERENCES Work(WorkID)
);
GO

CREATE PROCEDURE InsertOnlineRating
    @CustomerID INT,
    @WorkID INT,
    @RatingScore INT,
    @Comments VARCHAR(500)
AS
BEGIN
    INSERT INTO OnlineRating (CustomerID, WorkID, RatingScore, Comments)
    VALUES (@CustomerID, @WorkID, @RatingScore, @Comments);
END;
GO

-- Execution
EXEC InsertOnlineRating 
    @CustomerID = 101, 
    @WorkID = 1001, 
    @RatingScore = 5, 
    @Comments = 'Stunning piece of art!';

2. Commission Table and Insert Procedure
CREATE TABLE Commission (
    CommissionID        INT             NOT NULL IDENTITY(200,1),
    AuctionID           INT             NOT NULL,
    EmployeeID          INT             NOT NULL,
    CommissionAmount    DECIMAL(10,2)   NOT NULL,
    CONSTRAINT CommissionPK PRIMARY KEY (CommissionID),
    CONSTRAINT CommissionAuctionFK FOREIGN KEY (AuctionID) REFERENCES AuctionProcess(AuctionID),
    CONSTRAINT CommissionEmployeeFK FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO

CREATE PROCEDURE InsertCommission
    @AuctionID INT,
    @EmployeeID INT,
    @CommissionAmount DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Commission (AuctionID, EmployeeID, CommissionAmount)
    VALUES (@AuctionID, @EmployeeID, @CommissionAmount);
END;
GO

-- Execution
EXEC InsertCommission 
    @AuctionID = 501, 
    @EmployeeID = 301, 
    @CommissionAmount = 1250.50;

3. VisitorBooking Table and Insert Procedure
CREATE TABLE VisitorBooking (
    BookingID       INT         NOT NULL IDENTITY(300,1),
    CustomerID      INT         NOT NULL,
    ArtShowID       INT         NOT NULL,
    BookingDate     DATE        DEFAULT GETDATE(),
    NumOfTickets    INT         NOT NULL,
    CONSTRAINT VisitorBookingPK PRIMARY KEY (BookingID),
    CONSTRAINT VisitorBookingCustomerFK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT VisitorBookingArtShowFK FOREIGN KEY (ArtShowID) REFERENCES ArtShowSchedule(ArtShowID)
);
GO

CREATE PROCEDURE InsertVisitorBooking
    @CustomerID INT,
    @ArtShowID INT,
    @NumOfTickets INT
AS
BEGIN
    INSERT INTO VisitorBooking (CustomerID, ArtShowID, NumOfTickets)
    VALUES (@CustomerID, @ArtShowID, @NumOfTickets);
END;
GO

-- Execution
EXEC InsertVisitorBooking 
    @CustomerID = 102, 
    @ArtShowID = 601, 
    @NumOfTickets = 2;

4. ArtShowSchedule Table and Insert Procedure
CREATE TABLE ArtShowSchedule (
    ArtShowID       INT             NOT NULL IDENTITY(400,1),
    ShowTitle       VARCHAR(100)    NOT NULL,
    ShowDate        DATE            NOT NULL,
    Location        VARCHAR(100)    NOT NULL,
    Description     VARCHAR(500),
    CONSTRAINT ArtShowSchedulePK PRIMARY KEY (ArtShowID)
);
GO

CREATE PROCEDURE InsertArtShowSchedule
    @ShowTitle VARCHAR(100),
    @ShowDate DATE,
    @Location VARCHAR(100),
    @Description VARCHAR(500)
AS
BEGIN
    INSERT INTO ArtShowSchedule (ShowTitle, ShowDate, Location, Description)
    VALUES (@ShowTitle, @ShowDate, @Location, @Description);
END;
GO

-- Execution
EXEC InsertArtShowSchedule 
    @ShowTitle = 'Modern Abstracts', 
    @ShowDate = '2025-08-15', 
    @Location = 'Downtown Art Hall', 
    @Description = 'Featuring modern abstract works from local artists.';

