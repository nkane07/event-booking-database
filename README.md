# 🎟️ Event Booking Database (Ticketmaster-Inspired)

This project is a fully normalized **relational database system** designed to simulate an online event ticket booking platform — inspired by **Ticketmaster**. It was built to demonstrate core SQL skills, ER modeling, and system normalization from 1NF to 3NF as part of a university database module.

---

## 📦 Features

- ✅ Fully normalized schema (1NF–3NF)
- 🏟️ Models real-world entities: customers, venues, events, tickets, payments, seats
- 🔐 Secure password handling with hashing and salt
- 📤 Sample data insertion and complex query handling
- 📈 Focus on performance, integrity, and data security

---

## 🧱 Technologies Used

- **MySQL** – RDBMS used to create, query, and manage the schema  
- **phpMyAdmin / MySQL Workbench** – used for testing and visualization  
- **Draw.io / DrawDB** – for creating ER diagrams and normalization proofs  

---

## 📂 Project Contents

| File                 | Description                                                                  |
|----------------------|------------------------------------------------------------------------------|
| `schema.sql`         | Full DDL SQL script to create and populate the database                      |
| `database_report.pdf`| Written report explaining schema design, normalization, ERD, and security    |
| `README.md`          | This project overview                                                        |

---

## 🛠️ How to Use

1. **Clone or download** the repo:
   ```bash
   git clone https://github.com/nkane07/event-booking-database.git
   cd event-booking-database
2. **Import the SQL Schema**
Option A: Using phpMyAdmin
Open phpMyAdmin
Create a new database (e.g., ticketmaster_db)
Go to the "Import" tab and upload schema.sql

**Option B: Using MySQL CLI**
bash
Copy code
mysql -u your_username -p < schema.sql

## Explore the Database
Browse tables such as events, customers, tickets, payments, and seats
Test joins, filters, and simulate use-case queries
(e.g., show tickets by event, total seats sold, seats by venue)

## 📄 ERD and Report
This project is supported by a detailed academic report.
📎 View database_report.pdf

The report includes:
ER diagram and relational mappings
Explanation of design decisions
Step-by-step normalization (1NF → 2NF → 3NF)
Reflections on password hashing, indexing, and schema optimization

## 🚀 Future Enhancements
🌐 Add a front-end with React or Django
🛒 Create interactive ticket booking and checkout flow
🔐 Add authentication and admin portal
📬 Email triggers for booking confirmations
📊 Build analytics dashboard for venues and event tracking
🔍 Enhance filtering and search with full-text indexing

## 👩‍💻 Author
Niamh Kane
MSc Software Development @ Queen’s University Belfast
GitHub: @nkane07
Email: nkane07@qub.ac.uk

## 📜 License
This project is provided for educational and personal portfolio use only.
Please contact the author for permission before using it in commercial or instructional contexts.
