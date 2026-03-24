#!/bin/bash
echo ""
echo "Setting up MySQL database..."
echo ""
cd backend && node config/setupDatabase.js && cd ..
