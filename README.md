# 🎓 EduManager AI
### Full Stack School Management System · MCA Final Year Project

![Node.js](https://img.shields.io/badge/Node.js-18+-green)
![React](https://img.shields.io/badge/React-18-blue)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange)
![License](https://img.shields.io/badge/License-MIT-purple)

> A complete school management system with 4 role-based portals (Admin, Teacher, Student, Parent), AI-powered insights via Claude, PDF report cards, fee management, and more.

---

## ✨ Features

| Feature | Details |
|---|---|
| 🔐 Multi-Role Auth | Admin, Teacher, Student, Parent with JWT |
| 🏫 Class Management | Create, edit, assign teachers, capacity tracking |
| 👥 Student Management | Enroll, profiles, auto roll numbers |
| 📝 Grade Management | Per-subject, bulk entry, auto grade calculation |
| 📅 Attendance | Daily marking, bulk mark, parent alerts |
| 💰 Fee Management | Structure, payment tracking, email receipts |
| 📋 Exam Management | Schedule, status tracking |
| 📄 PDF Report Cards | Server-side generation with AI remarks |
| ✨ AI Assistant | Claude-powered chat for each role |
| 📧 Email Alerts | Attendance, fee receipts, welcome emails |

---

## 🚀 Quick Start

### Prerequisites
- Node.js v18+ → https://nodejs.org
- MySQL 8+ → https://dev.mysql.com/downloads/mysql/

### Windows
```bash
# 1. Double-click setup.bat  (installs everything)
# 2. Edit backend/.env with your MySQL password + API key
# 3. Double-click db-setup.bat  (creates database)
# 4. Double-click start.bat  (runs the app)
# 5. Open http://localhost:3000
```

### Mac / Linux
```bash
chmod +x setup.sh db-setup.sh start.sh
./setup.sh          # installs everything
# edit backend/.env
./db-setup.sh       # creates database
./start.sh          # runs the app
# open http://localhost:3000
```

### Manual (all platforms)
```bash
npm install
cd backend && npm install && cd ..
cd frontend && npm install && cd ..
cp backend/.env.example backend/.env
# edit backend/.env
node backend/config/setupDatabase.js
npm run dev
```

---

## ⚙️ Environment Setup

Copy `backend/.env.example` to `backend/.env` and fill in:

```env
DB_PASSWORD=your_mysql_root_password
JWT_SECRET=any_long_random_string_here
ANTHROPIC_API_KEY=sk-ant-api03-xxxxx    # from console.anthropic.com (free)
```

---

## 🔑 Demo Credentials

| Role | Email | Password |
|------|-------|----------|
| 🛡️ Admin | admin@school.edu | admin123 |
| 📚 Teacher | teacher@school.edu | teacher123 |
| 🎒 Student | aarav@school.edu | student123 |
| 👨‍👩‍👧 Parent | parent1@school.edu | parent123 |

---

## 🗂️ Project Structure

```
edumanager/
├── setup.bat / setup.sh        ← one-click install (Windows/Mac)
├── start.bat / start.sh        ← one-click start
├── db-setup.bat / db-setup.sh  ← database setup
├── package.json                ← root (runs both servers)
├── backend/
│   ├── server.js               ← Express entry point
│   ├── .env.example            ← environment template
│   ├── config/
│   │   ├── database.js         ← MySQL connection pool
│   │   └── setupDatabase.js    ← creates tables + seed data
│   ├── controllers/            ← auth, students, grades, fees, PDF
│   ├── middleware/             ← JWT auth + role guards
│   ├── routes/                 ← REST API endpoints
│   └── utils/                  ← email + logger
└── frontend/
    └── src/
        ├── App.js              ← routing
        ├── context/            ← auth state
        ├── hooks/              ← data fetching
        ├── utils/api.js        ← axios + all API calls
        ├── components/         ← shared AppShell
        └── pages/
            ├── admin/          ← 10 admin pages
            ├── teacher/        ← teacher portal
            ├── student/        ← student portal
            └── parent/         ← parent portal
```

---

## 🛡️ API Reference

| Method | Endpoint | Access |
|--------|----------|--------|
| POST | /api/auth/login | Public |
| GET | /api/students | Staff |
| POST | /api/students | Staff |
| GET | /api/classes | Auth |
| POST | /api/classes | Admin |
| GET | /api/grades/student/:id | Auth |
| POST | /api/attendance/bulk | Staff |
| POST | /api/fees/pay | Admin |
| GET | /api/reports/reportcard/:id | Auth |
| POST | /api/ai/chat | Auth |

---

## 🏗️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, React Router v6, Axios |
| Backend | Node.js, Express 4 |
| Database | MySQL 8 (mysql2) |
| Auth | JWT access + refresh tokens, bcryptjs |
| PDF | PDFKit (server-side) |
| Email | Nodemailer + Gmail SMTP |
| AI | Anthropic Claude API |
| Security | Helmet, CORS, Rate Limiting, express-validator |
| Logging | Winston |
| CI/CD | GitHub Actions |

---

## 📖 GitHub Upload Guide

See [`.github/GITHUB_SETUP.md`](.github/GITHUB_SETUP.md) for step-by-step instructions to push to GitHub.

---

## 📄 License

MIT — free to use for educational purposes.

---

*Built as MCA Final Year Project demonstrating full-stack development, RESTful APIs, MySQL database design, JWT auth, AI integration, and PDF generation.*
