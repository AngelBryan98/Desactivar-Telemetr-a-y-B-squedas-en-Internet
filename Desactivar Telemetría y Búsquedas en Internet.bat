@echo off
:: Script para deshabilitar telemetría y búsquedas en internet en Windows 11
:: Requiere permisos de Administrador

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este programa debe ser ejecutado como Administrador.
    pause
    exit
)

echo ===================================================
echo   Deshabilitar Telemetría y Búsquedas en Internet
echo ===================================================

:: ----- Deshabilitar telemetría -----

echo Deshabilitando telemetría...

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: ----- Deshabilitar búsquedas en internet -----

echo Deshabilitando búsquedas en internet en el buscador de Windows...

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f

:: ----- Final -----

echo.
echo Cambios aplicados correctamente, se requiere reiniciar el sistema.
pause
exit