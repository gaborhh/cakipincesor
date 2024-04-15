<?php
include 'assets/php/latogato.php';
?>
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rendezvények</title>
    <link rel="stylesheet" href="assets/css/events.css">
    <link rel="stylesheet" href="assets/css/styles.css">
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
      <li><a class="active" href="events.php">Rendezvények</a></li>
      <li><a  href="history.php">Történetünk</a></li>
      <li><a href="gallery.php">Galéria</a></li>
      <li><a href="contact.php">Kapcsolat</a></li>
    </ul>
  </nav>
<script>
    function scrollToEvent(event_id) {
        var eventElement = document.getElementById('event_' + event_id);
        eventElement.scrollIntoView({behavior: "smooth", block: "start", inline: "nearest"});
    }
    window.onload = function() {
        var urlParams = new URLSearchParams(window.location.search);
        var eventId = urlParams.get('event');
        if (eventId) {
            scrollToEvent(eventId);
        }
    }
    function toggleReplyForm(commentId) {
        var replyForm = document.getElementById('replyForm_' + commentId);
        if (replyForm.style.display === 'none' || replyForm.style.display === '') {
            replyForm.style.display = 'block';
        } else {
            replyForm.style.display = 'none';
        }
    }
    function toggleAllReplies(commentId) {
        var repliesContainer = document.getElementById('repliesContainer_' + commentId);
        if (repliesContainer.style.display === 'none' || repliesContainer.style.display === '') {
            repliesContainer.style.display = 'block';
        } else {
            repliesContainer.style.display = 'none';
        }
    }
    function countCharacters(textareaId, countId) {
        var textarea = document.getElementById(textareaId);
        var count = document.getElementById(countId);
        count.textContent = textarea.value.length + ' / 100';
    }
