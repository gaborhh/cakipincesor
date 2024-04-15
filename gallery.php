<?php
include 'assets/php/latogato.php';
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM gallery";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery</title>
    <link rel="stylesheet" href="assets/css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e5ded8;
        }
        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }
        .image {
            background-color: bisque;
            margin: 10px;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            width: 200px; 
            height: 200px; 
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .image img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }
        .image:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="check-btn">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </label>
        <label class="logo">Cáki Pincesor</label>
        <ul>
            <li><a href="index.php">Kezdőlap</a></li>
            <li><a href="events.php">Rendezvények</a></li>
            <li><a href="history.php">Történetünk</a></li>
            <li><a class="active" href="gallery.php">Galéria</a></li>
            <li><a href="contact.php">Kapcsolat</a></li>
        </ul>
    </nav>
    <div class="gallery">
        <?php 
            $count = 0;
            while ($row = $result->fetch_assoc()) { 
                if ($count % 3 == 0 && $count != 0) {
                    echo '</div><div class="gallery">';
                }
        ?>
        <div class="image">
            <a href="gallery/<?php echo $row['image']; ?>" target="_blank" rel="noopener noreferrer"><img src="gallery/<?php echo $row['image']; ?>" alt="kep"></a>
        </div>
        <?php 
                $count++;
            } 
        ?>
    </div>
</body>
</html>
<?php
} else {
    echo "Nincs kép az adatbázisban.";
}
$conn->close();
?>
