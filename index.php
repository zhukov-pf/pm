<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Управление ПМ</title>
	<link rel="stylesheet" type="text/css" href="../style/css/bootstrap.min.css">
</head>
<body>
	<table class="table table-bordered table-striped table-condesed">
		<thead>
			<tr align="center">
				<td># филиала</td>
				<td>Название</td>
				<td>Режим</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<form method="post" action="../actions/pm1.php">
					<input type="hidden" name="point" value="1">
					<td>1</td>
					<td>Бескудниково</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
						</select>
					</td>
					<td><input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить"></td>
				</form>
			</tr>
		</tbody>
	</table>
</body>
</html>