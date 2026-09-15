# 🤖 Bot Cripto - Windows 11 Launcher Guide

## 📋 Overview

Two Windows 11-optimized launchers have been created to make running Bot Cripto easier:

1. **run_win11.bat** - Batch file version (traditional Windows)
2. **run_win11.ps1** - PowerShell version (recommended for Windows 11)

---

## 🚀 Quick Start

### Option 1: PowerShell (RECOMMENDED ⭐)

**Best for Windows 11 - More robust and modern**

```powershell
# Method 1: Double-click
# Right-click on run_win11.ps1 → Run with PowerShell

# Method 2: PowerShell command
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\run_win11.ps1

# Method 3: Windows Terminal (recommended)
# Open Windows Terminal
# Run: .\run_win11.ps1
```

### Option 2: Batch File

**Traditional Windows method**

```bash
# Method 1: Double-click
# Double-click: run_win11.bat

# Method 2: Command Prompt
# Open Command Prompt in the directory
run_win11.bat
```

---

## ✨ Features

### Both Scripts Include:

✅ **Environment Checks**
- Verifies .NET 8 SDK is installed
- Confirms project file exists
- Shows .NET version

✅ **Automatic Restoration**
- Restores NuGet dependencies
- Downloads required packages
- Handles connectivity issues

✅ **Smart Building**
- Compiles in Release mode (optimized)
- Shows build progress
- Detailed error messages

✅ **Rich Output**
- Colored console text
- Progress indicators
- Clear status messages

✅ **Logging**
- Saves all output to `Logs/` directory
- Timestamped log files
- Easy troubleshooting

✅ **Error Handling**
- Catches missing .NET SDK
- Validates project structure
- Provides solutions for common errors

---

## 📊 What Happens When You Run

```
1. ✓ Verifica ambienti (Check environment)
   └─ Confirms .NET 8 SDK
   └─ Finds Bot-1.csproj

2. 📦 Ripristino dipendenze (Restore dependencies)
   └─ Downloads NuGet packages
   └─ Prepares build environment

3. 🔨 Compilazione (Build project)
   └─ Compiles in Release mode
   └─ Optimizes for performance

4. 🚀 Avvio bot (Run bot)
   └─ Starts live monitoring
   └─ Begins trading signal analysis
```

---

## 🔧 Prerequisites

Before running either script, ensure:

1. **Windows 11** installed (or Windows 10 with PowerShell 5.0+)

2. **.NET 8 SDK** installed
   - Download: https://dotnet.microsoft.com/download/dotnet/8.0
   - Verify: Open Command Prompt and run: `dotnet --version`
   - Should show version 8.0.x or higher

3. **Bot-1 folder** in correct location
   - Scripts must be in the same directory as Bot-1.csproj

4. **Internet connection** (for NuGet packages)

---

## 🎯 Recommended: PowerShell Method

**Windows 11 is optimized for PowerShell**, so we recommend using `run_win11.ps1`:

### Step 1: Set Execution Policy (First Time Only)

```powershell
# Open PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Type: Y and press Enter
```

### Step 2: Run the Script

**Option A - Windows Terminal (Modern)**
```powershell
# Open Windows Terminal (Win + Shift + X)
cd C:\path\to\Bot-1
.\run_win11.ps1
```

**Option B - Right-click Method (Easiest)**
```
1. Right-click on run_win11.ps1
2. Select "Run with PowerShell"
3. Click "Run" if prompted
```

**Option C - Command Prompt**
```bash
powershell -ExecutionPolicy Bypass -File run_win11.ps1
```

---

## 📝 Output & Logs

### Console Output Example:

```
╔════════════════════════════════════════════════════════════════╗
║          🤖 BOT CRIPTO v1.1 - WINDOWS 11 LAUNCHER             ║
║              Automatic Trading - Cryptocurrency               ║
╚════════════════════════════════════════════════════════════════╝

📋 Verifica ambienti...

  ✓ Verificando .NET SDK... OK
  ✅ .NET SDK: 8.0.300

  ✓ Cercando progetto... OK
  ✅ Progetto trovato: Bot-1.csproj

📦 Ripristino dipendenze...
  ✅ Dipendenze ripristinate

🔨 Compilazione in corso...
  ✅ Compilazione completata!

╔════════════════════════════════════════════════════════════════╗
║                   🚀 AVVIO BOT IN CORSO...                    ║
╚════════════════════════════════════════════════════════════════╝

🤖 BOT 1 - ERTF-Crypto - VERSIONE 1.1
[Bot starts and monitors cryptocurrencies...]
```

