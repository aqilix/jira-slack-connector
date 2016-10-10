<?php
require '../vendor/autoload.php';
$client = new \Predis\Client([
    'scheme' => 'tcp',
    'host'   => 'redis',
    'port'   => 6379,
]);
echo $client->get('project_name');
