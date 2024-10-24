#!/bin/bash

# Execute the sqlcmd command and capture any output and error
output=$(/opt/mssql-tools/bin/sqlcmd -S mssql -U SA -P $SA_PASSWORD -Q "
CREATE DATABASE RetailDB;
USE RetailDB;
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Description VARCHAR(100),
  Price DECIMAL(10, 2),
  SupplierID INT,
  DateAdded DATE
);
CREATE TABLE StoreInventory(
  ProductID INT,
  StoreID INT,
  StockLevel INT,
  ReorderThreshold INT,
  LastRestocked DATE,
  PRIMARY KEY (ProductID, StoreID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID), 
  FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);
CREATE TABLE WarehouseInventory(
  ProductID INT,
  StockLevel INT,
  ReorderThreshold INT,
  LastRestocked DATE,
  StorageLocation VARCHAR(20),
  PRIMARY KEY (ProductID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  ProductID INT,
  StoreID INT,
  QuantitySold INT,
  SaleDate DATE,
  SalePrice DECIMAL(10, 2),
  PaymentMethod VARCHAR(20),
  CustomerID INT,
  RegisterID INT,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);CREATE TABLE Suppliers (SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(100),
  ContactName VARCHAR(100),
  PhoneNumber VARCHAR(15),
  Email VARCHAR(100),
  DeliveryLeadTimeDays INT
);
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  Email VARCHAR(100),
  LoyaltyPoints INT,
  JoinDate DATE,
  LastSeen DATE
);
CREATE TABLE Stores(
  StoreID INT PRIMARY KEY,
  StoreName VARCHAR(100),
  Address VARCHAR(100),
  City VARCHAR(100),
  StateCode CHAR(2),
  Zipcode CHAR(5)
);
CREATE TABLE Orders(
  OrderID INT PRIMARY KEY,
  OrderGenerated DATE,
  DeliveryDate DATE,
  ProductID INT,
  Quantity INT,
  StoreID INT,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);" 2>&1)

# If the command was successful, print the output and exit
if [ $? -eq 0 ]; then
  echo "$output"
  exit 0
fi

# If the command failed, check if it's because the database already exists
if echo "$output" | grep -q "Error: Database 'RetailDB' already exists"; then
  echo "The database RetailDB already exists."
  exit 0
else
  # If the command failed for any other reason, print the output and exit with a failure status
  echo "$output"
  exit 1
fi