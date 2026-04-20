## Vector DB Use Case

A traditional keyword-based database search is not sufficient for searching large legal documents such as 500-page contracts. Keyword search systems rely on exact word matching, which means they only return results when the same words appear in the document. However, legal documents often use different wording for the same concept. For example, a lawyer might search for “termination clauses,” but the document may contain phrases such as “contract cancellation terms” or “agreement ending conditions.” In such cases, a keyword search may fail to retrieve the most relevant sections.

Vector databases solve this limitation by using embeddings. Embeddings convert text into numerical vectors that capture the semantic meaning of the content rather than just the exact words used. With this approach, both the document text and the user’s query can be compared based on their meaning using similarity measures such as cosine similarity.

In a legal search system, each paragraph or section of the contract would first be converted into embeddings using a language model. These embeddings would then be stored in a vector database. When a lawyer asks a question in plain English, the query is also converted into an embedding and compared with the stored vectors. The system then retrieves the most semantically similar sections of the contract.

This approach enables efficient semantic search across very large documents, allowing lawyers to quickly find relevant clauses without manually reading hundreds of pages.
