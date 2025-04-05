<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$lines = file('a4_toread.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

foreach ($lines as $line) {
	echo $line . "<br>";
}
?>
