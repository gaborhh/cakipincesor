<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = clean_input($_POST["name"]);
    $email = clean_input($_POST["email"]);
    $comment = clean_input($_POST["comment"]);
    $event_id = clean_input($_POST["event_id"]);
    $created_at = date('Y-m-d H:i:s');
    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    $check_user_query = "SELECT user_id FROM comments WHERE email=?";
    $stmt = $conn->prepare($check_user_query);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($user_id);
        $stmt->fetch();
    } else {
        $user_id = generateRandomUserId($conn);
    }
    $insert_query = "INSERT INTO comments (user_id, name, email, comment, event_id, created_at) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($insert_query);
    $stmt->bind_param("ssssis", $user_id, $name, $email, $comment, $event_id, $created_at);
    
    if ($stmt->execute()) {
        header("Location: ../../events.php");
        exit();
    } else {
        echo "Hiba történt a komment beküldése közben: " . $stmt->error;
    }
    $stmt->close();
    $conn->close();
} else {
    echo "Hiba történt az adatok feldolgozása közben.";
}
function clean_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
function generateRandomUserId($conn) {
    $unique = false;
    $user_id = '';
    while (!$unique) {
        $user_id = bin2hex(random_bytes(16));
        $check_user_id_query = "SELECT * FROM comments WHERE user_id=?";
        $stmt = $conn->prepare($check_user_id_query);
        $stmt->bind_param("s", $user_id);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows == 0) {
            $unique = true;
        }
    }
    return $user_id;
}
?>