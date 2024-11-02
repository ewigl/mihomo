Dim objShell
Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "powershell.exe", "-Command ""Get-Process -Name mihomo-windows-amd64 | Stop-Process""", "", "runas", 1
Set objShell = Nothing
