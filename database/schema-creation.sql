-- SQL Schema for Investment Management System

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    PasswordHash VARCHAR(255),
    Email VARCHAR(100),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Investments (
    InvestmentID INT PRIMARY KEY,
    UserID INT,
    Amount DECIMAL(10, 2),
    InvestmentDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    UserID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(10, 2),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(10, 2),
    TransactionDate DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Assets (
    AssetID INT PRIMARY KEY,
    Name VARCHAR(100),
    Value DECIMAL(10, 2)
);

CREATE TABLE Liabilities (
    LiabilityID INT PRIMARY KEY,
    Name VARCHAR(100),
    Amount DECIMAL(10, 2)
);

CREATE TABLE Equity (
    EquityID INT PRIMARY KEY,
    ShareholderName VARCHAR(100),
    Amount DECIMAL(10, 2)
);

CREATE TABLE ProfitLoss (
    ReportID INT PRIMARY KEY,
    UserID INT,
    NetProfit DECIMAL(10, 2),
    ReportDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Budget (
    BudgetID INT PRIMARY KEY,
    UserID INT,
    PlannedAmount DECIMAL(10, 2),
    SpentAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY,
    UserID INT,
    Message VARCHAR(255),
    IsRead BOOLEAN DEFAULT FALSE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AuditLogs (
    LogID INT PRIMARY KEY,
    UserID INT,
    Action VARCHAR(255),
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE MarketData (
    MarketDataID INT PRIMARY KEY,
    AssetID INT,
    MarketPrice DECIMAL(10, 2),
    RecordedAt DATETIME,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);

CREATE TABLE HistoricalData (
    HistoricalDataID INT PRIMARY KEY,
    AssetID INT,
    OldValue DECIMAL(10, 2),
    Date DATETIME,
    FOREIGN KEY (AssetID) REFERENCES Assets(AssetID)
);

-- Sample Data
INSERT INTO Users (UserID, Username, PasswordHash, Email) VALUES 
    (1, 'john_doe', 'hashed_password_1', 'john@example.com'),
    (2, 'jane_smith', 'hashed_password_2', 'jane@example.com');

INSERT INTO Investments (InvestmentID, UserID, Amount, InvestmentDate) VALUES 
    (1, 1, 10000.00, '2025-01-15'),
    (2, 2, 15000.50, '2025-02-07');