# Factory Production and Sales Management System (ERP Database)

## 📌 Executive Summary
This project aims to design and build a comprehensive relational database to manage industrial and commercial operations for factories. The system covers the entire production lifecycle, starting from managing suppliers and raw materials, through production orders and factory human resources, down to customer management and invoicing. 

The system is built with a strong focus on enforcing Referential Integrity rules to ensure data quality, consistency, and a fully normalized schema (Data Normalization).

---

## 👥 Project Team
* **Prepared by:** Anas Al-Hatami & Amjad Tamesh
* **Major:** Artificial Intelligence
* **Course:** Database Systems (Oracle SQL)

---

## 🛠️ Technologies Used
* **RDBMS:** Oracle SQL (A compatible T-SQL / SQL Server version is also included).
* **Schema Design:** Draw.io (for ERD representation).

---

## 🗄️ Database Schema & Architecture
The database is divided into 10 interrelated tables, architecturally designed to avoid data redundancy and apply normalization forms.

### 1. Master Tables
* **`factories`:** Records factory details, locations, and contact information.
* **`suppliers`:** Manages raw material suppliers and their geographical locations.
* **`products`:** Classifies final products, defines their categories, and sets unit prices.
* **`customers`:** Records customer details, contact numbers, and addresses.

### 2. Transactional & Child Tables
* **`departments`:** Linked directly to factories; defines the budget allocated for each department.
* **`employees`:** Linked to departments; manages staff data and salaries.
* **`rawmaterials`:** Linked to suppliers; manages current inventory and stock quantities.
* **`bill_of_materials`:** A junction table that accurately links products to the specific raw materials required to manufacture them.
* **`productionorders`:** Documents manufacturing operations, linked to the manufactured product, the responsible supervisor (employee), and production dates.
* **`invoices`:** Documents final sales operations, linked to customers, products, and sold quantities.

---

## 🔗 Data Integrity & Constraints
Advanced SQL features were utilized to ensure the quality of entered data and protect it from human errors:

1. **Identity Primary Keys:** Used `GENERATED ALWAYS AS IDENTITY` to automatically generate unique, tamper-proof sequential identifiers.
2. **Foreign Keys:** Strict constraints to prevent orphaned records (e.g., preventing the assignment of a production order to an unregistered employee, or linking a department to a non-existent factory).
3. **Check Constraints:** Applied strict business rules:
   * Prices, budgets, and stock quantities cannot be negative `(>= 0)`.
   * Produced quantities, sold quantities, and salaries must be actual values greater than zero `(> 0)`.
4. **Unique Constraints:** Prevented duplication of phone numbers for suppliers, factories, and customers to avoid redundant records.

---

## 🚀 How to Run
To run the database and insert the mock data:

1. Open your preferred SQL environment (Oracle SQL Developer or SQL Server Management Studio).
2. Execute the script found in `1.sql` (for Oracle) or `SQLQuery4.sql2015.sql` (for SQL Server).
3. The script will automatically:
   * Create all tables in the correct relational order (Master tables first, followed by Child tables).
   * Insert comprehensive mock data ready for testing.
   * Execute `SELECT` queries to verify data insertion and table joins (e.g., generating a direct sales report linking invoices to customers).

---
*This project was developed as an academic requirement to learn and apply relational database engineering.*
```eof

Here is the translated English version of the README file! It maintains the professional structure of the original while using standard database and ERP terminology. 

<FollowUp>
Is there anything else you would like to add to this English version, such as a section for future improvements or specific installation prerequisites?
</FollowUp>