</script>
<?php
$servername = "localhost";
$username = "root";
$password = "tpq7j3twUXfxDu886zD2";
$dbname = "cakipincesor";
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SELECT * FROM events ORDER BY event_date DESC";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo '<div class="blog-container" id="event_' . $row["id"] . '">
                <div class="blog-header">
                    <div class="blog-cover">
                        <div class="blog-author">
                        ';
                        if (!empty($row["image_path"]) && !empty($row["image_name"])) {
                            echo '<div class="blog-tags">
                                    <img src="' . $row["image_path"] . '" alt="' . $row["event_name"] . '">
                                  </div>';
                        }
                        echo '
                    </div>
                </div>
            </div>
            <div class="blog-body">
                <div class="blog-title">
                    <h1 style="text-align:center">' . $row["event_name"] . '</h1>
                </div>
                <div class="blog-summary">';
        $description = $row["event_description"];
        $wrapped_description = wordwrap($description, 100, "<br>","\n");
        echo '<p style="text-align:center">' . nl2br($wrapped_description) . '</p>';  
        echo '</div>';
                echo '<div class="event-container">' .
                        '<table class="pricing-table">' .
                            '<thead><tr><th>Kategória</th><th>Ár</th></tr></thead>' .
                            '<tbody>' .
                                '<tr><td>Felnőtt</td><td>' . $row["f_ar"] . ' Ft</td></tr>' .
                                '<tr><td>Diák</td><td>' . $row["d_ar"] . ' Ft</td></tr>' .
                                '<tr><td>Nyugdíjas</td><td>' . $row["ny_ar"] . ' Ft</td></tr>' .
                                '<tr><td>Családi</td><td>' . $row["csa_ar"] . ' Ft 	 (2 gyermekkel / 6-18 éves korig)</td></tr>' .
                                '<tr><td>Csoportos</td><td>' . $row["cso_ar"] . ' Ft</td></tr>' .
                                '<tr><td>Mozgássérült (+1 kísérő)</td><td>Ingyenes</td></tr>' .
                            '</tbody>' .
                        '</table>' .
                    '</div>' .
                    '<p>Kedvezmények: 25% a natúrparki kártyák felmutatóknak, melyet a kőszegi Natúrpark és Tourinform irodában (9730 Kőszeg, Fő tér 2.) igényelhetők.
                    Csoportok fogadására előzetes bejelentkezést követően - akár a nyitvatartási időn kívül is - van lehetőség. (Bejelentkezés: Fehér Csabáné Kati +36-20/246-0180)
                    Borkóstolásra a Mándli Borházban és a Stefanich Pincészetben van lehetőség előzetes egyeztetés alapján.</p>';
        echo '</div>
                <div class="blog-footer">
                    <ul>
                        <li class="published-date">' . $row["event_date"] . '</li>
                    </ul>';
        echo '<div class="comment-section" id="comment_section_' . $row["id"] . '">
                <h2>Kommentek</h2>
                <form action="assets/php/submit_comment.php" method="post">
                    <input type="hidden" name="event_id" value="' . $row["id"] . '">
                    <label for="name">Név:</label>
                    <input type="text" id="name" name="name" required><br><br>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required><br><br>
                    <label for="comment">Vélemény:</label><br>
                    <textarea id="comment" class="comment-textarea" name="comment" rows="4" cols="50" maxlength="100" required oninput="countCharacters(\'comment\', \'charCount\');"></textarea>
                    <span class="char-count" id="charCount">0 / 100</span><br><br>
                    <input type="submit" value="Küldés">
                </form>
              </div>';
        $sql_comments = "SELECT * FROM comments WHERE event_id=" . $row["id"] . " AND parent_comment_id IS NULL "; 
        $result_comments = $conn->query($sql_comments);
        $num_comments = $result_comments->num_rows;
        if ($num_comments > 0) {
            $comment_count = 0;
            while($comment = $result_comments->fetch_assoc()) {
                $comment_count++;
                echo '<div class="comment">
                        <p><strong>Név:</strong><a href="account.php?id=' . $comment["user_id"] . '"> ' . $comment["name"] . '</a></p>
                        <p><strong>Komment:</strong> ' . $comment["comment"] . '</p>';
                echo '<a href="#" class="reply-link" onclick="toggleReplyForm(' . $comment["id"] . '); return false;">Válasz</a><br>';
                echo '<div id="replyForm_' . $comment["id"] . '" style="display:none;">
                        <form action="assets/php/submit_reply.php" method="post">
                            <input type="hidden" name="parent_comment_id" value="' . $comment["id"] . '">
                            <input type="hidden" name="event_id" value="' . $row["id"] . '">
                            <label for="name">Név:</label>
                            <input type="text" id="name" name="name" required><br><br>
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required><br><br>
                            <label for="comment">Válasz:</label><br>
                            <textarea id="comment" class="comment-textarea" name="comment" rows="4" cols="50" maxlength="100" required oninput="countCharacters(\'comment\', \'replyCharCount_' . $comment["id"] . '\');"></textarea>
                            <span class="char-count" id="replyCharCount_' . $comment["id"] . '">0 / 100</span><br><br>
                            <input type="submit" value="Küldés">
                        </form>
                      </div>';
                $comment_id = $comment["id"];
                $sql_replies = "SELECT * FROM comments WHERE parent_comment_id=" . $comment_id; 
                $result_replies = $conn->query($sql_replies);
                $sql_total_replies = "SELECT COUNT(*) AS total_replies FROM comments WHERE parent_comment_id=" . $comment_id; 
                $result_total_replies = $conn->query($sql_total_replies);
                $total_replies_row = $result_total_replies->fetch_assoc();
                $total_replies = $total_replies_row['total_replies'];
                if ($total_replies > 0) {
                    echo '<a href="#" class="toggle-replies" onclick="toggleAllReplies(' . $comment_id . '); return false;">Válaszok(' . $total_replies . ')</a>';
                    echo '<div id="repliesContainer_' . $comment_id . '" style="display:none;">';
                    while($reply = $result_replies->fetch_assoc()) {
                        echo '<div class="reply">
                                <p><strong>Válaszadó:</strong><a href="account.php?id=' . $reply["user_id"] . '"> ' . $reply["name"] . '</a></p>
                                <p><strong>Válasz:</strong> ' . $reply["comment"] . '</p>
                              </div><br>';
                    }
                    echo '</div>';
                }
                echo '</div>';
            }
        } else {
            echo '<p>Nincsenek kommentek.</p>';
        }
        echo '</div></div>';
    }
} else {
    echo "Nincsenek események.";
}
$conn->close();
?>
</body>
</html>
