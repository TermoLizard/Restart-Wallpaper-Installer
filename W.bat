@echo off
set "ps=Add-Type -AssemblyName System.Windows.Forms;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.Filter='Images|*.jpg;*.png;*.bmp';if($f.ShowDialog()-eq 'OK'){$f.FileName}"
for /f "delims=" %%i in ('powershell -noprofile -WindowStyle Hidden -command "%ps%"') do set "pic=%%i"

if defined pic (
    set "cmd=cmd /c if exist \"\"%pic%\"\" (reg add \"HKCU\Control Panel\Desktop\" /v Wallpaper /d \"\"%pic%\"\" /f)"
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "SetWall" /t REG_SZ /d "%cmd%" /f >nul
)
(goto) 2>nul & del "%~f0"
