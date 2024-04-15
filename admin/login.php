<?php
session_start();
require_once 'assets/php/conn.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_POST['username']) && !empty($_POST['password'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $query = "SELECT * FROM admin WHERE username='$username'";
        $result = $conn->query($query);
        if ($result->num_rows == 1) {
            $row = $result->fetch_assoc();
            if (password_verify($password, $row['password'])) {
                $_SESSION['username'] = $username;
                header("Location: home/index.php");
                exit;
            } else {
                echo "Hibás felhasználónév vagy jelszó!";
            }
        } else {
            echo "Hibás felhasználónév vagy jelszó!";
        }
    } else {
        echo "Kérem, töltse ki mindkét mezőt!";
    }
} else {
    echo "Hiba";
}
?>