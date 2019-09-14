<?php

// User definded configuration
$directoryName = "CICD"; //name of main folder
$directory_seprator = '/';
$protocol = 'http://';
//---------------------------------------
// Don't change here

$local_host = $_SERVER['HTTP_HOST'] . $directory_seprator;
//$host = $_SERVER['SERVER_ADDR'] . ":" . $_SERVER['SERVER_PORT'] . $directory_seprator;
$host = $_SERVER['SERVER_ADDR'] . $directory_seprator;
$webroot = $protocol . $host . $directoryName . $directory_seprator;
$localroot = $protocol . $local_host . $directoryName . $directory_seprator;
//echo $webroot;die;
$api_dir = $webroot . 'api' . $directory_seprator;


return [
    'webroot' => $webroot,
    'api_dir' => $api_dir,
    'localroot' => $localroot
];
