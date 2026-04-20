## Storage Systems

The architecture uses multiple storage systems, each selected according to the specific requirements of the hospital data system.

For transactional healthcare data such as patient records, treatment history, and hospital visits, a **PostgreSQL OLTP database** is used. This system is optimized for fast inserts, updates, and queries, which are essential for handling operational hospital data from Electronic Health Records (EHR).

To collect and process **real-time ICU vitals**, a **streaming layer using Apache Kafka** is introduced. ICU monitoring devices continuously generate data such as heart rate, oxygen level, and blood pressure. Kafka enables reliable ingestion of this high-velocity data stream.

The streaming data is then stored in a **Time-Series Database**, which is designed specifically for timestamped data such as medical vitals. Time-series systems allow efficient querying of patient vitals over time.

For large-scale historical data storage, a **Data Lake** is used. The data lake stores raw medical records, monitoring data, and other healthcare information in their original format. This allows the hospital to retain all historical data for machine learning and long-term analysis.

For analytics and reporting, a **Data Warehouse** is implemented. The warehouse aggregates cleaned and structured data from the data lake and OLTP systems. Hospital management dashboards and monthly reports such as bed occupancy rates and department-wise costs are generated from this system.

Finally, a **Vector Database** is used to support natural language queries by doctors. Patient records are converted into embeddings and stored as vectors. This allows doctors to ask questions in plain English, such as “Has this patient had a cardiac event before?”, and retrieve semantically relevant patient history.

Together, these storage systems allow the hospital to handle operational data, real-time monitoring, AI modeling, and business analytics efficiently.

---

## OLTP vs OLAP Boundary

In this architecture, the **OLTP system** consists of the Electronic Health Records (EHR) database implemented using PostgreSQL. This system handles real-time transactional operations such as recording patient visits, treatments, diagnoses, and hospital admissions.

The **OLAP system** begins at the **Data Lake and Data Warehouse layers**. Data from the OLTP system and streaming sources is extracted and loaded into the data lake through the ETL pipeline. The data warehouse then performs analytical processing, aggregations, and reporting.

Machine learning models for predicting patient readmission risk also rely on the historical data stored in the data lake and data warehouse. Similarly, management dashboards and reporting tools operate on the analytical layer rather than the transactional system.

Separating OLTP and OLAP ensures that heavy analytical queries do not affect the performance of critical hospital operations.

---

## Trade-offs

One important trade-off in this architecture is **system complexity versus scalability**.

Using multiple systems such as Kafka, a time-series database, a data lake, a warehouse, and a vector database increases architectural complexity. It requires more infrastructure management, monitoring, and integration between components.

However, this complexity enables the system to scale efficiently as the hospital network grows. Real-time ICU data streams, large volumes of medical records, and advanced AI workloads can be handled independently by specialized systems.

To mitigate the operational complexity, the hospital could adopt **managed cloud services** for streaming, storage, and analytics. Cloud-managed platforms reduce maintenance overhead while maintaining the scalability and flexibility of the architecture.