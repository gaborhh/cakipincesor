<?php
include 'latogato.php';
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontakt</title>
    <style>
        body{
            background-color: #e5ded8;

        }
        .card {
            width: 300px;
            height: 400px;
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: auto;
            margin-top:50px
        }
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 20px;
            object-fit: cover;
        }
        .description {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
    color: #666;
    line-height: 1.6;
}
    </style>
   <link rel="stylesheet" href="assets/css/styles.css">
    <style>
        .container {
            opacity: 0;
            transform: translateY(-20px);
            animation: fadeInUp 1s ease forwards;
        }
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
      <li><a href="gallery.php">Galéria</a></li>
      <li><a class="active" href="contact.php">Kapcsolat</a></li>
    </ul>
  </nav>
<div class="card">
    <img class="profile-pic" src="gallery/user.png" alt="Profil kép">
    <div class="description">
        <p>Teszt Elek</p>
        <p>Telefonszám: +36 1 234 5678</p>
    </div>
</div>
</body>
</html>
