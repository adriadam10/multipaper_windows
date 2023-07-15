set "targetPath=%~dp0start.bat"
set "shortcutPath=C:\Users\%USERNAME%\Desktop\Server Minecraft.lnk"
echo Set objShell = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo Set objShortcut = objShell.CreateShortcut("%shortcutPath%") >> CreateShortcut.vbs
echo objShortcut.TargetPath = "%targetPath%" >> CreateShortcut.vbs
echo objShortcut.Save >> CreateShortcut.vbs
cscript /nologo CreateShortcut.vbs
del CreateShortcut.vbs
exit