### Log Files:

All output is saved to `Logs/run_YYYYMMDD_HHMMSS.log`

```
Logs/
├─ run_20260915_140530.log
├─ run_20260915_143045.log
└─ run_20260915_150120.log
```

---

## ❌ Troubleshooting

### Problem: "dotnet: command not found"

**Solution:**
1. Install .NET 8 SDK from https://dotnet.microsoft.com/download/dotnet/8.0
2. Restart your computer
3. Try again

### Problem: "Bot-1.csproj not found"

**Solution:**
1. Make sure you're in the correct directory
2. Check that Bot-1.csproj file exists
3. Run the script from the root directory

### Problem: "Access denied" in PowerShell

**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Problem: Build fails with NuGet errors

**Solution:**
```powershell
dotnet clean
dotnet restore
dotnet build -c Release
```

### Problem: High memory usage

**Solution:**
1. Close other applications
2. Run in Release mode (scripts already do this)
3. Wait for build to complete

---

## 📊 Configuration

To customize bot parameters before running:

1. Open `appsettings.json`
2. Modify settings (capital, risk, intervals, etc.)
3. Save the file
4. Run the launcher script

---

## 🔄 File Comparison

| Feature | run.bat | run_win11.bat | run_win11.ps1 |
|---------|---------|---------------|---------------|
| Windows Compatible | ✅ | ✅ | ✅ |
| Error Handling | Basic | Advanced | Advanced |
| Logging | ❌ | ✅ | ✅ |
| Colored Output | ✅ | ✅ | ✅ |
| Environment Check | ❌ | ✅ | ✅ |
| Windows 11 Optimized | ❌ | ✅ | ✅ (Recommended) |

---

## 🎨 Color Scheme

**PowerShell Output Colors:**
- 🟢 Green = Success
- 🔴 Red = Error
- 🟡 Yellow = Warning
- 🔵 Cyan = Information
- 🟣 Magenta = Header

**Batch Output Colors:**
- 0A = Green text (success)
- 0B = Light cyan (info)
- 0C = Red (error)
- 0E = Yellow (warning)
- 0F = White (default)

---

## 📌 Pro Tips

1. **Pin to Start Menu** (Windows 11)
   - Right-click run_win11.ps1 → Pin to Start

2. **Create Shortcut**
   - Right-click → Send to → Desktop
   - Edit shortcut properties to run as administrator

3. **Schedule Daily Run**
   - Use Task Scheduler to run at specific times
   - Create batch file: `powershell -ExecutionPolicy Bypass -File run_win11.ps1`

4. **Monitor Logs**
   - Check `Logs/` folder for recent runs
   - Copy logs for analysis

5. **Performance**
   - Run in Release mode (both scripts do this)
   - Close unnecessary applications
   - Use SSD for faster compilation

---

## 📚 Related Files

- `run.bat` - Original launcher
- `run.ps1` - Original PowerShell script
- `appsettings.json` - Bot configuration
- `config.json` - Advanced settings
- `Bot-1.csproj` - Project file

---

## ❓ FAQ

**Q: Which launcher should I use?**
A: Use `run_win11.ps1` for Windows 11. It's more reliable and modern.

**Q: Do I need to install anything else?**
A: Only .NET 8 SDK. Everything else is downloaded automatically.

**Q: Can I run both bots simultaneously?**
A: Yes, from different folders/windows.

**Q: Does it require internet?**
A: Only for initial build (downloading NuGet packages). After that, it can run offline.

**Q: How long does compilation take?**
A: First run: 1-3 minutes (downloading packages)
   Subsequent runs: 30-60 seconds

---

## 📞 Support

If you encounter issues:

1. Check the log file: `Logs/run_*.log`
2. Verify .NET SDK: `dotnet --version`
3. Try clean build: `dotnet clean && dotnet build -c Release`
4. Check GitHub issues: https://github.com/rguarnieri1/Bot-1/issues

---

**Bot Cripto v1.1 - Windows 11 Launcher**
Made with ❤️ for automated crypto trading

