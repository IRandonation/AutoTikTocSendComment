@echo off
setlocal
echo [Douyin Auto Sender] Checking environment...

REM Check if uv is installed
where uv >nul 2>nul
if %errorlevel% neq 0 (
    echo [Info] 'uv' not found. Installing uv...
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    set "PATH=%USERPROFILE%\.cargo\bin;%PATH%"
) else (
    echo [Info] 'uv' is already installed.
)

echo [Info] Installing/Syncing dependencies...
uv sync

echo [Info] Starting application...
uv run main.py

if %errorlevel% neq 0 (
    echo [Error] Application crashed or exited with error.
    pause
)
endlocal
