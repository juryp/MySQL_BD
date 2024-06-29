-- View for income and expense reports
CREATE VIEW IncomeExpenseReport AS
SELECT 
    u.UserID, 
    u.FirstName, 
    u.LastName, 
    a.AccountName, 
    t.CategoryID, 
    t.Amount, 
    t.Date, 
    t.Description
FROM 
    Transactions t
JOIN 
    Users u ON t.UserID = u.UserID
JOIN 
    Accounts a ON t.AccountID = a.AccountID
ORDER BY 
    t.Date;

-- Query to get the balance of all accounts for a user
SELECT 
    u.UserID, 
    u.FirstName, 
    u.LastName, 
    SUM(a.Balance) AS TotalBalance
FROM 
    Users u
JOIN 
    Accounts a ON u.UserID = a.UserID
GROUP BY 
    u.UserID, u.FirstName, u.LastName;

-- Query to get transactions for a specific account
SELECT 
    t.TransactionID, 
    t.Amount, 
    t.Date, 
    t.Description, 
    c.CategoryName
FROM 
    Transactions t
JOIN 
    Categories c ON t.CategoryID = c.CategoryID
WHERE 
    t.AccountID = 1;
