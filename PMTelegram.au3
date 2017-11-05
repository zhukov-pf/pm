; Дебаг в трее
Opt("TrayIconDebug",1)

; Запрос прав админа
#RequireAdmin

; Выход из скрипта
;HotKeySet("{ESC}", "Terminate")

; Выход из скрипта
Func Terminate()
    Exit 0
EndFunc

; Подключение библиотек
#include <File.au3>
#include <Array.au3>
#include <Telegram.au3>
#include <SysTray_UDF.au3>

; Настройки компиляции
#pragma compile(Icon, \\172.16.0.245\autoit\Ico\PMTelegram.ico)
#pragma compile(FileVersion, 1.0.0.1)
#pragma compile(ProductName, PMTelegram)
#pragma compile(FileDescription, Бот для управление через телеграм)
#pragma compile(LegalCopyright, Copyright © 2017 DIx)

; Переменные
Global $g_eventerror = 0
$oMyError = ObjEvent("AutoIt.Error", "_SendMsg")
$Settings = @ScriptDir & "\settings.ini"
$PathLog = "C:\PM_New\logs\"
$Filial = CheckFilial()
If $Filial = 3 Then
	$Filial = 2
EndIf
If $Filial = 0 Then
	$Filial = 2
EndIf
$BotID = IniRead($Settings, $Filial, "ID", "")
$BotToken = IniRead($Settings, $Filial, "Token", "")
$ini = @ScriptDir & "\" & $Filial & ".ini"

$PathPM = "C:\PM_New\PizzaSoftPrintService.exe"

; Иницилизация бота
_InitBot($BotID & ":" & $BotToken)

While 1
	$msgData = _Polling()
	If $msgData[5] < 0 Then
		$ChatID = $msgData[5]
		$MsgG = $msgData[7]
	Else
		$ChatID = $msgData[2]
		$MsgG = $msgData[5]
	EndIf
	If $MsgG == $Filial Then
		If ProcessExists("PizzaSoftPrintService.exe") Then
			$StopStartPM = ". Остановить"
		Else
			$StopStartPM = ". Запустить"
		EndIf
		Local $keyboard[6] = [$Filial & ". Перезагрузить", $Filial & $StopStartPM, "", $Filial & ". Статус", "", $Filial & ". Обновить"]
		Local $markup = _CreateKeyboard($keyboard, True, True)
		_SendMsg($ChatID, "Выполнить: ",Default,$markup)
	ElseIf $MsgG = $Filial & ". Перезагрузить" Then
		ProcessClose("PizzaSoftPrintService.exe")
		While ProcessExists("PizzaSoftPrintService.exe") = True
			Sleep(500)
		WEnd
		RemoveIcon()
		Run($PathPM)
		While ProcessExists("PizzaSoftPrintService.exe") = False
			Sleep(500)
		WEnd
		_SendMsg($ChatID,"Перезагрузил")
	ElseIf $MsgG = $Filial & ". Остановить" Then
		ProcessClose("PizzaSoftPrintService.exe")
		While ProcessExists("PizzaSoftPrintService.exe") = True
			Sleep(500)
		WEnd
		RemoveIcon()
		_SendMsg($ChatID,"Остановил")
	ElseIf $MsgG = $Filial & ". Запустить" Then
		Run($PathPM)
		While ProcessExists("PizzaSoftPrintService.exe") = False
			Sleep(500)
		WEnd
		_SendMsg($ChatID,"Запустил")
	ElseIf $MsgG = $Filial & ". Статус" Then
		$msg0 = "%0A*IP:*%0A" & @IPAddress1
		$msg1 = "%0A*Имя Компьютера:*%0A" & @ComputerName
		$msg2 = "%0A*Имя Пользователя:*%0A" & @UserName
		$msg3 = "%0A*Время:*%0A" & @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
		$msg4 = "%0A*Версия:*%0A v" & FileGetVersion(@ScriptFullPath)
		$msg5 = Msg5()
		$msg6 = "%0A*Свободного места на диске:*%0A" & Round(DriveSpaceFree("C:")/1024,2) & " Гб / " & Round(DriveSpaceTotal("C:")/1024,2) & " Гб - " & Round(DriveSpaceFree("C:")/DriveSpaceTotal("C:")*100, 0) & "%"
		$msg7 = Msg7_1() & Msg7_2()
		$msg8 = "%0A*Версия PM:*%0A v" & FileGetVersion($PathPM)
		_SendMsg($ChatID, $msg0 & $msg1 & $msg2 & $msg3 & $msg4 & $msg5 & $msg6 & $msg7 & $msg8, "Markdown")
	ElseIf $MsgG = $Filial & ". Обновить" Then
		$StatusUpdate = IniRead(@TempDir & "\TempPMFullUpdate.ini", "Update", "Status", "")
		If $StatusUpdate <> 1 Then
			IniWrite(@TempDir & "\TempPMFullUpdate.ini", "Update", "Status", "1")
			_SendMsg($ChatID, "*Обновляю:*", "Markdown")
			FullUpdate()
		Else
			IniWrite(@TempDir & "\TempPMFullUpdate.ini", "Update", "Status", "0")
			;_SendMsg($ChatID, "Не обновляю")
		EndIf
	EndIf
	Update()
