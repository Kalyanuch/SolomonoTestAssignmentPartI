<?php
namespace MyProject\Core;
class Router {
    public static function route($request) {
        $result = '';
        $controller_instance = null;

        if (count($request->uri) > 0 && !empty($request->uri[0])) {
            $controller_name = '\\' . APP_NAMESPACE . 'App\\Controller\\' . ucfirst($request->uri[0]) . 'Controller';
        } else {
            $controller_name = '\\' . APP_NAMESPACE . 'App\\Controller\\IndexController';
        }

        try {
            $controller_instance = new $controller_name($request);
        } catch (\Error $e) {
            echo $e->getMessage();
        }

        if ($controller_instance) {
            array_shift($request->uri);

            $action = $request->uri[0];

            if (method_exists($controller_instance, $action)) {
                array_shift($request->uri);

                $result = $controller_instance->$action();
            } else {
                $result = $controller_instance->index();
            }
        }

        return $result;
    }
}