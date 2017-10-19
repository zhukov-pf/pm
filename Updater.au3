;MsgBox(4096, "", @ScriptFullPath)

; Для компиляции
#pragma compile(FileVersion, 0.0.1.5)
#pragma compile(ProductVersion, 0.1)
#pragma compile(ProductName, ITPiPbot)
#pragma compile(FileDescription, Бот)
#pragma compile(LegalCopyright, Copyright © 2017 Dx)

$Version1 = FileGetVersion(@ScriptFullPath)
$up = "\\172.16.0.245\pm\updates\" & @ScriptName
$Version2 = FileGetVersion($up)
;MsgBox(4096, "ScriptFullPath", @ScriptFullPath)
;MsgBox(4096, "Version1", $Version1)
;MsgBox(4096, "up", $up)
;MsgBox(4096, "Version2", $Version2)

If $Version1 > $Version2 Then
	MsgBox(4096, "Version", "Версия " & $Version1 & " больше " & $Version2)
	Update()
ElseIf $Version1 < $Version2 Then
	MsgBox(4096, "Version", "Версия " & $Version1 & " меньше " & $Version2)
	Update()
ElseIf $Version1 = $Version2 Then
	MsgBox(4096, "Version", "Версии " & $Version1 & " равны " & $Version2)
Else
	MsgBox(4096, "Version", "Я не понимаю, " & $Version1 & ", " & $Version2)
EndIf

Func Update()
;	MsgBox(4096, "Version", @ScriptName & ".bak")
	FileDelete(@ScriptName & ".bak")
	FileMove(@ScriptName, @ScriptName & ".bak")
	FileCopy($up, @ScriptFullPath)
	MsgBox(4096, "Version", "Копировал!")
EndFunc