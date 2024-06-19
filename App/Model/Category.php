<?php
namespace MyProject\App\Model;

use MyProject\Core\Database;

class Category {
    public static function getAll()
    {
        $query = Database::getInstance()->getConnection()->prepare("SELECT * FROM `category` ORDER BY `sort_order` ASC");
        $query->execute();

        return $query->fetchAll(\PDO::FETCH_ASSOC);
    }
}