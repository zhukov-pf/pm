$ini = @ScriptDir & "\settings.ini"
FileDelete($ini)

IniWrite($ini, "Main", "Web", "\\172.16.0.245\")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Настройки ботов")
FileWrite($ini, "# Бескудниково")
IniWrite($ini, "01", "ID", "")
IniWrite($ini, "01", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Митино")
IniWrite($ini, "02", "ID", "")
IniWrite($ini, "02", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Свиблово")
IniWrite($ini, "06", "ID", "464360357")
IniWrite($ini, "06", "Token", "AAFw0W1ARAlqOOsUCOWRDRDSLQKncXkH8U8")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Строгино")
IniWrite($ini, "07", "ID", "")
IniWrite($ini, "07", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Кантемировская")
IniWrite($ini, "08", "ID", "")
IniWrite($ini, "08", "Token", "")
FileWrite($ini, @CRLF)

FileWrite($ini, "# Домодедовская")
IniWrite($ini, "09", "ID", "")
IniWrite($ini, "09", "Token", "")
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
