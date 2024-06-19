<?php
namespace MyProject\App\Controller;

use MyProject\App\Model\Category;
use MyProject\App\Model\Product;
use MyProject\Core\Response;
use MyProject\Core\View;

class CategoryController extends BaseController {
    public function index()
    {
        $sort = '';
        $order = '';
        $sort_data = [];
        $active_category = 0;

        $categories = Category::getAll();

        foreach ($categories as $key => $category) {
            $categories[$key]['total'] = Product::getTotalItemsByCategory($category['category_id'])['total'];
        }

        if (!empty($this->request->get['sort'])) {
            $sort_data = explode('|', $this->request->get['sort']);

            if (in_array($sort_data[0], ['price', 'name', 'date'])) {
                $sort = $sort_data[0];
            }

            if (in_array($sort_data[1], ['asc', 'desc'])) {
                $order = $sort_data[1];
            }
        }

        if (!empty($this->request->uri[0]) && preg_match('/[0-9]+/', $this->request->uri[0])) {
            $products = Product::getItemsByCategory($this->request->uri[0], $sort, $order);

            $active_category = $this->request->uri[0];
        } else {
            $products = Product::getItems($sort, $order);
        }

        if ($this->request->isAjax()) {
            Response::getInstance()->addHeader('Content-Type: application/json');

            return json_encode([
                'html' => View::render('product_list', [
                    'base_url' => BASE_URL,
                    'products' => $products,
                ]),
            ]);
        } else {
            return View::render('category', [
                'base_url' => BASE_URL,
                'page_title' => 'TEST STORE - Choose your product',
                'categories' => $categories,
                'active_category' =>$active_category,
                'products' => $products,
                'sort_list' => [
                    [
                        'title' => 'Default',
                        'value' => 'default',
                        'active' => empty($sort_data[0]) || $sort_data[0] == 'default' ? true : false,
                    ],
                    [
                        'title' => 'By price',
                        'value' => 'price|asc',
                        'active' => !empty($sort_data[0]) && $sort_data[0] == 'price' ? true : false,
                    ],
                    [
                        'title' => 'By name',
                        'value' => 'name|asc',
                        'active' => !empty($sort_data[0]) && $sort_data[0] == 'name' ? true : false,
                    ],
                    [
                        'title' => 'By date',
                        'value' => 'date_added|desc',
                        'active' => !empty($sort_data[0]) && $sort_data[0] == 'date_added' ? true : false,
                    ],
                ],
            ]);
        }
    }
}