<?php
namespace MyProject\App\Controller;

use MyProject\Core\Request;

class BaseController {
    protected $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
    }
}