-- Schema for Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Schema for Accounts Table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    AccountName VARCHAR(255) NOT NULL,
    Balance DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Schema for Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    CategoryName VARCHAR(255) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Schema for Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    AccountID INT NOT NULL,
    CategoryID INT,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATE NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create indexes
CREATE INDEX idx_user_email ON Users(Email);
CREATE INDEX idx_account_user ON Accounts(UserID);
CREATE INDEX idx_category_user ON Categories(UserID);
CREATE INDEX idx_transaction_user ON Transactions(UserID);
CREATE INDEX idx_transaction_account ON Transactions(AccountID);
CREATE INDEX idx_transaction_category ON Transactions(CategoryID);

-- Sample Data Insertion

-- Inserting sample data into Users
INSERT INTO Users (FirstName, LastName, Email, Password) VALUES ('John', 'Doe', 'john.doe@example.com', 'password123');
INSERT INTO Users (FirstName, LastName, Email, Password) VALUES ('Jane', 'Smith', 'jane.smith@example.com', 'password123');

-- Inserting sample data into Accounts
INSERT INTO Accounts (UserID, AccountName, Balance) VALUES (1, 'Checking', 1000.00);
INSERT INTO Accounts (UserID, AccountName, Balance) VALUES (2, 'Savings', 5000.00);

-- Inserting sample data into Categories
INSERT INTO Categories (UserID, CategoryName) VALUES (1, 'Groceries');
INSERT INTO Categories (UserID, CategoryName) VALUES (2, 'Utilities');

-- Inserting sample data into Transactions
INSERT INTO Transactions (UserID, AccountID, CategoryID, Amount, Date, Description) 
VALUES (1, 1, 1, 100.00, '2024-06-01', 'Grocery shopping');
INSERT INTO Transactions (UserID, AccountID, CategoryID, Amount, Date, Description) 
VALUES (2, 2, 2, 150.00, '2024-06-01', 'Utility bill');
