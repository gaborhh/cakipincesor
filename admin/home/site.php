<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esemény létrehozása</title>
    <style>
        .pricing-table {
            width: 598px;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            text-align: left;
        }
        .pricing-table th,
        .pricing-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        .pricing-table th {
            background-color: #f2f2f2;
        }
        .container {
            width: 600px;
            margin: 0 auto;
            text-align: center;
        }
        form {
            margin-top: 20px;
            text-align: center;
        }
        .pricing-table {
            margin-top: 20px;
        }
        input[type="submit"] {
    border-radius: 5px;
    padding: 10px 20px;
    background-color: #007bff; 
    color: white; 
    border: none; 
    cursor: pointer;
    font-size: 16px;
}
input[type="submit"]:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
<?php include('menu.php') ?>
<div class="content">
    <div class="container">
        <h2>Új Esemény Létrehozása</h2>
        <form action="../assets/php/site_add.php" method="POST" enctype="multipart/form-data" id="event_form">
            <label for="event_name">Esemény Neve:</label><br>
            <input type="text" id="event_name" name="event_name"><br><br>
            <label for="event_date">Esemény Dátuma:</label><br>
            <input type="date" id="event_date" name="event_date"><br><br>
            <label for="event_description">Leírás:</label><br>
            <textarea id="event_description" name="event_description" rows="4" cols="50"></textarea><br><br>
            <label for="event_image">Kép feltöltése:</label><br>
            <input type="file" id="event_image" name="event_image"><br><br>
            <table class="pricing-table" id="price_table">
                <thead>
                    <tr>
                        <th>Kategória</th>
                        <th>Ár</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Felnőtt</td>
                        <td><input type="number" name="adult_price" value="500"></td>
                    </tr>
                    <tr>
                        <td>Diák</td>
                        <td><input type="number" name="student_price" value="300"></td>
                    </tr>
                    <tr>
                        <td>Nyugdíjas</td>
                        <td><input type="number" name="pensioner_price" value="300"></td>
                    </tr>
                    <tr>
                        <td>Családi</td>
                        <td><input type="number" name="family_price" value="1000"></td>
                    </tr>
                    <tr>
                        <td>Csoportos</td>
                        <td><input type="number" name="group_price" value="300"></td>
                    </tr>
                    <tr>
                        <td>Mozgássérült (+1 kísérő)</td>
                        <td><p>Ingyenes</p></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" value="Létrehozás">
        </form>
    </div>
</div>
</body>
</html>