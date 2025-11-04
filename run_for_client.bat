@echo off
REM ============================================================
REM  Sign Language Inference - Auto Setup for Non-Technical Users
REM  Works with Python 3.8–3.12 (auto-installs everything)
REM ============================================================

cd /d "%~dp0"
echo ------------------------------------------------------------
echo SIGN LANGUAGE DETECTOR - AUTO SETUP
echo ------------------------------------------------------------
echo Current folder: %cd%
echo.

:: ---- Check for Python ----
where python >nul 2>&1
if errorlevel 1 (
    echo ❌ ERROR: Python was not found on your system.
    echo Please install Python 3.10 or newer from:
    echo https://www.python.org/downloads/
    echo And make sure to check "Add to PATH" during installation.
    pause
    exit /b 1
)

:: ---- Create virtual environment if missing ----
if not exist ".venv\Scripts\activate" (
    echo Creating local environment...
    python -m venv .venv
    if errorlevel 1 (
        echo ❌ Failed to create virtual environment. Make sure Python is installed correctly.
        pause
        exit /b 2
    )
)

:: ---- Activate environment ----
call .venv\Scripts\activate >nul 2>&1
if errorlevel 1 (
    echo ❌ Could not activate the environment.
    pause
    exit /b 3
)

echo ✅ Environment ready.
echo.

:: ---- Check installed packages ----
python -m pip install --upgrade pip >nul 2>&1
echo Installing required dependencies (this may take a few minutes)...

:: ---- Install dependencies with fallback handling ----
pip install mediapipe opencv-python scikit-learn numpy >nul 2>&1
if errorlevel 1 (
    echo ⚠️ Some packages failed to install. Retrying with headless OpenCV...
    pip install mediapipe opencv-python-headless scikit-learn numpy >nul 2>&1
)

:: ---- Verify OpenCV ----
python -c "import cv2" >nul 2>&1
if errorlevel 1 (
    echo ❌ ERROR: OpenCV could not be installed automatically.
    echo Please ensure you have internet access and re-run this file.
    pause
    exit /b 4
)

echo ✅ All dependencies installed.
echo.

:: ---- Check for main inference script ----
if not exist "inference_classifier.py" (
    echo ❌ ERROR: Could not find "inference_classifier.py" in:
    echo %cd%
    pause
    exit /b 5
)

:: ---- Run inference ----
echo 🚀 Starting Sign Language Detector...
echo When the camera window appears, press 'q' to quit.
echo.
"%cd%\.venv\Scripts\python.exe" -u inference_classifier.py > run_log.txt 2>&1

set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% neq 0 (
    echo ⚠️ The program exited with an error. See "run_log.txt" for details.
) else (
    echo ✅ Program finished successfully!
)
echo ------------------------------------------------------------
echo Press any key to close this window...
pause >nul
exit /b %EXIT_CODE%
