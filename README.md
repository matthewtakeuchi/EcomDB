# E-Commerce Management Database
This project is a relational SQL Server Management Studio (SSMS) database designed to power a CRUD-based frontend interface. The goal is to create software that helps beginner E-Commerce owners manage:

✅ Inventory Tracking
✅ Buy & Sell Transactions
✅ Basic Profit/Loss Calculations
✅ Other Essential Business Operations

Project Structure
📂 /sql - Contains SQL scripts for database setup and functionality

**schema.sql** → Defines database tables and relationships
**triggers.sql** → Includes triggers for automation
**stored_procedures.sql** → Contains stored procedures for CRUD operations
📂 /docs - Provides detailed documentation

**database_design.md** → Explains table structures and relationships
**stored_procedures.md** → Describes available stored procedures
**queries.md** → Contains example queries
More details can be found within the comments inside each file.

**Setup Instructions**
To run this database locally:

**Install SQL Server and SSMS.**
Open schema.sql and execute it to create the database.
Run triggers.sql and stored_procedures.sql to add functionality.
(Optional) Insert sample data using seed_data.sql.

**Future Enhancements**
Advanced reporting and analytics
User authentication and role management
Integration with third-party e-commerce platforms


# EcomDB

This project is a relational SSMS database designed to power CRUD frontend interface. This end goal of this project is to create a software that helps beginning E-Commerce owners be able to manage inventory, track their buys and sells, create basic profit/loss calculations, and more. The following files have been uploaded and more information as to what they do can be found within the comments of those files.

**schema.sql**- Used for creating all of the tables needed and their constraints such as primary/foreign keys, reference constraints, and computed columns that maintain the star schema structure. 
