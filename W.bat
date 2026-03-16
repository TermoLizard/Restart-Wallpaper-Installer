@echo off
powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='Images|*.jpg;*.png;*.jpeg;*.bmp'; if($f.ShowDialog() -eq 'OK'){ $p=$f.FileName; $cmd = \"cmd /c if exist '$p' (reg add 'HKCU\Control Panel\Desktop' /v Wallpaper /t REG_SZ /d '$p' /f)\"; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce' /v 'SetWall' /t REG_SZ /d $cmd /f }"

(goto) 2>nul & del "%~f0"
