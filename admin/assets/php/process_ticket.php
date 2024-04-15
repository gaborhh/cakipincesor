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
    $event_id = $_POST['event'];
    $quantity = $_POST['quantity'];
    $revenue = $_POST['revenue'];
    $date = $_POST['date'];
    $sql = "INSERT INTO tickets (event_id, quantity, revenue, date)
    VALUES ('$event_id', '$quantity', '$revenue', '$date')";
    if ($conn->query($sql) === TRUE) {
        echo "Az adatok sikeresen rögzítve.";
    } else {
        echo "Hiba történt az adatok rögzítése közben: " . $conn->error;
    }
}
$conn->close();
?>