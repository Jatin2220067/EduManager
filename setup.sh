#!/bin/bash
set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}========================================"
echo "  EduManager AI - Full Stack Setup"
echo "  MCA Project - Node.js + MySQL + React"
echo -e "========================================${NC}"
echo ""

# Check Node.js
echo "[1/5] Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}ERROR: Node.js not found!${NC}"
    echo "Download from: https://nodejs.org (LTS version)"
    exit 1
fi
echo -e "${GREEN}  Node.js: $(node -v)${NC}"

# Check npm
echo ""
echo "[2/5] Checking npm..."
if ! command -v npm &> /dev/null; then
    echo -e "${RED}ERROR: npm not found. Reinstall Node.js.${NC}"
    exit 1
fi
echo -e "${GREEN}  npm: $(npm -v)${NC}"

# Install root dependencies
echo ""
echo "[3/5] Installing root dependencies..."
npm install
echo -e "${GREEN}  Root dependencies done!${NC}"

# Install backend
echo ""
echo "[4/5] Installing backend dependencies..."
cd backend && npm install && cd ..
echo -e "${GREEN}  Backend dependencies done!${NC}"

# Install frontend
echo ""
echo "[5/5] Installing frontend dependencies..."
cd frontend && npm install && cd ..
echo -e "${GREEN}  Frontend dependencies done!${NC}"

# Create .env
echo ""
echo "[Setup] Creating .env file..."
if [ ! -f backend/.env ]; then
    cp backend/.env.example backend/.env
    echo -e "${YELLOW}  .env created at backend/.env${NC}"
    echo ""
    echo -e "${YELLOW}  *** IMPORTANT - Edit backend/.env and set: ***"
    echo "      DB_PASSWORD       = your MySQL root password"
    echo "      JWT_SECRET        = any long random string"
    echo -e "      ANTHROPIC_API_KEY = key from console.anthropic.com${NC}"
else
    echo "  .env already exists - skipping"
fi

mkdir -p backend/uploads backend/logs

echo ""
echo -e "${GREEN}========================================"
echo "  SETUP COMPLETE!"
echo -e "========================================${NC}"
echo ""
echo "NEXT STEPS:"
echo "  1. Edit backend/.env with your MySQL password + API key"
echo "  2. Make sure MySQL is running"
echo "  3. Run: node backend/config/setupDatabase.js"
echo "  4. Run: npm run dev"
echo "  5. Open: http://localhost:3000"
echo ""
echo "Demo Logins:"
echo "  Admin:   admin@school.edu   / admin123"
echo "  Teacher: teacher@school.edu / teacher123"
echo "  Student: aarav@school.edu   / student123"
echo "  Parent:  parent1@school.edu / parent123"
echo ""
