## Normalization to Third Normal Form

### Objective
The goal was to normalize the schema to ensure that it adheres to **Third Normal Form (3NF)**. Here's an overview of the steps taken:

### Step 1: **First Normal Form (1NF)**
A table is in 1NF if:
- All columns contain atomic values.
- Each record is unique.

**Review**: All tables in the schema meet the 1NF requirement, as there are no repeating groups of data, and all columns contain atomic values.

### Step 2: **Second Normal Form (2NF)**
A table is in 2NF if:
- It is in 1NF.
- There are no partial dependencies that is all non-key attributes are fully dependent on the primary key

**Review**: All tables in the schema are in 2NF as well. Every non-key attribute is fully dependent on the primary key.

### Step 3: **Third Normal Form (3NF)**
A table is in 3NF if:
- It is in 2NF.
- There are no transitive dependencies that is non-key attributes do not depend on other non-key attributes

**Review**: After reviewing the schema, all tables are in **3NF**. There are no dependencies, and each non-key attribute is directly dependent on the primary key.

### Conclusion
The schema adheres to **Third Normal Form (3NF)**, meaning there are no partial or transitive dependencies, and the database design is optimized for reducing redundancy and improving data integrity.