WEnd

Func MyErrFunc()
    MsgBox(0, "Ошибка", "Обнаружена ошибка!" & @CRLF & @CRLF & _
            "Описание: " & $oMyError.description & @CRLF & _
            "Подробное описание:" & $oMyError.windescription & @CRLF & _
            "Номер строки: " & $oMyError.scriptline)
    Local $err = $oMyError.number
    If $err = 0 Then $err = -1
    $g_eventerror = $err
EndFunc

; Узнать номер филиала по IP
Func CheckFilial()
	$Filial = StringSplit(@IPAddress1, '.')
	Return $Filial[3]
EndFunc

Func Msg5()
	If ProcessExists("PizzaSoftPrintService.exe") Then
		$msg5 = "%0A*Процесс PM:*%0AЗапущен"
	Else
		$msg5 = "%0A*Процесс PM:*%0AНе запущен"
	EndIf
Return $msg5
EndFunc

Func Msg7_1()
	If @OSVersion = "WIN_7" Then
		$msg7 = "%0A*ОС:*%0AWindows 7"
	ElseIf @OSVersion = "WIN_XP" Then
		$msg7 = "%0A*ОС:*%0AWindows XP"
	ElseIf @OSVersion = "WIN_10" Then
		$msg7 = "%0A*ОС:*%0AWindows 10"
	Else
		$msg7 = "%0A*ОС:*%0A" & @OSVersion
	EndIf
	Return $msg7
EndFunc

Func Msg7_2()
	If @OSArch = "X64" Then
		$msg7 = " - x64"
	ElseIf @OSArch = "X86" Then
		$msg7 = " - x32"
	Else
		$msg7 = " - " & @OSVersion
	EndIf
	Return $msg7
EndFunc

Func RemoveIcon()
	Local $a1, $a2
	$a1 = _SysTrayIconPids()
	$a2 = _SysTrayIconProcesses()
	For $i = 0 To UBound($a1)-1
		If $a1[$i] = -1 And $a2[$i] = "" Then
			_SysTrayIconRemove($i)
			Opt('TrayIconHide', 0)
			Opt('TrayIconHide', 1)
		EndIf
	Next
EndFunc

; Обновление
Func Update()
	$VersionOld = FileGetVersion(@ScriptFullPath)
	$PathUpdate = "\\172.16.0.245\pm\updates\" & @ScriptName
	$VersionNew = FileGetVersion($PathUpdate)
	If $VersionOld < $VersionNew Then
		FileDelete(@ScriptName & ".bak")
		FileMove(@ScriptName, @ScriptName & ".bak")
		FileCopy($PathUpdate, @ScriptFullPath)
		Run(@ScriptFullPath)
		_SendMsg($ChatID, "Обновил " & @ScriptName & " с: *v" & $VersionOld & "* до *v" & $VersionNew & "*", "Markdown")
		Exit
	EndIf
EndFunc

Func FullUpdate()
$PathFullUpdate = "\\172.16.0.245\pm\updates\"
$DirFullUpdte = "C:\PF\"
FileDelete("settings.ini" & ".bak")
FileMove("settings.ini", "settings.ini" & ".bak")
FileCopy($PathFullUpdate & "settings.ini", $DirFullUpdte & "settings.ini")
_SendMsg($ChatID, $DirFullUpdte & "settings.ini")

FileDelete("PMReadLog.exe" & ".bak")
FileMove("PMReadLog.exe", "PMReadLog.exe" & ".bak")
FileCopy($PathFullUpdate & "PMReadLog.exe", $DirFullUpdte & "PMReadLog.exe")
ProcessClose("PMReadLog.exe")
Run($DirFullUpdte & "PMReadLog.exe")
_SendMsg($ChatID, $DirFullUpdte & "PMReadLog.exe")

FileDelete("PMTelegram.exe" & ".bak")
FileMove("PMTelegram.exe", "PMTelegram.exe" & ".bak")
FileCopy($PathFullUpdate & "PMTelegram.exe", $DirFullUpdte & "PMTelegram.exe")
Run($DirFullUpdte & "PMTelegram.exe")
_SendMsg($ChatID, $DirFullUpdte & "PMTelegram.exe")

RemoveIcon()
Exit
EndFunc