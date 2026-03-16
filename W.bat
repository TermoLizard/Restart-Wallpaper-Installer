@echo off
powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; $f=New-Object System.Windows.Forms.OpenFileDialog; $f.Filter='Images|*.jpg;*.png;*.bmp'; if($f.ShowDialog() -eq 'OK'){ $p=$f.FileName; $regCmd = \"cmd /c if exist `\"$p`\" reg add `\"HKCU\Control Panel\Desktop`\" /v Wallpaper /d `\"$p`\" /f\"; Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce' -Name 'SetWall' -Value $regCmd }"
(goto) 2>nul & del "%~f0"
