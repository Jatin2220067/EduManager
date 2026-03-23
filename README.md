# 🎓 EduManager AI — Full Stack School Management System
### MCA Final Year Project · Node.js + Express + MySQL + React

---

## 📁 Project Structure

```
edumanager/
├── package.json              ← root (run both servers together)
├── backend/
│   ├── server.js             ← Express entry point
│   ├── .env.example          ← copy to .env and fill in values
│   ├── package.json
│   ├── config/
│   │   ├── database.js       ← MySQL connection pool
│   │   └── setupDatabase.js  ← run once to create tables + seed data
│   ├── controllers/          ← business logic
│   ├── middleware/
│   │   └── auth.middleware.js← JWT verify + role guard
│   ├── routes/               ← REST API endpoints
│   ├── utils/
│   │   ├── email.js          ← Nodemailer (welcome, alerts, receipts)
│   │   └── logger.js         ← Winston logger
│   └── uploads/              ← file upload storage
└── frontend/
    ├── package.json
    └── src/
        ├── App.js            ← router + role-based navigation
        ├── context/
        │   └── AuthContext.js← global auth state + auto token refresh
        ├── hooks/
        │   └── useData.js    ← reusable API data-fetching hooks
        ├── utils/
        │   └── api.js        ← axios instance + all API methods
        ├── components/
        │   └── AppShell.js   ← shared header + nav for all roles
        └── pages/
            ├── LoginPage.js
            ├── admin/        ← 10 admin pages
            ├── teacher/      ← teacher pages
            ├── student/      ← student pages
            ├── parent/       ← parent pages
            └── shared/
                └── AIPage.js ← Claude AI chat (works for all roles)
```

---

## ⚙️ Prerequisites

Install these before starting:

| Tool        | Version  | Download                          |
|-------------|----------|-----------------------------------|
| Node.js     | v18+     | https://nodejs.org                |
| MySQL       | v8+      | https://dev.mysql.com/downloads/  |
| npm         | v9+      | (comes with Node.js)              |
| Git         | any      | https://git-scm.com               |

---

## 🚀 Step-by-Step Setup

### Step 1 — Install MySQL

1. Download MySQL Community Server from https://dev.mysql.com/downloads/mysql/
2. During installation, set a root password — remember it!
3. Make sure MySQL service is running:
   - **Windows**: Search "Services" → start "MySQL80"
   - **Mac**: `brew services start mysql`
   - **Linux**: `sudo systemctl start mysql`

---

### Step 2 — Set Up the Project

Open your terminal and run:

```bash
# 1. Navigate to the project folder
cd edumanager

# 2. Install root dependencies
npm install

# 3. Install backend dependencies
cd backend
npm install

# 4. Install frontend dependencies
cd ../frontend
npm install

# 5. Go back to root
cd ..
```

---

### Step 3 — Configure Environment Variables

```bash
# Copy the example file
cd backend
cp .env.example .env
```

Now open `backend/.env` and fill in your values:

```env
PORT=5000
NODE_ENV=development

# Your MySQL credentials
DB_HOST=localhost
DB_PORT=3306
DB_NAME=edumanager_db
DB_USER=root
DB_PASSWORD=your_mysql_root_password   ← CHANGE THIS

# JWT secrets — change to any long random string
JWT_SECRET=my_super_secret_key_abc123_change_this
JWT_REFRESH_SECRET=my_refresh_secret_xyz789_change_this

# Anthropic API key (get free at console.anthropic.com)
ANTHROPIC_API_KEY=sk-ant-api03-xxxxxxxx   ← CHANGE THIS

# Email (optional — for fee receipts, alerts)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_gmail@gmail.com
EMAIL_PASS=your_gmail_app_password
EMAIL_FROM=EduManager AI <your_gmail@gmail.com>

CLIENT_URL=http://localhost:3000
```

> **Gmail App Password**: Go to Google Account → Security → 2-Step Verification → App Passwords → Create one

---

### Step 4 — Create Database & Tables

```bash
# From the backend folder:
cd backend
node config/setupDatabase.js
```

You should see:
```
✅ Connected to MySQL
📂 Using database: edumanager_db
📋 Table: users
📋 Table: students
... (all tables)
✅ Database setup complete!

Demo Login Credentials:
  Admin:   admin@school.edu    / admin123
  Teacher: teacher@school.edu  / teacher123
  Student: aarav@school.edu    / student123
  Parent:  parent1@school.edu  / parent123
```

---

### Step 5 — Start the Application

From the **project root** folder:

```bash
# Start both backend + frontend together
npm run dev
```

This runs:
- **Backend** on `http://localhost:5000`
- **Frontend** on `http://localhost:3000`

