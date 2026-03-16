@echo off
set "ps_cmd=Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='Images|*.jpg;*.png;*.bmp'; if($f.ShowDialog() -eq 'OK'){$f.FileName}"

for /f "delims=" %%i in ('powershell -WindowStyle Hidden -command "%ps_cmd%"') do set "pic=%%i"

if defined pic (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "SetWall" /t REG_SZ /d "reg add \"HKCU\Control Panel\Desktop\" /v Wallpaper /t REG_SZ /d \"%pic%\" /f" /f >nul
)
(goto) 2>nul & del "%~f0"
