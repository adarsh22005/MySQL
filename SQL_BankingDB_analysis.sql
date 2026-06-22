CREATE DATABASE BankingDB;
USE BankingDB;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE);
    
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );
    
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID) );
    
    CREATE TABLE Branches (
	BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches (
    AccountID INT,
    BranchID INT,
    AssignmentDate DATE,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


USE bankingdb;
Alter Table Customers
ADD DateOfBirth DATE;

INSERT INTO Customers
(CustomerID, FirstName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(101, 'Rahul' , 'Sharma' , 'rahul.sharma@gmail.com', '844615409' , '2025-04-15', '1998-07-12');

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2025-05-03', '2000-09-20');

select * from customers;
ALTER Table Accounts
ADD CONSTRAINT chk_Minbalance
check (Balance >= 1000);


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201, 101, 'Savings', 25000);

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000);

select * from accounts;

INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-06-01', 5000, 'Credit'), 
(302, 201, '2025-06-02', 5000, 'Credit');

#Branches
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
Values
(401, 'Andheri Branch', 'Mumbai Andheri East', '8446215409'),
(402, 'Andheri Branch', 'Mumbai Andheri East', '8446215409');

select * from Branches;

#ACcount branches
INSERT INTO AccountBranches
(AccountID, BranchID, AssignmentDate)
values
(201, 401, '2025-05-01'),  
(202, 402, '2025-05-02');
 
select * from AccountBranches;

Insert Into loans
(loanID, CustomerID, LoanAmount, InterstRate, StartDate, EndDate)
Values
(501, 101, 5000000, 8.5, '2025-01-01', '2030-01-01'),
(502, 101, 5000000, 8.5, '2025-01-01', '2030-01-01');

SELECT * FROM Loans;

#Task 2: Update Exisiting Banking Records 

Update Customers 
set phone = '8446215409'
where CustomerID = 101;

select * From Customers
Where CustomerID = 101;

Alter Table Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);
describe customers;
