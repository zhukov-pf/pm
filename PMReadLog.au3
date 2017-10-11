; Дебаг в трее, работает только в формате au3
Opt("TrayIconDebug",1)

; Выход из скрипта
HotKeySet("{F8}", "Terminate")

; Выход из скрипта
Func Terminate()
	_SendMsg($ChatID, "*[!] Меня закрыли! [!]*", "Markdown")
    Exit 0
EndFunc

; Подключение библиотек
#include <File.au3>
#include <Array.au3>
#include <Telegram UDF.au3>

; Настройки компиляции
#pragma compile(Icon, C:\Scripts\pm\Ico\PMReadLog.ico)

; Переменные
Global $g_eventerror = 0
$Settings = @ScriptDir & "\settings.ini"
$oMyError = ObjEvent("AutoIt.Error", "_SendMsg")
$PathLog = "C:\PM_New\logs\"
$ini = @ScriptDir & "\settings06.ini"
$VoidCheck = "аннулирую чек"
$NoPapper = "нет бумаги"
$NoConnectPrinter = "нет связи с принтером"
$BotID = "345909760"
$BotToken = "AAFCPKuYqz1KseTur5y_iAEwM-830sLbEn4"
$ChatID = "-288746544"
;$ChatID = "-276972055" ; Тестовый
$PathPM = "C:\PM_New\PizzaSoftPrintService.exe"
$NumberLine = IniRead($ini, "Line", @MON & @MDAY, "") 

; Иницилизация бота
_InitBot($BotID, $BotToken)

; Приветсвие при старте
_SendMsg($ChatID, "Утро доброе!")
_SendMsg($ChatID, "*" & FileLog() & "* - " & _FileCountLines(FileLog()), "Markdown")

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
			If $NumberLine - $NoPapperLine > 5 Then
				_SendMsg($ChatID, "[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine))
			EndIf
		EndIf
	
		$NoConnectPrinterResult = StringInStr(FileReadLine(FileLog(), $NumberLine), $NoConnectPrinter)
		IniWrite($ini, "Line", @MON & @MDAY, $NumberLine)
		If $NoConnectPrinterResult > 0 Then
			$NoConnectPrinterLine = IniRead($ini, "NoConnectPrinter", @MON & @MDAY, "-1")
			IniWrite($ini, "NoConnectPrinter", @MON & @MDAY, $NumberLine)
			If $NumberLine - $NoConnectPrinterLine > 5 Then
				_SendMsg($ChatID, "[" & $NumberLine & "]" & " - " & FileReadLine(FileLog(), $NumberLine))
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