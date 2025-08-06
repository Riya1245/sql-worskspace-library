# LibraryDB SQL Project

## Overview

This project creates a `LibraryDB` database for managing authors, categories, books, members, and borrow records. It includes table creat
## Setup Instructions

1. **Open MySQL Workbench** or your preferred MySQL client.

2. **Create the database and tables** by running this script:
How to Update Data
Use primary key columns (AuthorID, MemberID, etc.) in your WHERE clause to avoid errors with safe update mode.

Example: Update email of Member with MemberID = 1

sql
Copy
Edit

How to Delete Data
To safely delete records with foreign key dependencies, first delete the related records, then the parent record.

Example: Delete a member with MemberID = 2

View Data
Check your data anytime by running:

sql
Copy
Edit
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;
