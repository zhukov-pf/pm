$ini = @ScriptDir & "\settings.ini"
FileDelete($ini)

IniWrite($ini, "Main", "Web", "\\172.16.0.245\pm\")
IniWrite($ini, "Main", "Update", "\\172.16.0.245\pm\updates\")
IniWrite($ini, "Main", "Settings", "\\172.16.0.245\autoit\")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Настройки ботов")
FileWrite($ini, "# Бескудниково")
IniWrite($ini, "1", "ID", "")
IniWrite($ini, "1", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Митино")
IniWrite($ini, "2", "ID", "")
IniWrite($ini, "2", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Свиблово")
IniWrite($ini, "6", "ID", "464360357")
IniWrite($ini, "6", "Token", "AAFw0W1ARAlqOOsUCOWRDRDSLQKncXkH8U8")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Строгино")
IniWrite($ini, "7", "ID", "")
IniWrite($ini, "7", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Кантемировская")
IniWrite($ini, "8", "ID", "")
IniWrite($ini, "8", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Домодедовская")
IniWrite($ini, "9", "ID", "")
IniWrite($ini, "9", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Дубровка")
IniWrite($ini, "10", "ID", "345909760")
IniWrite($ini, "10", "Token", "AAFCPKuYqz1KseTur5y_iAEwM-830sLbEn4")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Пионерская")
IniWrite($ini, "11", "ID", "")
IniWrite($ini, "11", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Бибирево")
IniWrite($ini, "13", "ID", "")
IniWrite($ini, "13", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Перово")
IniWrite($ini, "15", "ID", "")
IniWrite($ini, "15", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Чертановская")
IniWrite($ini, "16", "ID", "")
IniWrite($ini, "16", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Бутово")
IniWrite($ini, "17", "ID", "453482730")
IniWrite($ini, "17", "Token", "AAHABLXfj4yuauUfhxdN5zXGilOjJ-MrQ08")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Академическая")
IniWrite($ini, "18", "ID", "")
IniWrite($ini, "18", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Орджоникидзе")
IniWrite($ini, "19", "ID", "")
IniWrite($ini, "19", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Ясенево")
IniWrite($ini, "22", "ID", "")
IniWrite($ini, "22", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Водный Стадион")
IniWrite($ini, "24", "ID", "")
IniWrite($ini, "24", "Token", "")
