<?php
namespace  MyProject\App\Controller;

use MyProject\App\Model\Product;
use MyProject\Core\Response;

class ProductController extends BaseController {
    public function index()
    {
        $product = [];

        if (!empty($this->request->uri[0]) && preg_match('/[0-9]+/', $this->request->uri[0])) {
            $product = Product::getItemById($this->request->uri[0]);

            $product['formatted_price'] = number_format($product['price'] / 100, 2, '.', '');
        }

        Response::getInstance()->addHeader('Content-Type: application/json');

        return json_encode([
            'product' => $product,
        ]);
    }
}