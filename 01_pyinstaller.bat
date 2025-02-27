@echo off
echo ================================================
echo Python Installation Batch File (3.10.6)
echo ================================================



REM PATH configuration (optional)
echo In the installer's initial screen, check "Add Python 3.10 to PATH".
echo In the installation completion screen, click "Disable path length limit".

REM Define constants
set "PYTHON_VERSION=3.10.6"
set "PYTHON_INSTALLER=python-%PYTHON_VERSION%-amd64.exe"
set "DOWNLOAD_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/%PYTHON_INSTALLER%"

REM Set temporary directory
set "TEMP_DIR=%TEMP%\python_installer"
if not exist "%TEMP_DIR%" (
    mkdir "%TEMP_DIR%" >nul 2>&1
)

set "PYTHON_INSTALLER_PATH=%TEMP_DIR%\%PYTHON_INSTALLER%"

echo Downloading Python %PYTHON_VERSION%...
curl -L -o "%PYTHON_INSTALLER_PATH%" "%DOWNLOAD_URL%"
if %errorlevel% NEQ 0 (
    echo Failed to download the Python installer.
    pause
    exit /B
)

REM Execute the installer in GUI mode
echo Launching the Python installer. Please select the installation options.
start "" "%PYTHON_INSTALLER_PATH%"
echo After the Python installation is complete, please close this window.
pause

REM Delete the installer
del "%PYTHON_INSTALLER_PATH%" /f /q
rmdir "%TEMP_DIR%" /s /q

echo Please restart your system if necessary.
pause
