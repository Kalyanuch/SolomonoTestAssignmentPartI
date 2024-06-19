<?php

require_once 'config/main.php';

spl_autoload_register(function ($class) {
    $baseDir = __DIR__ . DIRECTORY_SEPARATOR;

    $prefix = APP_NAMESPACE;
    $prefixLength = strlen($prefix);

    if (strncmp($prefix, $class, $prefixLength) !== 0) {
        return;
    }

    $relativeClass = substr($class, $prefixLength);
    $file = $baseDir . str_replace('\\', '/', $relativeClass) . '.php';

    if (file_exists($file)) {
        require $file;
    }
});

use MyProject\Core\Request;
use MyProject\Core\Response;
use MyProject\Core\Router;

$request = new Request();
$output = Router::route($request);

Response::getInstance()
    ->setOutput($output)
    ->send();
