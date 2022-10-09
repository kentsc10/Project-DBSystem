CREATE DATABASE SaraviaPen
USE SaraviaPen


CREATE TABLE Customer(
	CustomerID CHAR (6) PRIMARY KEY NOT NULL CHECK(CustomerID LIKE 'CTR[0-9][0-9][0-9]'),
	CustomerName VARCHAR (30) NOT NULL,
	CustomerGender CHAR (10) NOT NULL,
	CustomerDateOfBirth DATE NOT NULL,
	CustomerPhoneNumber CHAR (12) NOT NULL CHECK(LEN(CustomerPhoneNumber) = 12),
	CustomerAddress VARCHAR (50) NOT NULL)

	CREATE TABLE Staff(
	StaffID CHAR (6) PRIMARY KEY NOT NULL CHECK(StaffID LIKE 'STF[0-9][0-9][0-9]'),
	StaffName VARCHAR (30) NOT NULL CHECK (LEN(StaffName) >= 3),
	StaffGender CHAR (10) NOT NULL CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
	StaffDateOfBirth DATE NOT NULL,
	StaffPhoneNumber VARCHAR (12) NOT NULL,
	StaffAddress VARCHAR (50) NOT NULL,
	StaffSalary INT NOT NULL)

	CREATE TABLE Vendor(
	VendorID CHAR (6) PRIMARY KEY NOT NULL CHECK(VendorID LIKE 'VDR[0-9][0-9][0-9]'),
	VendorName VARCHAR (30) NOT NULL,
	VendorAddress VARCHAR (50) NOT NULL,
	VendorPhoneNumber VARCHAR (12) NOT NULL,
	VendorEmail VARCHAR (50) NOT NULL CHECK (VendorEmail LIKE '%@%'))


	CREATE TABLE Pen(
	PenID CHAR (6) PRIMARY KEY NOT NULL CHECK(PenID LIKE 'PEN[0-9][0-9][0-9]'),
	PenName VARCHAR (30) NOT NULL CHECK(PenName LIKE '% Pen'),
	PenPrice INT  NOT NULL CHECK(PenPrice BETWEEN 10000 AND 50000),
	PenStock INT  NOT NULL)


	CREATE TABLE PenMaterial(
	PenMaterialID CHAR (6) PRIMARY KEY NOT NULL CHECK(PenMaterialID LIKE 'PML[0-9][0-9][0-9]'),
	PenID CHAR (6) FOREIGN KEY REFERENCES Pen(PenID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenMaterialName VARCHAR (30) NOT NULL,
	PenMaterialPrice INT  NOT NULL,
	PenMaterialStock INT  NOT NULL CHECK(PenMaterialStock >= 100))

	

	CREATE TABLE SalesTransaction(
	SalesTransactionID CHAR (6) PRIMARY KEY NOT NULL CHECK(SalesTransactionID LIKE 'SLT[0-9][0-9][0-9]'),
	CustomerID CHAR (6) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR (6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesDate DATE NOT NULL CHECK (YEAR(SalesDate) = 2020),
	SalesPaymentType VARCHAR (30) NOT NULL
	)

	CREATE TABLE SalesTransactionDetail(
	SalesTransactionID CHAR (6) FOREIGN KEY REFERENCES SalesTransaction(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenID CHAR (6) FOREIGN KEY REFERENCES Pen(PenID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesPenQuantity INT  NOT NULL,
	CONSTRAINT SalesDetail PRIMARY KEY (SalesTransactionID,PenID))

	CREATE TABLE PurchaseTransaction(
	PurchaseTransactionID CHAR (6) PRIMARY KEY NOT NULL CHECK(PurchaseTransactionID LIKE 'PCT[0-9][0-9][0-9]'),
	VendorID CHAR (6) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	StaffID CHAR (6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseDate DATE NOT NULL,
	PurchasePaymentType VARCHAR (30) NOT NULL)

	CREATE TABLE PurchaseTransactionDetail(
	PurchaseTransactionID CHAR (6) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PenMaterialID CHAR (6) FOREIGN KEY REFERENCES PenMaterial(PenMaterialID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchasePenMaterialQuantity INT  NOT NULL,
	CONSTRAINT PurchaseDetail PRIMARY KEY (PurchaseTransactionID,PenMaterialID))