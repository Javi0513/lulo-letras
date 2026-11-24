@echo off
rem Abre Lulo y las Letras en Chrome a traves de http://localhost:8123/
rem Si el servidor ya esta abierto, servidor.ps1 solo abre el navegador.
start "Lulo" /min powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Minimized -File "%~dp0servidor.ps1"