Open your browser and go to: **http://localhost:3000**

---

## 🔑 Demo Login Credentials

| Role        | Email                  | Password     |
|-------------|------------------------|--------------|
| 🛡️ Admin    | admin@school.edu       | admin123     |
| 📚 Teacher  | teacher@school.edu     | teacher123   |
| 📚 Teacher  | amit@school.edu        | teacher123   |
| 🎒 Student  | aarav@school.edu       | student123   |
| 🎒 Student  | priya@school.edu       | student123   |
| 👨‍👩‍👧 Parent  | parent1@school.edu     | parent123    |

---

## 🛡️ API Endpoints Reference

### Auth
| Method | Endpoint                    | Access  |
|--------|-----------------------------|---------|
| POST   | /api/auth/login             | Public  |
| POST   | /api/auth/register          | Public  |
| POST   | /api/auth/refresh           | Public  |
| POST   | /api/auth/logout            | Auth    |
| GET    | /api/auth/me                | Auth    |
| PUT    | /api/auth/change-password   | Auth    |

### Students
| Method | Endpoint                    | Access      |
|--------|-----------------------------|-------------|
| GET    | /api/students               | Staff       |
| POST   | /api/students               | Staff       |
| GET    | /api/students/:id           | Auth        |
| PUT    | /api/students/:id           | Staff       |
| DELETE | /api/students/:id           | Admin       |
| GET    | /api/students/:id/summary   | Auth        |

### Classes
| Method | Endpoint        | Access |
|--------|-----------------|--------|
| GET    | /api/classes    | Auth   |
| POST   | /api/classes    | Admin  |
| PUT    | /api/classes/:id| Admin  |
| DELETE | /api/classes/:id| Admin  |

### Other Routes
- `GET/POST /api/grades`
- `GET/POST /api/attendance`
- `GET/POST /api/fees`
- `GET/POST /api/exams`
- `GET /api/reports/reportcard/:studentId`
- `GET /api/reports/ai-remark/:studentId`
- `POST /api/ai/chat`
- `GET/POST /api/notifications`

---

## 🏗️ Tech Stack

| Layer        | Technology                  |
|--------------|-----------------------------|
| Frontend     | React 18, React Router v6   |
| HTTP Client  | Axios (auto token refresh)  |
| Styling      | Inline CSS + Google Fonts   |
| Backend      | Node.js + Express 4         |
| Database     | MySQL 8 (mysql2 driver)     |
| Auth         | JWT (access + refresh tokens)|
| Password     | bcryptjs (12 rounds)        |
| PDF Export   | PDFKit                      |
| Email        | Nodemailer + Gmail SMTP     |
| AI           | Anthropic Claude API        |
| Security     | Helmet, CORS, Rate Limiting |
| Logging      | Winston                     |

---

## 🎓 MCA Project Features Checklist

- [x] **Multi-role Authentication** — Admin, Teacher, Student, Parent
- [x] **JWT with Refresh Tokens** — Secure, auto-renewing sessions
- [x] **Role-Based Access Control** — Each role sees only relevant data
- [x] **Student Management** — Full CRUD with auto roll number
- [x] **Class Management** — Create, edit, delete, assign teachers
- [x] **Grade Management** — Per-subject, bulk entry, auto grade calculation
- [x] **Attendance Tracking** — Daily marking, bulk mark, alerts
- [x] **Fee Management** — Structure, payment tracking, receipts
- [x] **Exam Scheduling** — Create, manage, status tracking
- [x] **PDF Report Cards** — Server-side generation with PDFKit
- [x] **AI Integration** — Claude API for chat + automated remarks
- [x] **Email Notifications** — Welcome, fee receipts, attendance alerts
- [x] **Audit Logging** — Track all admin actions
- [x] **Rate Limiting** — Brute-force protection on login
- [x] **Security Headers** — Helmet.js
- [x] **Input Validation** — express-validator
- [x] **Transaction Support** — MySQL transactions for data integrity
- [x] **Responsive UI** — Works on desktop and tablet

---

## 🔧 Troubleshooting

**MySQL connection failed**
```bash
# Check MySQL is running
mysql -u root -p
# Try: SHOW DATABASES;
```

**Port already in use**
```bash
# Kill process on port 5000
npx kill-port 5000
# or change PORT in .env
```

**npm install fails**
```bash
# Clear cache and retry
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

**AI features not working**
- Check `ANTHROPIC_API_KEY` in `.env` is valid
- Get a key at https://console.anthropic.com (free credits for new accounts)

---

## 📧 Contact

This project was built as an MCA Final Year Project demonstrating:
full-stack web development, RESTful API design, database design,
JWT authentication, AI integration, and PDF generation.
