-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),
('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai');


-- Insert Products
INSERT INTO products VALUES
('P001','Laptop','Electronics',55000),
('P002','Mouse','Electronics',800),
('P003','Desk Chair','Furniture',8500),
('P004','Notebook','Stationery',120),
('P005','Headphones','Electronics',3200);


-- Insert Sales Representatives
INSERT INTO sales_reps VALUES
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001'),
('SR04','Karan Malhotra','karan@corp.com','North Zone, Chandigarh'),
('SR05','Meera Shah','meera@corp.com','West Zone, Ahmedabad');


-- Insert Orders
INSERT INTO orders VALUES
('ORD1114','C001','SR01','2023-08-06'),
('ORD1027','C002','SR02','2023-11-02'),
('ORD1132','C003','SR02','2023-03-07'),
('ORD1076','C004','SR03','2023-05-16'),
('ORD1075','C005','SR03','2023-04-18');


-- Insert Order Items
INSERT INTO order_items VALUES
('ORD1114','P004',1),
('ORD1027','P004',4),
('ORD1132','P002',5),
('ORD1076','P001',5),
('ORD1075','P003',3);