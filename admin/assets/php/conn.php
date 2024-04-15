<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$database = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Sikertelen kapcsolódás az adatbázishoz: " . $conn->connect_error);
}
?>