@echo off
title EduManager AI - Database Setup
color 0A
echo.
echo  Setting up MySQL database...
echo.
cd backend
node config/setupDatabase.js
cd ..
echo.
pause
