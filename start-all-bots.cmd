@echo off
setlocal enabledelayedexpansion
rem Avvia gli exe dei bot 1,6,7,8,9,10,11,12,13 presenti in <cartella>\bin\Release\net11.0\
rem con 10 secondi di attesa tra uno e l'altro.
set "ROOT=%~dp0"
set "BOTS=1 6 7 8 9 10 11 12 13"
set "FRAMEWORK=net11.0"
set "DELAY=10"

set COUNT=0
for %%N in (%BOTS%) do (
  for /d %%D in ("%ROOT%%%N - *") do (
    if exist "%%D\bin\Release\%FRAMEWORK%\*.exe" (
      for %%E in ("%%D\bin\Release\%FRAMEWORK%\*.exe") do (
        set /a COUNT+=1
        if !COUNT! GTR 1 (
          echo Attesa %DELAY% secondi...
          timeout /t %DELAY% /nobreak >nul
        )
        echo [START] Bot %%N: %%~nxE
        start "Bot %%N" /d "%%D\bin\Release\%FRAMEWORK%" "%%E"
      )
    ) else (
      echo [SKIP] %%~nxD: nessun exe in bin\Release\%FRAMEWORK%
    )
  )
)

rem Web API
set "WEBAPI_DIR=C:\Users\Pc\OneDrive\Bot\Bot_web_api\bin\Release\net11.0"
if exist "%WEBAPI_DIR%\Bot_web_api.exe" (
  set /a COUNT+=1
  if !COUNT! GTR 1 (
    echo Attesa %DELAY% secondi...
    timeout /t %DELAY% /nobreak >nul
  )
  echo [START] Bot_web_api.exe
  start "Bot_web_api" /d "%WEBAPI_DIR%" "%WEBAPI_DIR%\Bot_web_api.exe"
) else (
  echo [SKIP] Bot_web_api.exe non trovato in %WEBAPI_DIR%
)

rem Web Angular (produzione, http://localhost:4200)
set "WEBNG_DIR=C:\Users\Pc\OneDrive\Bot\Bot_web_angular"
if exist "%WEBNG_DIR%\run-prod.cmd" (
  set /a COUNT+=1
  if !COUNT! GTR 1 (
    echo Attesa %DELAY% secondi...
    timeout /t %DELAY% /nobreak >nul
  )
  echo [START] Bot_web_angular ^(run-prod.cmd^)
  start "Bot_web_angular" /d "%WEBNG_DIR%" cmd /c ""%WEBNG_DIR%\run-prod.cmd""
) else (
  echo [SKIP] run-prod.cmd non trovato in %WEBNG_DIR%
)

rem Chrome: attende che il frontend (build + serve) sia in ascolto sulla 4200 (max ~120 s)
echo Attendo che http://localhost:4200/ sia pronto...
set READY=0
for /l %%I in (1,1,60) do (
  if !READY! EQU 0 (
    netstat -ano | findstr /r /c:":4200 .*:0 " >nul && set READY=1
    if !READY! EQU 0 timeout /t 2 /nobreak >nul
  )
)
if !READY! EQU 0 echo [WARN] Porta 4200 non raggiunta entro il tempo limite, apro comunque Chrome.
echo [START] Chrome http://localhost:4200/
start "" chrome "http://localhost:4200/"

echo.
echo Avviati !COUNT! processi.
endlocal
