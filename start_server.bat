@echo off
REM Start local server for Indian Railways THI App
REM This script starts a local HTTP server to serve the app

echo.
echo ========================================
echo   Indian Railways THI - Local Server
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo.
    echo Please install Python from https://www.python.org/
    echo Make sure to check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)

echo Starting local server on http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the server
python -m http.server 8000

pause
