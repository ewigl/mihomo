@echo off

SET PROCESS_NAME=mihomo-windows-amd64.exe

tasklist | findstr "%PROCESS_NAME%"

if ERRORLEVEL 1 (
    echo Mihomo not running.
) else (
    taskkill /F /T /im %PROCESS_NAME%
)

timeout /t 2

tasklist | findstr "%PROCESS_NAME%"

if ERRORLEVEL 1 (
    echo Mihomo stoped.
) else (
    echo Error occurred, pls try again with admin permission.
)

pause
