USE SaraviaPen

--1
SELECT 
	[Customer Id] = c.CustomerID,
	[Customer Name] = c.CustomerName,
	[Sales Transaction Date] = st.SalesDate,
	[Sales Transaction Quantity] = SUM(std.SalesPenQuantity)

FROM Customer c, SalesTransaction st, SalesTransactionDetail std, Pen p
WHERE c.CustomerID = st.CustomerID AND std.SalesTransactionID = st.SalesTransactionID AND std.PenID = p.PenID AND DAY(st.SalesDate) = 25 AND p.PenID = 'PEN009'
GROUP BY c.CustomerID, c.CustomerName, st.SalesDate

--2
SELECT 
	[Pen ID] = p.PenID,
	[Pen Name] = p.PenName,
	[Total of Pen Material] = COUNT(ptd.PurchasePenMaterialQuantity)
FROM PurchaseTransactionDetail ptd, PenMaterial pm, Pen p
WHERE p.PenName LIKE 'Milky%' AND p.PenID = pm.PenID AND pm.PenMaterialID = ptd.PenMaterialID
GROUP BY p.PenID, p.PenName HAVING COUNT(ptd.PurchasePenMaterialQuantity) > 6

--3
SELECT 
	[Customer Name] = c.CustomerName,
	[Sales Transaction Date] = CONVERT(VARCHAR, st.SalesDate, 102),
	[Total Pen Type] = COUNT (std.PenID),
	[Ttotal Pen Quantity] = SUM(std.SalesPenQuantity)
FROM Customer c, SalesTransaction st, SalesTransactionDetail std, Pen p
WHERE c.CustomerID = st.CustomerID AND st.SalesTransactionID = std.SalesTransactionID AND std.PenID = p.PenID AND MONTH(st.SalesDate) = '9'
GROUP BY c.CustomerName, st.SalesDate HAVING SUM(std.SalesPenQuantity) > 10

--4
SELECT
	[Staff Name] = s.StaffName,
	[Staff Gender] = LEFT(s.StaffGender, 1),
	[Customer Name] = c.CustomerName,
	[Total Sales Transaction] = COUNT(st.SalesTransactionID)
FROM Customer c, SalesTransaction st, SalesTransactionDetail std, Pen p, Staff s
WHERE s.StaffID = st.StaffID AND st.CustomerID = c.CustomerID AND std.PenID = p.PenID AND std.SalesTransactionID = st.SalesTransactionID AND DAY(st.SalesDate)%2 = 0
GROUP BY s.StaffName, s.StaffGender, c.CustomerName HAVING SUM(std.SalesPenQuantity) <= 10

--5
SELECT
	[Customer Name] = UPPER(c.CustomerName),
	[Customer Gender] = c.CustomerGender,
	[Sales Transaction ID] = st.SalesTransactionID
FROM Customer c, SalesTransaction st, SalesTransactionDetail std, Pen p, 
(SELECT [Average] = AVG(std.SalesPenQuantity)FROM SalesTransactionDetail std, SalesTransaction st WHERE std.SalesTransactionID = st.SalesTransactionID) AS sq
WHERE c.CustomerID = st.CustomerID AND st.SalesTransactionID = std.SalesTransactionID AND DAY(st.SalesDate) = 22 AND std.SalesPenQuantity > sq.Average
GROUP BY c.CustomerName, c.CustomerGender, st.SalesTransactionID 

--6
SELECT
	[Vendor Name] = v.VendorName,
	[Purchase Date] = CONVERT(VARCHAR, pt.PurchaseDate, 107),
	[Material Name] = LOWER(pm.PenMaterialName)
FROM Vendor v, PurchaseTransactionDetail ptd, PurchaseTransaction pt, PenMaterial pm,
(SELECT Average = AVG(pm.PenMaterialPrice)FROM PenMaterial pm) AS sq
WHERE v.VendorID = pt.VendorID AND pt.PurchaseTransactionID = ptd.PurchaseTransactionID AND ptd.PenMaterialID = pm.PenMaterialID AND v.VendorName LIKE '% Industry' AND pm.PenMaterialPrice > sq.Average
GROUP BY v.VendorName, pt.PurchaseDate, pm.PenMaterialName

