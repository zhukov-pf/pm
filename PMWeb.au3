; Дебаг в трее, работает только в формате au3
Opt("TrayIconDebug",1)

; Выход из скрипта
HotKeySet("{F8}", "Terminate")

; Выход из скрипта
Func Terminate()
    Exit 0
EndFunc

; Подключение библиотек
#include <File.au3>
#include <Array.au3>

; Переменные
$Settings = @ScriptDir & "\settings.ini"
$Filial = CheckFilial()

If $Filial = 3 Then
	$Filial = 6
EndIf
If $Filial = 0 Then
	$Filial = 6
EndIf

$ini = "\\172.16.0.245\pm\pm" & $Filial & ".ini"

While 1
$mode = IniRead($ini, "pm1", "mode", "")
If $mode = 1 Then
	ReloadPM()
ElseIf $mode = 2 Then
	ReadLog()
ElseIf $mode = 3 Then
	X()
EndIf
WEnd

Func ReloadPM()
	MsgBox(4096, "ReloadPM", "Типа перезагрузил")
	FileDelete($ini)
EndFunc

Func ReadLog()
	MsgBox(4096, "ReadLog", "Типа прочитал лог")
	FileDelete($ini)
EndFunc

Func X()
	MsgBox(4096, "X", "Типа снял х-отчет")
	FileDelete($ini)
EndFunc

Func CheckFilial()
$Filial = StringSplit(@IPAddress1, '.')
Return $Filial[3]
EndFunc