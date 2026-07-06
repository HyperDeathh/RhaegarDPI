:: =======================================================================
:: RhaegarDPI Service Uninstaller
:: Created by Yunus Emre Birben
:: Copyright (C) 2026 Yunus Emre Birben. All rights reserved.
:: Licensed under the GNU General Public License v3.0 (GPL-3.0)
:: =======================================================================
@echo off
setlocal EnableDelayedExpansion
PUSHD "%~dp0"

echo ============================================================
echo               RhaegarDPI Service Uninstaller                
echo              Created by Yunus Emre Birben                   
echo ============================================================
echo.

:: 1. Check for Administrator Privileges
echo [*] Checking Administrator privileges...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Administrator privileges are required.
    echo         Please right-click this script and choose "Run as administrator".
    echo.
    echo ============================================================
    pause
    exit /b
)
echo [+] Administrator privileges confirmed.
echo.

:: 2. Stop and Delete RhaegarDPI Service
echo [*] Stopping and removing RhaegarDPI service...
sc.exe stop "RhaegarDPI" >nul 2>&1
sc.exe delete "RhaegarDPI" >nul 2>&1
echo [+] RhaegarDPI service removed.
echo.

:: 3. Clean up legacy services
echo [*] Cleaning up legacy services (if any)...
sc.exe stop "GoodbyeDPI" >nul 2>&1
sc.exe delete "GoodbyeDPI" >nul 2>&1
sc.exe stop "WinDivert" >nul 2>&1
sc.exe delete "WinDivert" >nul 2>&1
sc.exe stop "WinDivert14" >nul 2>&1
sc.exe delete "WinDivert14" >nul 2>&1
echo [+] Legacy services cleaned up.
echo.

:: 4. Flush DNS
echo [*] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo [+] DNS cache flushed.
echo.

echo ============================================================
echo Uninstallation completed successfully!
echo Press any key to exit.
echo ============================================================
popd
pause >nul
