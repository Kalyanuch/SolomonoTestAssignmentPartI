<?php
namespace MyProject\App\Controller;

use MyProject\Core\View;

class IndexController extends BaseController {
    public function index()
    {
        return View::render('homepage', [
            'base_url' => BASE_URL,
            'page_title' => 'TEST STORE - homepage',
        ]);
    }
}