--7
SELECT
    [Total Purchase Transaction] = CAST(COUNT(pt.PurchaseTransactionID) AS VARCHAR(10))+ ' Transaction(s)',
    [Vendor Name] = v.VendorName,
    [Staff Name] = LEFT(s.StaffName, charindex(' ', s.StaffName)),
    [Purchase Transaction Date] = pt.PurchaseDate
FROM Vendor v, PurchaseTransaction pt, PurchaseTransactionDetail ptd, Staff s, PenMaterial pm, Pen p,
(SELECT [Average] = AVG(ptd.PurchasePenMaterialQuantity) FROM PurchaseTransactionDetail ptd, PenMaterial pm WHERE ptd.PenMaterialID = pm.PenMaterialID) as sq
WHERE v.VendorID = pt.VendorID AND s.StaffID = pt.StaffID AND pt.PurchaseTransactionID = ptd.PurchaseTransactionID AND pm.PenID = p.PenID AND pm.PenMaterialID = ptd.PenMaterialID AND DATENAME(DW, pt.PurchaseDate) = 'Sunday' AND ptd.PurchasePenMaterialQuantity < sq.Average 
GROUP BY pt.PurchaseTransactionID, v.VendorName, s.StaffName, pt.PurchaseDate

--8
SELECT
	[Vendor Name] = v.VendorName,
	[Transaction Date] = CONVERT(VARCHAR, pt.PurchaseDate,106),
	[Pen Material Name] = pm.PenMaterialName,
	[Material Number] = REPLACE(LEFT(pm.PenMaterialID, 3), 'PML', 'PM') + RIGHT (pm.PenMaterialID, 3)
FROM Vendor v, PurchaseTransaction pt, PurchaseTransactionDetail ptd, Staff s, PenMaterial pm, Pen p,
(SELECT [Average] = AVG(pm.PenMaterialStock) FROM PenMaterial pm) as sq
WHERE v.VendorID = pt.VendorID AND s.StaffID = pt.StaffID AND pt.PurchaseTransactionID = ptd.PurchaseTransactionID AND ptd.PenMaterialID = pm.PenMaterialID AND pm.PenID = p.PenID AND pm.PenMaterialStock > sq.Average
GROUP BY v.VendorName, pt.PurchaseDate, pm.PenMaterialName, pm.PenMaterialID 
HAVING SUM(ptd.PurchasePenMaterialQuantity * pm.PenMaterialPrice) > 500000
ORDER BY v.VendorName DESC
--9
CREATE VIEW ViewSalesTransaction AS 
SELECT
	[Staff Name] = s.StaffName,
	[Customer Name] = c.CustomerName,
	[Total Sales Transaction] = COUNT(st.SalesTransactionID),
	[Maximum Sales] = MAX(std.SalesPenQuantity)
FROM Customer c, Staff s, SalesTransaction st, SalesTransactionDetail std
WHERE c.CustomerID = st.CustomerID AND s.StaffID = st.StaffID AND st.SalesTransactionID = std.SalesTransactionID AND c.CustomerName LIKE '%c%'
GROUP BY s.StaffName, c.CustomerName HAVING COUNT(st.SalesTransactionID) > 2

SELECT * FROM ViewSalesTransaction
DROP VIEW ViewSalesTransaction

--10
CREATE VIEW ViewPurchaseTransactionDetail AS 
SELECT
	[VendorName] = v.VendorName,
    [Total Purchase Quantity] = SUM(ptd.PurchasePenMaterialQuantity),
    [Total Purchase Transaction] = COUNT(pt.PurchaseTransactionID)
FROM Vendor v, PurchaseTransaction pt, PurchaseTransactionDetail ptd, Staff s, PenMaterial pm
WHERE v.VendorID = pt.VendorID AND s.StaffID = pt.StaffID AND pt.PurchaseTransactionID = ptd.PurchaseTransactionID AND ptd.PenMaterialID = pm.PenMaterialID AND s.StaffGender LIKE 'Male'
GROUP BY v.VendorName HAVING COUNT(pt.PurchaseTransactionID) > 1


SELECT * FROM ViewPurchaseTransactionDetail
DROP VIEW ViewPurchaseTransactionDetail