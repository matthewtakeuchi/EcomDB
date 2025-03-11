# E-Commerce Management Database
This project is a relational SQL Server Management Studio (SSMS) database designed to power a CRUD-based frontend interface. The goal is to create software that helps beginner E-Commerce owners manage:

✅ Inventory Tracking

✅ Buy & Sell Transactions

✅ Basic Profit/Loss Calculations

✅ Other Essential Business Operations<br><br>


**Project Structure**

**📂 /sql** - Contains SQL scripts for database setup and functionality

*schema.sql* → Defines database tables, constraints, & relationships necessary to maintain star schema design

*views.sql* → Defines database views used for easier data viewing and simplifies joins

*triggers.sql* → Includes triggers for automation, creates custom P/L & Inventory Tracking

*stored_procedures.sql* → Contains stored procedures for CRUD operations, as well as guides to using the system<br><br>

**📂 /docs** - Provides detailed documentation

*database_design.md* → Explains table structures and relationships

*stored_procedures.md* → Describes available stored procedures

*queries.md* → Contains example queries<br><br>

More details can be found within the comments inside each file.<br><br>

**Setup Instructions**

To run this database locally:

*Install SQL Server and SSMS.*

Open schema.sql and execute it to create the database.

Run triggers.sql and stored_procedures.sql to add functionality.

(Optional) Insert sample data using seed_data.sql.<br><br>

**Future Enhancements**

Advanced reporting and analytics

User authentication and role management

Integration with third-party e-commerce platforms


