# ✨ Windows 11 Bot Cripto Setup

## 📦 What's New

Two Windows 11-optimized launcher scripts have been created:

### 1. **run_win11.ps1** ⭐ RECOMMENDED
- Modern PowerShell script for Windows 11
- Better error handling and logging
- Colored output with emoji indicators
- Automatic environment validation

### 2. **run_win11.bat**
- Enhanced batch file version
- Traditional Windows command prompt
- Detailed logging and timestamps
- Fallback option if PowerShell fails

### 3. **WIN11_LAUNCHER_GUIDE.md**
- Complete setup and usage guide
- Troubleshooting tips
- FAQ section
- Advanced configuration options

---

## 🚀 Quick Start (Choose One)

### ⭐ Option 1: PowerShell (RECOMMENDED)

```powershell
# Right-click run_win11.ps1 → Run with PowerShell
# OR
.\run_win11.ps1
```

### Option 2: Batch File

```batch
# Double-click run_win11.bat
# OR
run_win11.bat
```

### Option 3: Windows Terminal (Modern)

```powershell
# Open Windows Terminal (Win + Shift + X)
.\run_win11.ps1
```

---

## ✅ Features

Both scripts include:

- ✓ **Environment Check** - Verifies .NET 8 SDK
- ✓ **Auto Restore** - Downloads NuGet packages
- ✓ **Smart Build** - Compiles in Release mode
- ✓ **Rich Output** - Colored console with progress
- ✓ **Auto Logging** - Saves logs to `Logs/` folder
- ✓ **Error Handling** - Clear error messages
- ✓ **Fallback Support** - Handles common issues

---

## 📋 Prerequisites

Before running, ensure:

1. **Windows 11** (or Windows 10 with latest updates)
2. **.NET 8 SDK** installed
   - Download: https://dotnet.microsoft.com/download/dotnet/8.0
   - Verify: `dotnet --version`
3. **Internet connection** (for NuGet packages)

---

## 🎯 Recommended Setup

### First Time Setup:

```powershell
# 1. Open PowerShell as Administrator
# 2. Run this command once:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 3. Navigate to Bot-1 folder
cd C:\path\to\Bot-1

# 4. Run the launcher
.\run_win11.ps1
```

### Every Time After:

```powershell
# Just run:
.\run_win11.ps1
```

---

## 📊 What Happens

```
1. Environment Check
   ✓ Confirms .NET 8 SDK
   ✓ Finds Bot-1.csproj

2. Restore Dependencies
   ✓ Downloads NuGet packages
   ✓ Prepares environment

3. Build Project
   ✓ Compiles in Release mode
   ✓ Optimizes performance

4. Run Bot
   ✓ Starts monitoring
   ✓ Generates trading signals
```

---

## 📝 Output Example

```
╔════════════════════════════════════════════════════════════════╗
║          🤖 BOT CRIPTO v1.1 - WINDOWS 11 LAUNCHER             ║
║              Automatic Trading - Cryptocurrency               ║
╚════════════════════════════════════════════════════════════════╝

📋 Verifica ambienti...
  ✅ .NET SDK: 8.0.300
  ✅ Progetto trovato: Bot-1.csproj

📦 Ripristino dipendenze...
  ✅ Dipendenze ripristinate

🔨 Compilazione in corso...
  ✅ Compilazione completata!

🚀 AVVIO BOT IN CORSO...

🤖 BOT 1 - ERTF-Crypto - VERSIONE 1.1
[Bot monitoring 25 cryptocurrencies...]
```

---

## 🔧 Troubleshooting

### "dotnet: command not found"
→ Install .NET 8 SDK and restart computer

### "Bot-1.csproj not found"
→ Make sure you're in the correct directory

### PowerShell won't run script
→ Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Build fails
→ Try: `dotnet clean && dotnet restore && dotnet build -c Release`

---

## 📚 Full Guide

See **WIN11_LAUNCHER_GUIDE.md** for:
- Detailed setup instructions
- Advanced configuration
- Pro tips and tricks
- FAQ section

---

## 📂 File Structure

```
Bot-1/
├── run.bat                    (Original)
├── run.ps1                    (Original)
├── run_win11.bat              (NEW - Recommended for batch)
├── run_win11.ps1              (NEW - Recommended for PowerShell)
├── WIN11_LAUNCHER_GUIDE.md    (NEW - Complete guide)
├── WINDOWS11_SETUP.md         (NEW - This file)
├── Bot-1.csproj
├── Program.cs
├── appsettings.json
└── [other project files]
```

---

## ✨ Key Improvements

| Feature | Original | Windows 11 |
|---------|----------|-----------|
| Error Messages | Basic | Detailed & Helpful |
| Logging | Manual | Automatic |
| Environment Check | No | Yes |
| Progress Indicators | Text only | Emoji + Colors |
| Recovery Options | None | Auto-recovery |
| Win11 Optimization | No | Yes |

---

## 🎯 Next Steps

1. ✅ Download and install .NET 8 SDK
2. ✅ Copy `run_win11.ps1` and `run_win11.bat` to Bot-1 folder
3. ✅ Read **WIN11_LAUNCHER_GUIDE.md**
4. ✅ Run `run_win11.ps1` (recommended)
5. ✅ Monitor logs in `Logs/` folder

---

**Created with ❤️ for Windows 11**

Bot Cripto v1.1 - Automated Cryptocurrency Trading
