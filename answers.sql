/*Question 1*/
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products,',',1),',',-1)) AS Product
FROM ProductDetail
UNION
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products,',',2),',',-1)) AS Product
FROM ProductDetail
UNION
SELECT OrderID, CustomerName, TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products,',',3),','-1)) AS Product
FROM ProductDetail;

/*Question 2*/
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE Orders (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    CustomerID INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) 
);

INSERT INTO Orders (OrderID, Product, Quantity, CustomerID)
SELECT OrderID, Product, Quantity, CustomerID
FROM OrderDetails
JOIN Customers ON OrderDetails.CustomerName = Customers.CustomerName;