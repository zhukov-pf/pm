; Запрос прав админа
#RequireAdmin
#NoTrayIcon

; Настройки компиляции
#pragma compile(Icon, \\172.16.0.245\autoit\Ico\Install_PMControl.ico)

FileCopy("\\172.16.0.245\pm\updates\", "C:\PF\")
;FileCreateShortcut("C:\PF\PMReadLog.exe", @DesktopDir & "\PMReadLog.lnk", "PMReadLog")
$PathPMReadLog = "C:\PF\PMReadLog.exe"
$PMReadLog = "PMReadLog.exe"
$PathPMTelegram = "C:\PF\PMTelegram.exe"
$PMTelegram = "PMTelegram.exe"
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', $PMReadLog, "REG_SZ", $PathPMReadLog)
RegWrite('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', $PMTelegram, "REG_SZ", $PathPMTelegram)
;MsgBox(4096, "", RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' & $PMTelegram, "REG_SZ"))
;$sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $PMReadLog)
;$sPath2 = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $PMTelegram)
;MsgBox(0, 'Сообщение', 'Путь к программной папке: ' & $sPath & @LF & 'Тип данных: ' & @extended)
;MsgBox(0, 'Сообщение', 'Путь к программной папке: ' & $sPath2 & @LF & 'Тип данных: ' & @extended)
Run($PathPMReadLog)
Run($PathPMTelegram)