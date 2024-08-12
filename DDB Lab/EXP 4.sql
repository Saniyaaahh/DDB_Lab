-- 1. Create the client_master table
CREATE TABLE client_master (
    clientno INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    pincode VARCHAR(10),
    state VARCHAR(50),
    bal_due DECIMAL(10, 2)
);

-- Insert data into client_master
INSERT INTO client_master (clientno, name, address, city, pincode, state, bal_due)
VALUES 
(1, 'John Doe', '123 Main St', 'New York', '10001', 'NY', 1000.00),
(2, 'Jane Smith', '456 Elm St', 'Los Angeles', '90001', 'CA', 500.50),
(3, 'Michael Johnson', '789 Oak St', 'Chicago', '60601', 'IL', 750.25);

-- Output: Retrieve all data from the table
SELECT * FROM client_master;

-- 2. Create the product_master table with a CHECK constraint on Productno
CREATE TABLE product_master (
    Productno VARCHAR(10) PRIMARY KEY,
    Description VARCHAR(255),
    Qty_on_hand INT,
    Sell_price DECIMAL(10, 2),
    Cost_price DECIMAL(10, 2),
    CHECK (Productno REGEXP '^P')
);

-- Insert data into product_master
INSERT INTO product_master (Productno, Description, Qty_on_hand, Sell_price, Cost_price)
VALUES 
('P001', 'Laptop', 10, 1200.00, 900.00),
('P002', 'Smartphone', 20, 800.00, 600.00),
('P003', 'Tablet', 15, 500.00, 350.00);

-- Output: Retrieve all data from the table
SELECT * FROM product_master;

-- 3. Create the salesman_master table
CREATE TABLE salesman_master (
    Sno INT PRIMARY KEY,
    S_name VARCHAR(100),
    Address VARCHAR(255),
    city VARCHAR(50),
    Pincode VARCHAR(10),
    State VARCHAR(50),
    Sal_amt DECIMAL(10, 2),
    Tgt_to_get DECIMAL(10, 2)
);

-- Insert data into salesman_master
INSERT INTO salesman_master (Sno, S_name, Address, city, Pincode, State, Sal_amt, Tgt_to_get)
VALUES 
(101, 'David Brown', '321 Pine St', 'Houston', '77001', 'TX', 5000.00, 10000.00),
(102, 'Emily White', '654 Cedar St', 'San Francisco', '94101', 'CA', 4500.00, 9000.00),
(103, 'Daniel Lee', '987 Maple St', 'Boston', '02101', 'MA', 4000.00, 8000.00);

-- Output: Retrieve all data from the table
SELECT * FROM salesman_master;

-- 4. Create the sales_order table with foreign key references to client_master and salesman_master
CREATE TABLE sales_order (
    Orderno INT PRIMARY KEY,
    clientno INT,
    orderdate DATE,
    delyaddr VARCHAR(255),
    sno INT,
    delydate DATE,
    FOREIGN KEY (clientno) REFERENCES client_master(clientno),
    FOREIGN KEY (sno) REFERENCES salesman_master(Sno)
);

-- Insert data into sales_order
INSERT INTO sales_order (Orderno, clientno, orderdate, delyaddr, sno, delydate)
VALUES 
(1001, 1, '2024-07-01', '123 Main St', 101, '2024-07-10'),
(1002, 2, '2024-07-02', '456 Elm St', 102, '2024-07-11'),
(1003, 3, '2024-07-03', '789 Oak St', 103, '2024-07-12');

-- Output: Retrieve all data from the table
SELECT * FROM sales_order;

-- 5. Create the sales_order_details table with foreign key references to sales_order and product_master
CREATE TABLE sales_order_details (
    Orderno INT,
    Productno VARCHAR(10),
    qtyordered INT,
    PRIMARY KEY (Orderno, Productno),
    FOREIGN KEY (Orderno) REFERENCES sales_order(Orderno),
    FOREIGN KEY (Productno) REFERENCES product_master(Productno)
);

-- Insert data into sales_order_details
INSERT INTO sales_order_details (Orderno, Productno, qtyordered)
VALUES 
(1001, 'P001', 2),
(1001, 'P002', 5),
(1002, 'P003', 3),
(1003, 'P001', 1),
(1003, 'P002', 4);

-- Output: Retrieve all data from the table
SELECT * FROM sales_order_details;