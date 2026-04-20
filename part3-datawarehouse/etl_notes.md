## ETL Decisions

### Decision 1 — Date Standardization
Problem:  
The raw dataset contained inconsistent date formats such as DD/MM/YYYY and YYYY-MM-DD. This inconsistency can create problems during aggregation and time-based analysis in a data warehouse.

Resolution:  
All dates were standardized into the ISO format YYYY-MM-DD before loading the data into the dim_date table. This ensures consistent date parsing and enables reliable month-based and year-based reporting.

### Decision 2 — Handling NULL Values
Problem:  
Some rows in the raw transaction data contained NULL values for product category or store information. Missing dimension values can break foreign key relationships in a star schema.

Resolution:  
Rows with critical missing values were cleaned before loading. Missing categories were standardized where possible, and records without essential identifiers were excluded from the fact table to maintain referential integrity.

### Decision 3 — Standardizing Category Names
Problem:  
The dataset had inconsistent category casing such as “electronics”, “Electronics”, and “ELECTRONICS”. This can lead to incorrect grouping during analytical queries.

Resolution:  
All category values were standardized to a single consistent format (capitalized form such as Electronics, Furniture, Stationery) before loading them into the dim_product table.