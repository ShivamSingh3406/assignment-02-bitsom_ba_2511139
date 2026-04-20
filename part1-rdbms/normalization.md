## Anomaly Analysis

### Insert Anomaly

In the current flat table structure, it is impossible to add a new product or a new sales representative unless an order exists.

For example, suppose the company wants to add a new product such as:
product_id = P009, product_name = "Office Lamp", category = "Electronics".

Since the table requires fields such as order_id, customer_id, quantity, order_date, and sales_rep_id, we cannot insert this product without creating a fake order.

This means the database cannot store product information independently. Therefore, a product cannot be inserted unless an order is also created, which is an Insert Anomaly.


### Update Anomaly

Customer, product, and sales representative information are repeated in multiple rows. If any of this information changes, it must be updated in many rows.

For example, the sales representative:

sales_rep_id = SR01  
sales_rep_name = Deepak Joshi  
sales_rep_email = deepak@corp.com  
office_address = "Mumbai HQ, Nariman Point, Mumbai - 400021"

appears in many records such as:

ORD1114  
ORD1153  
ORD1091  
ORD1166  
ORD1054  

If Deepak Joshi's office address changes, the update must be made in every row where SR01 appears. If one row is missed, inconsistent data will exist in the table.

This is an Update Anomaly.


### Delete Anomaly

If an order is deleted, important information about customers, products, or sales representatives may also be lost.

For example, if the row:

ORD1185,C003,Amit Verma,Bangalore,P008,Webcam,Electronics,2100,1,2023-06-15,SR03,Ravi Kumar,...

is deleted, then all information about the product:

product_id = P008  
product_name = Webcam  
category = Electronics

may disappear from the database if this was the only order containing that product.

This results in unintended loss of product information, which is a Delete Anomaly.