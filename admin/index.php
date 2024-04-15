<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bejelentkezés</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <div class="container">
        <form class="login-form" method="POST" action="login.php">
            <h2>Bejelentkezés</h2>
            <div class="input-group">
                <label for="username">Felhasználónév:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Jelszó:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Bejelentkezés</button>
        </form>
    </div>
</body>
</html>