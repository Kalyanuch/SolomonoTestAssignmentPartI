<?php
namespace MyProject\Core;

class View {
    public static function render($template, $data = []) {
        $file_path = DIR_TEMPLATES . str_replace('.', '/', $template) . '.tpl';

        if (file_exists($file_path)) {
            extract($data);

            ob_start();

            include($file_path);

            $output = ob_get_contents();

            ob_end_clean();

            return $output;
        }
    }
}