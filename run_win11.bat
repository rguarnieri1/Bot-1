@echo off
REM ============================================================================
REM Bot Cripto - Windows 11 Optimized Launcher
REM Version 1.1 - Enhanced for Windows 11
REM ============================================================================

setlocal enabledelayedexpansion
color 0A

REM Set UTF-8 encoding for better character support
chcp 65001 > nul 2>&1

REM Create log directory
if not exist "Logs" mkdir Logs
set "LOGFILE=Logs\run_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%.log"

REM ============================================================================
REM BANNER
REM ============================================================================
cls
echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║                                                                ║
echo ║          🤖 BOT CRIPTO v1.1 - WINDOWS 11 LAUNCHER             ║
echo ║                                                                ║
echo ║              Automatic Trading - Cryptocurrency               ║
echo ║                                                                ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo [%date% %time%] Inizializzazione bot...
echo [%date% %time%] Inizializzazione bot... >> "%LOGFILE%"
echo.

REM ============================================================================
REM ENVIRONMENT CHECK
REM ============================================================================
echo 📋 Verifica ambienti...
echo.

REM Check .NET SDK
echo   ✓ Verificando .NET SDK...
dotnet --version > nul 2>&1
if errorlevel 1 (
    color 0C
    echo   ❌ ERRORE: .NET 8 SDK non trovato!
    echo   ❌ ERRORE: .NET 8 SDK non trovato! >> "%LOGFILE%"
    echo.
    echo   Soluzione:
    echo   1. Scarica .NET 8 da: https://dotnet.microsoft.com/download/dotnet/8.0
    echo   2. Installa il pacchetto
    echo   3. Riavvia questo script
    echo.
    pause
    exit /b 1
)
for /f "tokens=*" %%i in ('dotnet --version') do set "DOTNET_VERSION=%%i"
echo   ✅ .NET SDK: %DOTNET_VERSION%
echo   ✅ .NET SDK: %DOTNET_VERSION% >> "%LOGFILE%"
echo.

REM Check if Bot-1.csproj exists
if not exist "Bot-1.csproj" (
    color 0C
    echo   ❌ ERRORE: Bot-1.csproj non trovato!
    echo   ❌ ERRORE: Bot-1.csproj non trovato! >> "%LOGFILE%"
    echo.
    echo   Assicurati di essere nella directory corretta.
    echo.
    pause
    exit /b 1
)
echo   ✅ Progetto trovato: Bot-1.csproj
echo   ✅ Progetto trovato: Bot-1.csproj >> "%LOGFILE%"
echo.

REM ============================================================================
REM RESTORE DEPENDENCIES
REM ============================================================================
color 0B
echo 📦 Ripristino dipendenze...
echo [%date% %time%] Ripristino dipendenze... >> "%LOGFILE%"

dotnet restore > nul 2>&1
if errorlevel 1 (
    color 0C
    echo   ❌ Errore nel ripristino dipendenze!
    echo   ❌ Errore nel ripristino dipendenze! >> "%LOGFILE%"
    echo.
    echo   Prova questi comandi manualmente:
    echo   dotnet restore
    echo   dotnet clean
    echo   dotnet build -c Release
    echo.
    pause
    exit /b 1
)
echo   ✅ Dipendenze ripristinate
echo   ✅ Dipendenze ripristinate >> "%LOGFILE%"
echo.

REM ============================================================================
REM BUILD PROJECT
REM ============================================================================
color 0E
echo 🔨 Compilazione in corso (Release mode)...
echo [%date% %time%] Compilazione in corso... >> "%LOGFILE%"
echo.

dotnet build -c Release 2>&1
if errorlevel 1 (
    color 0C
    echo.
    echo   ❌ ERRORE NELLA COMPILAZIONE!
    echo   ❌ ERRORE NELLA COMPILAZIONE! >> "%LOGFILE%"
    echo.
    echo   Prova questi comandi per debug:
    echo   dotnet clean
    echo   dotnet build -c Release --verbose
    echo.
    pause
    exit /b 1
)
echo.
echo   ✅ Compilazione completata con successo!
echo   ✅ Compilazione completata! >> "%LOGFILE%"
echo.

REM ============================================================================
REM RUN BOT
REM ============================================================================
color 0A
echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║                   🚀 AVVIO BOT IN CORSO...                    ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo [%date% %time%] Avvio bot...
echo [%date% %time%] Avvio bot... >> "%LOGFILE%"
echo.

REM Run in Release mode
dotnet run -c Release 2>&1 | tee -a "%LOGFILE%"

if errorlevel 1 (
    color 0C
    echo.
    echo   ⚠️  Bot terminato con codice di errore: %ERRORLEVEL%
    echo   ⚠️  Bot terminato con codice di errore: %ERRORLEVEL% >> "%LOGFILE%"
    echo.
) else (
    color 0B
    echo.
    echo   ✅ Bot terminato correttamente
    echo   ✅ Bot terminato correttamente >> "%LOGFILE%"
    echo.
)

REM ============================================================================
REM CLEANUP AND EXIT
REM ============================================================================
echo [%date% %time%] Script terminato >> "%LOGFILE%"
color 0F
echo.
echo Log salvato in: %LOGFILE%
echo.
pause
exit /b 0
