<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
    exit;
}
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Sikertelen adatbázis kapcsolat: " . $conn->connect_error);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_POST['event_name']) && !empty($_POST['event_date']) && !empty($_POST['event_description']) && !empty($_FILES["event_image"]["name"])) {
        $event_name = $_POST['event_name'];
        $event_date = $_POST['event_date'];
        $event_description = $_POST['event_description'];
        $image_name = $_FILES["event_image"]["name"];
        $image_path = "uploads/" . basename($_FILES["event_image"]["name"]);
        $target_dir = "../../uploads/";
        $target_file = $target_dir . basename($_FILES["event_image"]["name"]);
        move_uploaded_file($_FILES["event_image"]["tmp_name"], $target_file);
        $adult_price = $_POST['adult_price'];
        $student_price = $_POST['student_price'];
        $pensioner_price = $_POST['pensioner_price'];
        $family_price = $_POST['family_price'];
        $group_price = $_POST['group_price'];
        $sql = "INSERT INTO events (event_name, event_date, event_description, image_name, image_path, f_ar, d_ar, ny_ar, csa_ar, cso_ar) 
        VALUES ('$event_name', '$event_date', '$event_description', '$image_name', '$image_path', '$adult_price', '$student_price', '$pensioner_price', '$family_price', '$group_price')";
        if ($conn->query($sql) === TRUE) {
            $event_id = $conn->insert_id;
            header("Location: ../../../events.php?event=$event_id");
            exit;
        }
        else {
            echo "Hiba történt az adatbázisban: " . $conn->error;
        }
    } else {
        echo "Kérem, töltse ki mindkét mezőt!";
    }
}
$conn->close();
?>