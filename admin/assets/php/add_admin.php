<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $email = $_POST["email"];
    $sql = "INSERT INTO admin (username, password, email) VALUES ('$username', '$password', '$email')";

    if ($conn->query($sql) === TRUE) {
        echo "Az új admin sikeresen hozzáadva.";
    } else {
        echo "Hiba: " . $sql . "<br>" . $conn->error;
    }
}
$conn->close();
?>
