# Design Document: Personal Finance Management System

By: Yurii



### Purpose:
Create a database to manage personal finances, including tracking income and expenses, managing budgets, monitoring account balances, and generating financial reports.

## Scope

### Included:
- Users
- Accounts
- Transaction Categories
- Transactions

### Excluded:

- Integration with external APIs
- Automatic transaction classification

## Functional Requirements

### Users should be able to::
- Register and log in
- Manage accounts and categories
- Manage transactions
- View balances and reports
- Set and track budgets

### Users should not be able to:
- Integrate with banking APIs
- Automatically classify transactions

## Entities and Relationships
### Users

- Attributes:
  - UserID: INT, Primary Key, Auto Increment
  - FirstName: VARCHAR(255), Not Null
  - LastName: VARCHAR(255), Not Null
  - Email: VARCHAR(255), Unique, Not Null
  - Password: VARCHAR(255), Not Null

### Accounts
- Attributes:
  - AccountID: INT, Primary Key, Auto Increment
  - UserID: INT, Foreign Key (references Users(UserID)), Not Null
  - AccountName: VARCHAR(255), Not Null
  - Balance: DECIMAL(10, 2), Not Null

### Categories
- Attributes:
  - CategoryID: INT, Primary Key, Auto Increment
  - UserID: INT, Foreign Key (references Users(UserID)), Not Null
  - CategoryName: VARCHAR(255), Not Null

### Transactions
- Attributes:
  - TransactionID: INT, Primary Key, Auto Increment
  - UserID: INT, Foreign Key (references Users(UserID)), Not Null
  - AccountID: INT, Foreign Key (references Accounts(AccountID)), Not Null
  - CategoryID: INT, Foreign Key (references Categories(CategoryID))
  - Amount: DECIMAL(10, 2), Not Null
  - Date: DATE, Not Null
  - Description: VARCHAR(255)

### Relationships
- Users - Accounts: One-to-Many (One user can have multiple accounts)
- Users - Categories: One-to-Many (One user can create multiple categories)
- Users - Transactions: One-to-Many (One user can have multiple transactions)
- Accounts - Transactions: One-to-Many (One account can have multiple transactions)
- Categories - Transactions: One-to-Many (One category can be associated with multiple transactions)

### Optimizations
- Indexes on UserID, AccountID, CategoryID for faster queries
- Views for income and expense reports

### Limitations
- No integration with external APIs
- Limited analytics capabilities

  
### ER Diagram
