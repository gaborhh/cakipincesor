<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'])) {
    $email = clean_input($_POST["email"]);
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $check_email_query = "SELECT * FROM subscribers WHERE email='$email'";
    $result = $conn->query($check_email_query);
    if ($result->num_rows > 0) {
        $message = "Az email már fel van iratkozva";
    } else {
        $sql = "INSERT INTO subscribers (email) VALUES ('$email')";
        if ($conn->query($sql) === TRUE) {
            $message = "Sikeres feliratkozás";
        } else {
            $message = "Hiba történt a feliratkozás közben: " . $conn->error;
        }
    }
    $conn->close();
    echo json_encode(array("message" => $message));
} else {
    $message = "Hiba történt a feliratkozás közben: Hiányzó adatok";
    echo json_encode(array("message" => $message));
}
function clean_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>