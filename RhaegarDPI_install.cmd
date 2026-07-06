:: =======================================================================
:: RhaegarDPI Service Installer
:: Created by Yunus Emre Birben
:: Copyright (C) 2026 Yunus Emre Birben. All rights reserved.
:: Licensed under the GNU General Public License v3.0 (GPL-3.0)
:: =======================================================================
@echo off
setlocal EnableDelayedExpansion
PUSHD "%~dp0"

echo ============================================================
echo               RhaegarDPI Service Installer                  
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

:: 2. Detect System Architecture
echo [*] Detecting system architecture...
set _arch=x86
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" set _arch=x86_64
if defined PROCESSOR_ARCHITEW6432 set _arch=x86_64
echo [+] Architecture detected: %_arch%
echo.

:: 3. Setup custom-hosts.txt
echo [*] Checking custom host list...
if not exist custom-hosts.txt (
    echo [-] custom-hosts.txt not found. Creating default list...
    (
        echo discord.com
        echo discord.gg
        echo discordapp.com
        echo discordapp.net
        echo discordcdn.com
        echo discord.media
        echo discordstatus.com
        echo x.com
        echo twitter.com
        echo xplay.gg
        echo discord.co
        echo discord.dev
        echo twimg.com
    ) > custom-hosts.txt
    echo [+] Default custom-hosts.txt created.
) else (
    echo [+] custom-hosts.txt already exists. Skipping creation.
)
echo.

:: 4. Clean up existing services
echo [*] Cleaning up legacy services (if any)...
sc.exe stop "GoodbyeDPI" >nul 2>&1
sc.exe delete "GoodbyeDPI" >nul 2>&1
sc.exe stop "RhaegarDPI" >nul 2>&1
sc.exe delete "RhaegarDPI" >nul 2>&1
echo [+] Cleaned up previous installations.
echo.

:: 5. Create RhaegarDPI Service
echo [*] Registering RhaegarDPI Windows service...
sc.exe create "RhaegarDPI" binPath= "\"%CD%\%_arch%\RhaegarDPI.exe\" -5 --blacklist \"%CD%\custom-hosts.txt\" --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253" start= "auto" >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Failed to create RhaegarDPI service.
    echo         Make sure your antivirus is not blocking the installation.
    echo.
    echo ============================================================
    pause
    exit /b
)
echo [+] Service registered successfully.
echo.

:: 6. Set Description
echo [*] Configuring service description...
sc.exe description "RhaegarDPI" "Custom hostlist + Turkey DNS redirect bypass service" >nul 2>&1
echo [+] Service description configured.
echo.

:: 7. Start Service
echo [*] Starting RhaegarDPI service...
sc.exe start "RhaegarDPI" >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Failed to start RhaegarDPI service.
    echo.
    echo ============================================================
    pause
    exit /b
)
echo [+] Service started successfully.
echo.

:: 8. Flush DNS
echo [*] Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo [+] DNS cache flushed.
echo.

:: 9. Verify Service Status
echo [*] Verifying installation status...
sc query "RhaegarDPI" | findstr RUNNING >nul 2>&1
if %errorLevel% equ 0 (
    echo [+] RhaegarDPI service is running successfully.
) else (
    echo [WARNING] Service was registered but is not running.
    echo           Please check system events or run the script again.
)
echo.

echo ============================================================
echo Installation completed successfully!
echo Press any key to exit.
echo ============================================================
popd
pause >nul