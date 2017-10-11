; Дебаг в трее
Opt("TrayIconDebug",1)

; Выход из скрипта
HotKeySet("{F8}", "Terminate")

; Выход из скрипта
Func Terminate()
	_SendMsg($ChatID, "*[!T] Меня закрыли! [T!]*", "Markdown")
    Exit 0
EndFunc

#include <File.au3>
#include <Array.au3>
#include <Telegram UDF.au3>

#pragma compile(Icon, C:\Users\Карнов Дмитрий\Desktop\ico\Светлые иконки\TokenW-ICO\IM.ico)

Global $g_eventerror = 0
$oMyError = ObjEvent("AutoIt.Error", "_SendMsg")
$BotID = "345909760"
$BotToken = "AAFCPKuYqz1KseTur5y_iAEwM-830sLbEn4"
$ChatID = "-288746544"
;$ChatID = "-276972055" ; Тестовый
$PathPM = "C:\PM_New\PizzaSoftPrintService.exe"

; Иницилизация бота
_InitBot($BotID, $BotToken)

While 1
$msgData = _Polling()

If $msgData[3] = "/10" Then
	_SendMsg($ChatID, "Перезагрузить PM /10r")
	_SendMsg($ChatID, "Остановить PM /10e")
	_SendMsg($ChatID, "Запустить PM /10s")
ElseIf $msgData[3] = "/10r@DubrovkaPM_Bot" Then
	_SendMsg($ChatID, "Перезагружаю:")
	StopPM()
	StartPM()
ElseIf $msgData[3] = "/10e@DubrovkaPM_Bot" Then
	StopPM()
ElseIf $msgData[3] = "/10s@DubrovkaPM_Bot" Then
	StartPM()
EndIf
sleep(1000)
WEnd

Func StopPM()
If ProcessExists("PizzaSoftPrintService.exe") > 0 Then
	_SendMsg($ChatID, "Останавливаю...")
	ProcessClose("PizzaSoftPrintService.exe")
	sleep(500)
	If ProcessExists("PizzaSoftPrintService.exe") = 0 Then
		_SendMsg($ChatID, "...Остановил")
	EndIf
Else
	_SendMsg($ChatID, "*[!] PM не запущен [!]*", "Markdown")
EndIf
EndFunc

Func StartPM()
If ProcessExists("PizzaSoftPrintService.exe") = 0 Then
	_SendMsg($ChatID, "Запускаю...")
	Run($PathPM)
	If ProcessExists("PizzaSoftPrintService.exe") > 0 Then
		_SendMsg($ChatID, "...Запустил")
	Else
		_SendMsg($ChatID, "*[!] ...Не смог запустить! [!]*", "Markdown")
	EndIf
Else
	_SendMsg($ChatID, "PM уже запущен", "Markdown")
EndIf
EndFunc

Func RestartPM()
If ProcessExists("PizzaSoftPrintService.exe") > 0 Then
	ProcessClose("PizzaSoftPrintService.exe")
	_SendMsg($ChatID, "Запускаю...")
	Run($PathPM)
	If ProcessExists("PizzaSoftPrintService.exe") > 0 Then
		_SendMsg($ChatID, "...Запустил")
	EndIf
Else
	_SendMsg($ChatID, "*[!] PM не запущен [!]*", "Markdown")
	_SendMsg($ChatID, "Запускаю...")
	Run($PathPM)
	If ProcessExists("PizzaSoftPrintService.exe") > 0 Then
		_SendMsg($ChatID, "...Запустил")
	Else
		_SendMsg($ChatID, "*[!] ...Не смог запустить! [!]*", "Markdown")
	EndIf
EndIf
EndFunc

Func MyErrFunc()
    MsgBox(0, "Ошибка", "Обнаружена ошибка!" & @CRLF & @CRLF & _
            "Описание: " & $oMyError.description & @CRLF & _
            "Подробное описание:" & $oMyError.windescription & @CRLF & _
            "Номер строки: " & $oMyError.scriptline)
    Local $err = $oMyError.number
    If $err = 0 Then $err = -1
    $g_eventerror = $err ; to check for after this function returns
EndFunc