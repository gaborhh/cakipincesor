<?php
include 'latogato.php';
?>
<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    $sql_user = "SELECT name FROM comments WHERE user_id = '$user_id' LIMIT 1";
    $result_user = $conn->query($sql_user);
    if ($result_user->num_rows > 0) {
        $user_row = $result_user->fetch_assoc();
        $user_name = $user_row["name"];
        echo '<h1>Felhasználó: ' . $user_name . '</h1>';
        $sql_events = "SELECT DISTINCT event_id FROM comments WHERE user_id = '$user_id'";
        $result_events = $conn->query($sql_events);
        if ($result_events->num_rows > 0) {
            echo '<h2>Kommentelt események:</h2>';
            echo '<ul>';
            while ($event = $result_events->fetch_assoc()) {
                $event_id = $event["event_id"];
                $event_name = getEventName($event_id, $conn);
                echo '<li><strong>Esemény:</strong> <a href="events.php?event=' . $event_id . '">' . $event_name . '</a>';
                $sql_comments = "SELECT name, comment FROM comments WHERE user_id = '$user_id' AND event_id = '$event_id' AND parent_comment_id IS NULL";
                $result_comments = $conn->query($sql_comments);
                if ($result_comments->num_rows > 0) {
                    echo '<ul>';
                    while ($comment = $result_comments->fetch_assoc()) {
                        echo '<li><strong>Komment:</strong> ' . $comment["comment"] . '</li>';
                    }
                    echo '</ul>';
                } else {
                    echo '<p>Még nincsenek kommentek erre az eseményre.</p>';
                }
                echo '</li>';
            }
            echo '</ul>';
        } else {
            echo '<p>A felhasználó még nem írt véleményt egyetlen eseményhez sem.</p>';
        }
    } else {
        echo '<p>Nem található felhasználó ezzel az azonosítóval.</p>';
    }
} else {
    echo '<p>Nincs megadva felhasználó azonosító.</p>';
}
function getEventName($event_id, $conn) {
    $sql_event = "SELECT event_name FROM events WHERE id = '$event_id'";
    $result_event = $conn->query($sql_event);
    if ($result_event->num_rows > 0) {
        $event_row = $result_event->fetch_assoc();
        return $event_row["event_name"];
    } else {
        return "Ismeretlen esemény";
    }
}
$conn->close();
?>