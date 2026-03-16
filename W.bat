@echo off
powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='Images|*.jpg;*.png;*.bmp'; if($f.ShowDialog() -eq 'OK'){ $p=$f.FileName; reg add 'HKCU\Control Panel\Desktop' /v Wallpaper /t REG_SZ /d \"$p\" /f; RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters }"
(goto) 2>nul & del "%~f0"
