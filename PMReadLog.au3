; Запрос прав админа
#RequireAdmin

; Подключение библиотек
#include <File.au3>
#include <Array.au3>
#include <Telegram.au3>

; Настройки компиляции
#pragma compile(Icon, \\172.16.0.245\autoit\Ico\PMReadLog.ico)
#pragma compile(FileVersion, 0.0.0.31)
#pragma compile(ProductName, PMReadLog)
#pragma compile(FileDescription, Бот читающий логи)
#pragma compile(LegalCopyright, Copyright © 2017 DIx)

; Переменные
Global $g_eventerror = 0
$oMyError = ObjEvent("AutoIt.Error", "_SendMsg")
$Settings = @ScriptDir & "\settings.ini"
$PathLog = "C:\PM_New\logs\"
$Filial = CheckFilial()
If $Filial = 3 Then
	$Filial = 6
EndIf
If $Filial = 0 Then
	$Filial = 6
EndIf
$BotID = IniRead($Settings, $Filial, "ID", "")
$BotToken = IniRead($Settings, $Filial, "Token", "")
$ini = @ScriptDir & "\" & $Filial & ".ini"
$VoidCheck = "аннулирую чек"
$NoPapper = "нет бумаги"
$NoConnectPrinter = "нет связи с принтером"
$NoConnectKKM = "(Нет связи)"

$ChatID = "-288746544"
;$ChatID = "-276972055" ; Тестовый
$PathPM = "C:\PM_New\PizzaSoftPrintService.exe"
$NumberLine = IniRead($ini, "Line", @MON & @MDAY, "")

; Иницилизация бота
_InitBot($BotID, $BotToken)

; Обновление
$VersionOld = FileGetVersion(@ScriptFullPath)
$PathUpdate = "\\172.16.0.245\pm\updates\" & @ScriptName
$VersionNew = FileGetVersion($PathUpdate)

If $VersionOld < $VersionNew Then
	Update()
EndIf

; Приветсвие при старте
$msg0 = "*Лог:*%0A" & @YEAR & @MON & @MDAY & ".log"
$msg1 = "%0A*IP*:%0A" & @IPAddress1
$msg2 = "%0A*Имя Компьютера:*%0A" & @ComputerName
$msg3 = "%0A*Имя Пользователя:*%0A" & @UserName
$msg4 = "%0A*Время:*%0A" & @MDAY & "/" & @MON & "/" & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC
$msg5 = "%0A*Версия:*%0A v" & FileGetVersion(@ScriptFullPath)
_SendMsg($ChatID, $msg0 & $msg1 & $msg2 & $msg3 & $msg4 & $msg5, "Markdown")

While 1
	IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
	$Day = IniReadSection($ini, "Line")
	If Ubound($Day) = 3 Then
		FileDelete($ini)
		$NumberLine = 0
	EndIf
	For $NumberLine = $NumberLine To _FileCountLines(FileLog())
		$VoidCheckResult = StringInStr(FileReadLine(FileLog(), $NumberLine), $VoidCheck)
		IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
		If $VoidCheckResult > 0 Then
			$VoidCheckLine = IniRead($ini, "VoidCheck", @MON & @MDAY, "-1")
			IniWrite($ini, "VoidCheck", @MON & @MDAY, $NumberLine)
			If $NumberLine - $VoidCheckLine > 5 Then
				_SendMsg($ChatID, "*[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine) & "*", "Markdown")
			EndIf
		EndIf

		$NoPapperResult = StringInStr(FileReadLine(FileLog(), $NumberLine), $NoPapper)
		IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
		If $NoPapperResult > 0 Then
			$NoPapperLine = IniRead($ini, "NoPapper", @MON & @MDAY, "-1")
			IniWrite($ini, "NoPapper", @MON & @MDAY, $NumberLine)
			If $NumberLine - $NoPapperLine > 200 Then
				_SendMsg($ChatID, "[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine))
			EndIf
		EndIf

		$NoConnectPrinterResult = StringInStr(FileReadLine(FileLog(), $NumberLine), $NoConnectPrinter)
		IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
		If $NoConnectPrinterResult > 0 Then
			$NoConnectPrinterLine = IniRead($ini, "NoConnectPrinter", @MON & @MDAY, "-1")
			IniWrite($ini, "NoConnectPrinter", @MON & @MDAY, $NumberLine)
			If $NumberLine - $NoConnectPrinterLine > 200 Then
				_SendMsg($ChatID, "[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine))
			EndIf
		EndIf

		$NoConnectKKMResult = StringInStr(FileReadLine(FileLog(), $NumberLine), $NoConnectKKM)
		IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
		If $NoConnectKKMResult > 0 Then
			$NoConnectKKMLine = IniRead($ini, "NoConnectKKM", @MON & @MDAY, "-1")
			IniWrite($ini, "NoConnectKKM", @MON & @MDAY, $NumberLine)
			If $NumberLine - $NoConnectKKMLine > 3 Then
				_SendMsg($ChatID, "*[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine) & "*", "Markdown")
			EndIf
		EndIf
	Next
	sleep(1000)
WEnd

Func FileLog()
	$FileLog = $PathLog & @YEAR & @MON & @MDAY & ".log"
	Return $FileLog
EndFunc

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

; Обновление
Func Update()
	FileDelete(@ScriptName & ".bak")
	FileMove(@ScriptName, @ScriptName & ".bak")
	FileCopy($PathUpdate, @ScriptFullPath)
	_SendMsg($ChatID, "Обновил " & @ScriptName & " с: *v" & $VersionOld & "* до *v" & $VersionNew & "*", "Markdown")
EndFunc