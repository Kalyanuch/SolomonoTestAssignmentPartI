<?php
namespace MyProject\Core;
class Request {
    public $get = [];
    public $request = [];
    public $server = [];
    public $uri = [];
    protected $is_ajax = false;

    public function __construct() {
        $this->get = $this->clean($_GET);
        $this->request = $this->clean($_REQUEST);
        $this->server = $this->clean($_SERVER);

        if (!empty($this->server['REQUEST_URI'])) {
            $ar_uri = explode('?', trim($this->server['REQUEST_URI'], '/'));

            if (count($ar_uri) > 0) {
                $this->uri = explode('/', $ar_uri[0]);
            }
        }

        $request_headers = getallheaders();

        if (!empty($request_headers['X-Requested-With']) && $request_headers['X-Requested-With'] == 'XMLHttpRequest') {
            $this->is_ajax = true;
        }
    }

    public function clean($data) {
        if (is_array($data)) {
            foreach ($data as $key => $value) {
                unset($data[$key]);

                $data[$this->clean($key)] = $this->clean($value);
            }
        } else {
            $data = htmlspecialchars($data, ENT_COMPAT, 'UTF-8');
        }

        return $data;
    }

    public function isAjax()
    {
        return $this->is_ajax;
    }
}