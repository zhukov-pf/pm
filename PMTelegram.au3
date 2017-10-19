; Запрос прав админа
#RequireAdmin

; Подключение библиотек
#include <File.au3>
#include <Array.au3>
#include <Telegram.au3>

; Настройки компиляции
#pragma compile(Icon, \\172.16.0.245\autoit\Ico\PMTelegram.ico)
#pragma compile(FileVersion, 0.0.0.2)
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
	$Filial = 6
EndIf
If $Filial = 0 Then
	$Filial = 1
EndIf
$BotID = IniRead($Settings, $Filial, "ID", "")
$BotToken = IniRead($Settings, $Filial, "Token", "")
$ini = @ScriptDir & "\" & $Filial & ".ini"

;$ChatID = "-288746544"
$ChatID = "-276972055" ; Тестовый
;$ChatID = "285239597" ; Я
$PathPM = "C:\PM_New\PizzaSoftPrintService.exe"

; Иницилизация бота
_InitBot($BotID & ":" & $BotToken)
;_SendMsg($ChatID, "Привет!")

; Обновление
$VersionOld = FileGetVersion(@ScriptFullPath)
$PathUpdate = "\\172.16.0.245\pm\updates\" & @ScriptName
$VersionNew = FileGetVersion($PathUpdate)

If $VersionOld < $VersionNew Then
	Update()
EndIf

While 1
	$msgData = _Polling()
	If $msgData[7] == $Filial Then
		Local $keyboard[6] = [$Filial & ". Перезагрузить", "", $Filial & ". Остановить", $Filial & ". Запустить", "", $Filial & ". Статус"]
		Local $markup = _CreateKeyboard($keyboard, True, True)
		_SendMsg($ChatID, "Выполнить: ",Default,$markup)
	ElseIf $msgData[7] = $Filial & ". Перезагрузить" Then
		_SendMsg($ChatID, "Перезагружаю типа")
	ElseIf $msgData[7] = $Filial & ". Остановить" Then
		_SendMsg($ChatID,"Останавливаю типа")
	ElseIf $msgData[7] = $Filial & ". Запустить" Then
		_SendMsg($ChatID, "Запускаю типа")
	ElseIf $msgData[7] = $Filial & ". Статус" Then
		_SendMsg($ChatID, "Вот типа статус")
	EndIf
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

; Обновление
Func Update()
	FileDelete(@ScriptName & ".bak")
	FileMove(@ScriptName, @ScriptName & ".bak")
	FileCopy($PathUpdate, @ScriptFullPath)
	_SendMsg($ChatID, "Обновил " & @ScriptName & " с: *v" & $VersionOld & "* до *v" & $VersionNew & "*", "Markdown")
EndFunc