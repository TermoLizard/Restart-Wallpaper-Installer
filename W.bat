@echo off
set "ps_cmd=Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='Images|*.jpg;*.png;*.bmp'; if($f.ShowDialog() -eq 'OK'){$f.FileName}"

for /f "delims=" %%i in ('powershell -command "%ps_cmd%"') do set "pic=%%i"

if defined pic (
    reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%pic%" /f
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
    echo Wallpaper set to: %pic%
) else (
    echo No file selected.
)
pause
del "%~f0"
