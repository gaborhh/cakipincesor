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
$sql = "SELECT * FROM events";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jegyek rögzítése</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        form {
            width: 400px;
            padding: 20px;
            border: 2px solid #fff;
            border-radius: 10px;
        }
        h1 {
            text-align: center;
        }
        label, input, select {
            display: block;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #1b9bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background-color: #0a85d5;
        }
    </style>
</head>
<body>
<?php include('menu.php') ?>
    <h1>Jegyek rögzítése</h1>
    <form action="../assets/php/process_ticket.php" method="post">
        <label for="event">Esemény:</label>
        <select name="event" id="event">
            <option value="">Válassz eseményt</option>
            <?php 
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<option value='". $row['id'] ."'>". $row['event_name'] ."</option>";
                }
            }
            ?>
        </select>
        <label for="quantity">Jegyek darabszáma:</label>
        <input type="number" id="quantity" name="quantity" min="1" required>
        <label for="revenue">Befolyt összeg:</label>
        <input type="number" id="revenue" name="revenue" min="0" required>
        <input type="hidden" id="date" name="date" value="<?php echo date('Y-m-d'); ?>">
        <input type="submit" value="Mentés">
    </form>
</body>
</html>
<?php
$conn->close();
?>