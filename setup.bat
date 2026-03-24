@echo off
title EduManager AI - Setup Script
color 0A

echo.
echo  ========================================
echo    EduManager AI - Full Stack Setup
echo    MCA Project - Node.js + MySQL + React
echo  ========================================
echo.

:: Check Node.js
echo [1/5] Checking Node.js...
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Node.js is not installed!
    echo  Please download from: https://nodejs.org
    echo  Install LTS version, then run this script again.
    pause
    exit /b 1
)
echo  Node.js found:
node -v

:: Check npm
echo.
echo [2/5] Checking npm...
npm -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: npm not found. Reinstall Node.js.
    pause
    exit /b 1
)
echo  npm found:
npm -v

:: Install root dependencies
echo.
echo [3/5] Installing root dependencies (concurrently)...
call npm install
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Root npm install failed.
    pause
    exit /b 1
)
echo  Root dependencies installed!

:: Install backend dependencies
echo.
echo [4/5] Installing backend dependencies...
cd backend
call npm install
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Backend npm install failed.
    pause
    exit /b 1
)
cd ..
echo  Backend dependencies installed!

:: Install frontend dependencies
echo.
echo [5/5] Installing frontend dependencies...
cd frontend
call npm install
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Frontend npm install failed.
    pause
    exit /b 1
)
cd ..
echo  Frontend dependencies installed!

:: Create .env from example
echo.
echo [Setup] Creating .env file from template...
IF NOT EXIST backend\.env (
    copy backend\.env.example backend\.env
    echo  .env file created at backend\.env
    echo.
    echo  *** IMPORTANT: Open backend\.env and fill in: ***
    echo      DB_PASSWORD       = your MySQL root password
    echo      JWT_SECRET        = any long random string
    echo      ANTHROPIC_API_KEY = key from console.anthropic.com
) ELSE (
    echo  .env already exists - skipping
)

if not exist backend\uploads mkdir backend\uploads
if not exist backend\logs    mkdir backend\logs

echo.
echo  ========================================
echo    SETUP COMPLETE!
echo  ========================================
echo.
echo  NEXT STEPS:
echo  1. Edit backend\.env with your MySQL password + API key
echo  2. Make sure MySQL is running
echo  3. Run: node backend\config\setupDatabase.js
echo  4. Run: npm run dev
echo  5. Open: http://localhost:3000
echo.
echo  Demo Logins:
echo    Admin:   admin@school.edu   / admin123
echo    Teacher: teacher@school.edu / teacher123
echo    Student: aarav@school.edu   / student123
echo    Parent:  parent1@school.edu / parent123
echo.
pause
