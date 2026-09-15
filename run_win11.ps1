# ============================================================================
# Bot Cripto - Windows 11 PowerShell Launcher (Recommended)
# Version 1.1 - Enhanced for Windows 11
# ============================================================================

# Set UTF-8 encoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Color definitions
$colors = @{
    Success = "Green"
    Error   = "Red"
    Warning = "Yellow"
    Info    = "Cyan"
    Header  = "Magenta"
}

# Create log directory
$logDir = "Logs"
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}
$logFile = Join-Path $logDir "run_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param(
        [string]$Message,
        [ValidateSet("Info", "Success", "Error", "Warning")]
        [string]$Level = "Info"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"

    Add-Content -Path $logFile -Value $logMessage
    Write-Host $logMessage -ForegroundColor $colors[$Level]
}

function Show-Banner {
    Clear-Host
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
    Write-Host "║                                                                ║" -ForegroundColor Magenta
    Write-Host "║          🤖 BOT CRIPTO v1.1 - WINDOWS 11 LAUNCHER             ║" -ForegroundColor Magenta
    Write-Host "║                                                                ║" -ForegroundColor Magenta
    Write-Host "║              Automatic Trading - Cryptocurrency               ║" -ForegroundColor Magenta
    Write-Host "║                                                                ║" -ForegroundColor Magenta
    Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta
    Write-Host ""
}

function Check-DotNet {
    Write-Host "📋 Verifica ambienti..." -ForegroundColor Cyan
    Write-Host ""
    Write-Host "  ✓ Verificando .NET SDK..." -NoNewline

    try {
        $dotnetVersion = dotnet --version 2>$null
        Write-Host " OK" -ForegroundColor Green
        Write-Log ".NET SDK trovato: $dotnetVersion" "Success"
        Write-Host "  ✅ .NET SDK: $dotnetVersion" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host " FALLITO" -ForegroundColor Red
        Write-Log ".NET SDK non trovato" "Error"
        Write-Host ""
        Write-Host "  ❌ ERRORE: .NET 8 SDK non trovato!" -ForegroundColor Red
        Write-Host ""
        Write-Host "  Soluzione:" -ForegroundColor Yellow
        Write-Host "  1. Scarica .NET 8 da: https://dotnet.microsoft.com/download/dotnet/8.0" -ForegroundColor Yellow
        Write-Host "  2. Installa il pacchetto" -ForegroundColor Yellow
        Write-Host "  3. Riavvia questo script" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "Premi INVIO per uscire"
        exit 1
    }
}

function Check-ProjectFile {
    Write-Host "  ✓ Cercando progetto..." -NoNewline

    if (Test-Path "Bot-1.csproj") {
        Write-Host " OK" -ForegroundColor Green
        Write-Log "Progetto trovato: Bot-1.csproj" "Success"
        Write-Host "  ✅ Progetto trovato: Bot-1.csproj" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host " FALLITO" -ForegroundColor Red
        Write-Log "Progetto non trovato: Bot-1.csproj" "Error"
        Write-Host ""
        Write-Host "  ❌ ERRORE: Bot-1.csproj non trovato!" -ForegroundColor Red
        Write-Host "  Assicurati di essere nella directory corretta." -ForegroundColor Red
        Write-Host ""
        Read-Host "Premi INVIO per uscire"
        exit 1
    }
}

function Restore-Dependencies {
    Write-Host ""
    Write-Host "📦 Ripristino dipendenze..." -ForegroundColor Cyan
    Write-Log "Ripristino dipendenze in corso..." "Info"

    try {
        dotnet restore | Out-Null
        Write-Host "  ✅ Dipendenze ripristinate" -ForegroundColor Green
        Write-Log "Dipendenze ripristinate" "Success"
        return $true
    }
    catch {
        Write-Host "  ❌ Errore nel ripristino dipendenze!" -ForegroundColor Red
        Write-Log "Errore nel ripristino: $_" "Error"
        Write-Host ""
        Write-Host "  Prova questi comandi manualmente:" -ForegroundColor Yellow
        Write-Host "  dotnet restore" -ForegroundColor Yellow
        Write-Host "  dotnet clean" -ForegroundColor Yellow
        Write-Host "  dotnet build -c Release" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "Premi INVIO per uscire"
        exit 1
    }
}

function Build-Project {
    Write-Host ""
    Write-Host "🔨 Compilazione in corso (Release mode)..." -ForegroundColor Yellow
    Write-Log "Compilazione in corso..." "Info"
    Write-Host ""

    try {
        dotnet build -c Release
        Write-Host ""
        Write-Host "  ✅ Compilazione completata con successo!" -ForegroundColor Green
        Write-Log "Compilazione completata" "Success"
        return $true
    }
    catch {
        Write-Host ""
        Write-Host "  ❌ ERRORE NELLA COMPILAZIONE!" -ForegroundColor Red
        Write-Log "Errore compilazione: $_" "Error"
        Write-Host ""
        Write-Host "  Prova questi comandi per debug:" -ForegroundColor Yellow
        Write-Host "  dotnet clean" -ForegroundColor Yellow
        Write-Host "  dotnet build -c Release --verbose" -ForegroundColor Yellow
        Write-Host ""
        Read-Host "Premi INVIO per uscire"
        exit 1
    }
}

function Run-Bot {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                   🚀 AVVIO BOT IN CORSO...                    ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""
    Write-Log "Avvio bot..." "Info"
    Write-Host ""

    try {
        dotnet run -c Release
        Write-Host ""
        Write-Host "  ✅ Bot terminato correttamente" -ForegroundColor Green
        Write-Log "Bot terminato correttamente" "Success"
    }
    catch {
        Write-Host ""
        Write-Host "  ⚠️  Errore durante l'esecuzione: $_" -ForegroundColor Yellow
        Write-Log "Errore esecuzione: $_" "Warning"
    }
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================

try {
    Show-Banner
    Write-Log "Script avviato" "Info"

    # Pre-flight checks
    Check-DotNet
    Check-ProjectFile
    Write-Host ""

    # Build
    Restore-Dependencies
    Build-Project

    # Run
    Run-Bot
}
catch {
    Write-Log "Errore non gestito: $_" "Error"
    Write-Host ""
    Write-Host "❌ Errore non gestito: $_" -ForegroundColor Red
}
finally {
    Write-Host ""
    Write-Host "Log salvato in: $logFile" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Premi INVIO per uscire"
}
