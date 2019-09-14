<?php

class Database {

    private $host = "192.168.60.13:3306";
    private $db_name = "kdms";
    private $username = "root";
    private $password = "password";
    public $conn;

    // get the database connection
    public function getConnection() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
            
        } catch (PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }
        return $this->conn;
    }
}
?>
