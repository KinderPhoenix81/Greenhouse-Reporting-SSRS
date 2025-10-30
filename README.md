# Greenhouse-Reporting-SSRS

## Project Features
- 4 Reports
  - Upcoming Payments
  - Past Due Invoices
  - Employee Details
  - Incoming Products
- Drilldown Reports
  - Details tailored to each entry
  - Parameterized reports using stored procedures
 
## Project Details
- SSRS reports are created using Visual Studio 2022
- Database created in SQL Server Management Studio (SSMS) 2021

## Project Setup
- To run any report:
  - You must create a database in SSMS using the name of [Greenhouse]
  - Run the SQL script for table structures present in the _TableStructure folder
  - Run the SQL script for the content of the tables found in the _TableContents folder
  - Run the SQL script for the stored procedures in the _StoredProcedures folder
    - Stored procedure scripts can only run one procedure per batch
  - Ensure the database connection matches your own server
    - Replace the Data Source under the Shared Data Sources for the GreenhouseDB.rds
    - This goes from UserComputer to your server name, or localhost; wherever your greenhouse database is located

## Screenshots
<img width="725" height="375" alt="image" src="https://github.com/user-attachments/assets/77660199-2b59-4944-a952-d9870937312c" />
<img width="365" height="223" alt="image" src="https://github.com/user-attachments/assets/ce51580b-8c18-4880-ada5-a69f1cc99b51" />
<img width="1228" height="286" alt="image" src="https://github.com/user-attachments/assets/d26a7879-cfd0-4def-8909-eb945c3b698c" />
