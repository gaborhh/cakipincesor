<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: ../index.php");
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


$sql_comments = "SELECT * FROM comments ORDER BY created_at DESC LIMIT 5";
$result_comments = $conn->query($sql_comments);
$sql = "SELECT COUNT(DISTINCT session_id) AS lathato_ip FROM visits";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $lathato_ip = $row["lathato_ip"];
} else {
    $lathato_ip = 0;
}
$sql1 = "SELECT * FROM tickets LIMIT 5"; 
$result1 = $conn->query($sql1);
$sql2 = "SELECT COUNT(DISTINCT page_visited) AS latogatott_oldalak FROM visits";
$result2 = $conn->query($sql2);

if ($result2->num_rows > 0) {
    $row2 = $result2->fetch_assoc();
    $latogatott_oldalak = $row2["latogatott_oldalak"];
} else {
    $latogatott_oldalak = 0;
}
$sql_pages = "SELECT page_visited, COUNT(DISTINCT session_id) AS lathato_ip FROM visits GROUP BY page_visited";
$result_pages = $conn->query($sql_pages);
$sql_today = "SELECT COUNT(DISTINCT session_id) AS ma FROM visits WHERE DATE(visit_date) = CURDATE()";
$result_today = $conn->query($sql_today);
$today_visits = 0;
if ($result_today->num_rows > 0) {
    $row_today = $result_today->fetch_assoc();
    $today_visits = $row_today['ma'];
}
$sql_last_7_days = "SELECT DATE(visit_date) AS datum, COUNT(DISTINCT session_id) AS lathato_ip FROM visits WHERE DATE(visit_date) BETWEEN CURDATE() - INTERVAL 7 DAY AND CURDATE() GROUP BY DATE(visit_date)";
$result_last_7_days = $conn->query($sql_last_7_days);
$last_7_days_data = array();
if ($result_last_7_days->num_rows > 0) {
    while($row = $result_last_7_days->fetch_assoc()) {
        $last_7_days_data[$row['datum']] = $row['lathato_ip'];
    }
}

?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        #myChart{
            margin-left:600px;
        }
        #comments-container {
            max-height: 300px;
            overflow-y: auto;
            margin-top: 20px; 
        }
        .comment {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<?php include('menu.php') ?>
<div class="content">
    <h1>Üdvözöllek, <?php echo $_SESSION['username']; ?>!</h1>
    <p>Látogatottság: <?php echo $lathato_ip; ?></p>
    <table>
        <tr>
            <th>ID</th>
            <th>Esemény neve</th>
            <th>Ár</th>
            <th>Darabszám</th>
            <th>Dátum</th>
        </tr>
        <?php
        $sql_tickets = "SELECT tickets.*, events.event_name FROM tickets INNER JOIN events ON tickets.event_id = events.id LIMIT 5";
        $result_tickets = $conn->query($sql_tickets);
        if ($result_tickets->num_rows > 0) {
            while($row = $result_tickets->fetch_assoc()) {
                echo "<tr><td>" . $row["ticket_id"] . "</td><td>" . $row["event_name"] . "</td><td>" . $row["quantity"] . "</td><td>" . $row["revenue"] . "</td><td>" . $row["date"] . "</td></tr>";
            }
        } else {
            echo "<tr><td colspan='5'>Nincs találat a jegyekre.</td></tr>";
        }
        ?>
    </table>
</div>
<div class="content">
<table>
        <tr>
            <th>Oldal neve</th>
            <th>Látogatók száma</th>
        </tr>
        <?php
        $sql_pages = "SELECT page_visited, COUNT(DISTINCT session_id) AS lathato_ip FROM visits GROUP BY page_visited";
        $result_pages = $conn->query($sql_pages);
        if ($result_pages->num_rows > 0) {
            while($row = $result_pages->fetch_assoc()) {
                $oldal_nev = $row["page_visited"] == "events.php" ? "Rendezvényeink" : ($row["page_visited"] == "contact.php" ? "Kapcsolat" : ($row["page_visited"] == "gallery.php" ? "Galéria" : ($row["page_visited"] == "account.php" ? "Fiók" : ($row["page_visited"] == "index.php" ? "Kezdő oldal" : ($row["page_visited"] == "history.php" ? "Történetünk" : $row["page_visited"])))));
                echo "<tr><td>" . $oldal_nev . "</td><td>" . $row["lathato_ip"] . "</td></tr>";
            }
        } else {
            echo "<tr><td colspan='2'>Nincs találat az oldalak látogatottságára.</td></tr>";
        }
        ?>
    </table>
</div>
<div style="width: 80%; ">
    <canvas  id="myChart"></canvas>
</div>
<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [
                <?php
                foreach ($last_7_days_data as $datum => $lathato_ip) {
                    echo '"' . $datum . '", ';
                }
                ?>
            ],
            datasets: [{
                label: 'Látogatottság',
                data: [
                    <?php
                    foreach ($last_7_days_data as $lathato_ip) {
                        echo $lathato_ip . ', ';
                    }
                    ?>
                ],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>
<div id="comments-container" class="content">
    <h2>Legfrissebb kommentek</h2>
    <?php
$sql_comments = "SELECT comments.*, events.event_name FROM comments INNER JOIN events ON comments.event_id = events.id ORDER BY comments.created_at DESC LIMIT 5";
$result_comments = $conn->query($sql_comments);

if ($result_comments->num_rows > 0) {
    echo '<div class="comments-box">';
    echo '<ul>';
    while($row = $result_comments->fetch_assoc()) {
        $comment_author = $row["name"];
        $comment_event_id = $row["event_id"];
        $comment_created_at = $row["created_at"];
        $event_name = $row["event_name"];
        $user_id = $row["user_id"];
        echo '<li class="comment">';
        echo '<strong><a href="../../account.php?id=' . $user_id . '">' . $comment_author . '</a></strong> írta a(z) <strong><a href="../../events.php?event=' . $comment_event_id . '">' . $event_name . '</a></strong> eseményhez: ' . $comment_created_at;
        echo '</li>';
    }
    echo '</ul>';
    echo '</div>';
} else {
    echo '<p>Nincsenek legfrissebb kommentek.</p>';
}

    ?>
</div>


</body>
</html>
