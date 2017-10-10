<?php
# Режим дебага
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
?>
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
				<form method="post" action="">
					<input type="hidden" name="point" value="1">
					<td>1</td>
					<td>Бескудниково</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="2">
					<td>2</td>
					<td>Митино</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="6">
					<td>6</td>
					<td>Свиблово</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="7">
					<td>7</td>
					<td>Строгино</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="8">
					<td>8</td>
					<td>Кантемировская</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="9">
					<td>9</td>
					<td>Домодедовская</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="10">
					<td>10</td>
					<td>Дубровка</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="11">
					<td>11</td>
					<td>Пионерская</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="13">
					<td>13</td>
					<td>Бибирево</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="15">
					<td>15</td>
					<td>Перово</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="16">
					<td>16</td>
					<td>Чертаново</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="17">
					<td>17</td>
					<td>Бутово</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="18">
					<td>18</td>
					<td>Академическая</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="19">
					<td>19</td>
					<td>Орджоникидзе</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="22">
					<td>22</td>
					<td>Ясенево</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
			<tr align="center">
				<form method="post" action="">
					<input type="hidden" name="point" value="24">
					<td>24</td>
					<td>Водный Стадион</td>
					<td>
						<select name="mode" class="form-control">
							<option disabled selected>Выберите режим</option>
							<option value="1">Перезагрузить ПМ</option>
							<option value="2">Просмотреть лог</option>
							<option value="3">Снять Х-отчет</option>
						</select>
					</td>
					<td>
						<input type="submit" name="send" class="btn btn-small btn-success" value="Выполнить">
						<input type="reset" name="reset" class="btn btn-small btn-inverse" value="Сброс">
					</td>
				</form>
			</tr>
		</tbody>
	</table>
<?php

if(isset($_POST['send'])) {

	$file = fopen($_SERVER['DOCUMENT_ROOT'].'/pm'.$_POST['point'].'.ini', 'w');

	fwrite($file, "[pm1]\n point = ".$_POST['point']."\n mode = ".$_POST['mode']."\n logdate = ".date('Ymd').".log\n ");

	fclose($file);

	sleep(3);

	unlink($_SERVER['DOCUMENT_ROOT'].'/pm'.$_POST['point'].'.ini');

}


?>
<script type="text/javascript" src="../style/js/bootstrap.min.js"></script>
</body>
</html>
