# 🦷 Operational Analysis — ClinicAssist

Analysis of real data from **ClinicAssist**, a live SaaS managing dental clinics across Mexico.  
The goal is to answer key business questions about revenue, demand, and operational performance.

---

## 🗂 Context

ClinicAssist operates **15 dental clinics** across 8 states in Mexico.  
The database includes clinics, patients, dentists, appointments, and treatments.

| Table | Records |
|---|---|
| Clinics | 15 |
| Patients | 30 |
| Appointments | 77 |
| Treatments | 47 |

---

## ❓ Business Questions

1. Which treatments generate the most revenue?
2. What is the average ticket per service type?
3. Which city has the most profitable market?
4. Which dentist has the highest workload?
5. Which month has the most activity?
6. Which clinic has the most patients?

---

## 📊 Key Findings

- **Endodontics** generates 43% of total revenue ($40,500 MXN) despite being a low-volume procedure
- An endodontic treatment is worth **6.7x more** than a cleaning in average ticket
- **Monterrey** is the most profitable market by average ticket ($2,320 MXN)
- **Q1 (Jan–Mar)** concentrates the highest patient demand of the year
- CDMX and Monterrey tie as the clinics with the most patients (9 each)

---

## 🛠 Tech Stack

- **PostgreSQL** — database engine
- **DBeaver** — SQL client
- **Git + GitHub** — version control

📄 [View SQL queries](./queries.sql)

---

## ▶️ How to Run

1. Clone the repository
2. Connect to a PostgreSQL instance with the ClinicAssist schema
3. Open `queries.sql` in DBeaver or any SQL client
4. Execute each query individually
