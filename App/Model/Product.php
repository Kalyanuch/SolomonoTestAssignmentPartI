<?php
namespace MyProject\App\Model;

use MyProject\Core\Database;

class Product {
    public static function getItems($sort = '', $order = '')
    {
        if (empty($sort)) {
            $sort = 'product_id';
        }

        if (empty($order)) {
            $order = 'ASC';
        }

        $query = Database::getInstance()->getConnection()->prepare("SELECT * FROM `product` ORDER BY `" . $sort . "` " . $order);
        $query->execute();

        return $query->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function getItemsByCategory($category_id, $sort = '', $order = '')
    {
        if (empty($sort)) {
            $sort = 'product_id';
        }

        if (empty($order)) {
            $order = 'ASC';
        }

        $query = Database::getInstance()->getConnection()->prepare("SELECT * FROM `product` WHERE `category_id` = :category ORDER BY `" . $sort . "` " . $order);
        $query->bindValue(':category', $category_id, \PDO::PARAM_INT);
        $query->execute();

        return $query->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function getItemById($product_id)
    {
        $query = Database::getInstance()->getConnection()->prepare("SELECT * FROM `product` WHERE `product_id` = :product");
        $query->bindValue(':product', $product_id, \PDO::PARAM_INT);
        $query->execute();

        return $query->fetch(\PDO::FETCH_ASSOC);
    }

    public static function getTotalItemsByCategory($category_id)
    {
        $query = Database::getInstance()->getConnection()->prepare("SELECT COUNT(*) AS `total` FROM `product` WHERE `category_id` = :category");
        $query->bindValue(':category', $category_id, \PDO::PARAM_INT);
        $query->execute();

        return $query->fetch(\PDO::FETCH_ASSOC);
    }
}