<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin hozzáadása</title>
    
    <style>

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<?php include('menu.php') ?>
<div class="container">
    <h2>Új admin hozzáadása</h2>
    <form action="../assets/php/add_admin.php" method="post">
        <label for="username">Felhasználónév:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Jelszó:</label>
        <input type="password" id="password" name="password" required>

        <label for="email">E-mail cím:</label>
        <input type="email" id="email" name="email" required>

        <input type="submit" value="Hozzáadás">
    </form>
</div>

</body>
</html>
