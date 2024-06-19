<?php
 namespace MyProject\Core;

 class Response {
     private static $instance;
     private $output;
     private $headers = [];

     private function __construct()
     {

     }

     /**
      * @return self
      */
     public static function getInstance() {
         if (self::$instance == null) {
             $class = __CLASS__;
             self::$instance = new $class();
         }

         return self::$instance;
     }

     public function addHeader($header)
     {
         $this->headers[] = $header;
     }

     public function setOutput(string $output)
     {
         $this->output .= $output;

         return $this;
     }

     public function send()
     {
         if ($this->output !== '') {
             if ($this->headers) {
                 foreach ($this->headers as $header) {
                     header($header);
                 }
             }

             echo $this->output;
         }
     }
 }