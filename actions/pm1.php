<?php

ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);


if (is_file($_SERVER['DOCUMENT_ROOT'].'/out/pm'.$_POST['point'].'.ini')) {
	
	unlink($_SERVER['DOCUMENT_ROOT'].'/out/pm'.$_POST['point'].'.ini');
	//exec("sudo rm /var/www/pm/pm".$_POST['point'].".ini");

}

$file = fopen($_SERVER['DOCUMENT_ROOT'].'/out/pm'.$_POST['point'].'.ini', 'w');

fwrite($file, "[pm1]\n point = ".$_POST['point']."\n mode = ".$_POST['mode']."");

fclose($file);

header('Location: /');