<style>
        .sidebar {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px;
            text-decoration: none;
            font-size: 20px;
            color: #818181;
            display: block;
        }
        .sidebar a:hover {
            color: #f1f1f1;
        }
        .content {
            margin-left: 200px; 
            padding: 16px;
        }
    </style>
<div class="sidebar">
    <a href="index.php">Kezdőlap</a>
    <a href="site.php">Esemény hozzáadása</a>
    <a href="tickets.php">Jegyek</a>
    <a href="admin.php">Admin hozzáadása</a>
    <a href="logout.php">Kijelentkezés</a>
</div>