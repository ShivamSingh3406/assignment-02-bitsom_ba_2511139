-- Dimension Table: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- Dimension Table: Store
CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Dimension Table: Product
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Fact Table: Sales
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Insert Dates
INSERT INTO dim_date VALUES
(1,'2023-01-15',1,2023),
(2,'2023-02-10',2,2023),
(3,'2023-03-05',3,2023),
(4,'2023-04-12',4,2023),
(5,'2023-05-20',5,2023);

-- Insert Stores
INSERT INTO dim_store VALUES
('S01','Mumbai Central Store','Mumbai'),
('S02','Delhi City Store','Delhi'),
('S03','Bangalore Mall Store','Bangalore');

-- Insert Products
INSERT INTO dim_product VALUES
('P01','Laptop','Electronics'),
('P02','Headphones','Electronics'),
('P03','Office Chair','Furniture'),
('P04','Notebook','Stationery');

-- Insert Fact Sales
INSERT INTO fact_sales VALUES
(1,1,'S01','P01',2,110000),
(2,1,'S02','P02',5,15000),
(3,2,'S01','P04',10,1200),
(4,2,'S03','P03',2,17000),
(5,3,'S02','P01',1,55000),
(6,3,'S03','P02',4,12000),
(7,4,'S01','P03',1,8500),
(8,4,'S02','P04',8,960),
(9,5,'S03','P01',1,55000),
(10,5,'S01','P02',3,9000);