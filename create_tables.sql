1. AuctionProcess Table Creation
-- Create the AuctionProcess table
CREATE TABLE AuctionProcess (
    AuctionID       INT NOT NULL IDENTITY(9000,1),
    EmployeeID      INT NOT NULL,
    CustomerID      INT NOT NULL,
    WorkID          INT NOT NULL,
    BidPrice        INT NOT NULL,
    
    CONSTRAINT PK_AuctionID PRIMARY KEY (AuctionID),
    
    CONSTRAINT FK_EmployeeID FOREIGN KEY (EmployeeID)
        REFERENCES Employee(EmployeeID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,

    CONSTRAINT FK_WorkID FOREIGN KEY (WorkID)
        REFERENCES Work(WorkID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
2. Populate AuctionProcess Table
-- Insert auction records
INSERT INTO AuctionProcess (EmployeeID, CustomerID, WorkID, BidPrice)
VALUES 
    (5000, 1000, 500, 1300),
    (5003, 1001, 501, 1250),
    (5003, 1002, 502, 2350),
    (5002, 1003, 503, 1800),
    (5003, 1004, 504, 2050),
    (5004, 1005, 505, 1900),
    (5001, 1006, 506, 1500),
    (5002, 1007, 507, 2500),
    (5004, 1008, 508, 3500),
    (5005, 1009, 509, 1500),
    (5001, 1010, 510, 2700),
    (5003, 1011, 511, 8900),
    (5001, 1012, 512, 3700),
    (5002, 1013, 513, 3000),
    (5004, 1014, 514, 4500),
    (5001, 1015, 515, 7800),
    (5005, 1016, 516, 1250),
    (5004, 1017, 517, 7800),
    (5004, 1018, 518, 9500),
    (5005, 1019, 519, 3890);

3. Employee Table Creation
-- Create the Employee table
CREATE TABLE Employee (
    EmployeeID          INT NOT NULL IDENTITY(500,1),
    EmpFirstName        CHAR(25) NOT NULL,
    EmpLastName         CHAR(25) NOT NULL,
    EmpEmail            VARCHAR(100) NULL,
    Designation         CHAR(25) NOT NULL,
    EncryptedPassword   VARCHAR(50) NULL,
    Street              CHAR(30) NULL,
    City                CHAR(35) NULL,
    State               CHAR(2) NULL,
    ZIPorPostalCode     CHAR(9) NULL,
    Country             CHAR(50) NULL,
    AreaCode            CHAR(3) NULL,
    PhoneNumber         CHAR(8) NULL,

    CONSTRAINT PK_EmployeeID PRIMARY KEY (EmployeeID),
    CONSTRAINT AK_EmpEmail UNIQUE (EmpEmail)
);
4. Populate Employee Table
-- Insert employee records
INSERT INTO Employee (EmployeeID, EmpFirstName, EmpLastName, EmpEmail, Designation, EncryptedPassword, Street, City, State, ZIPorPostalCode, Country, AreaCode, PhoneNumber)
VALUES 
    (5000, 'Alex', 'Taylor', 'ataylor@gmail.com', 'Owner', '@#Taylor_1099!!', 'Lincoln', 'Dekalb', 'IL', '60115', 'USA', '779', '77887789'),
    (5001, 'Pete', 'Smith', 'psmith@gmail.com', 'Salesperson', '@#Smith_7887!!', 'Adams Way', 'Dekalb', 'IL', '60115', 'USA', '779', '67765544'),
    (5002, 'James', 'Johnson', 'jjohnson@gmail.com', 'Salesperson', '@#Johnson_6788!!', 'Arcadia Dr', 'Dekalb', 'IL', '60115', 'USA', '779', '87789909'),
    (5003, 'John', 'Williams', 'jwilliams@gmail.com', 'Salesperson', '@#Williams_8800!!', 'Regent Dr', 'Dekalb', 'IL', '60115', 'USA', '779', '87899909'),
    (5004, 'Michael', 'Brown', 'mbrown@gmail.com', 'Worker', '@#Brown_8999!!', 'Scenic Rd', 'Dekalb', 'IL', '60115', 'USA', '779', '78898767'),
    (5005, 'Charles', 'Williamson', 'cwilliamson@gmail.com', 'Worker', '@#Williamson_4233!!', 'Regal Dr', 'Dekalb', 'IL', '60115', 'USA', '779', '78887656');

