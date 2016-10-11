<?php
require '../vendor/autoload.php';
$client = new \Predis\Client(getenv('REDIS_URL'));
echo $client->get('project_name');
