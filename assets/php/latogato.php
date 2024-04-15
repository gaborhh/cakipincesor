<?php
session_start();
require_once 'admin/assets/php/conn.php';
if (empty($_SESSION['visited'])) {
    $session_id = session_id();
    $visit_date = date('Y-m-d H:i:s');
    $page_visited = basename($_SERVER['PHP_SELF']); 
    $ip_address = $_SERVER['REMOTE_ADDR'];
    $sql_check = "SELECT * FROM visits WHERE session_id = ?";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bind_param("s", $session_id);
    $stmt_check->execute();
    $result = $stmt_check->get_result();
    if ($result->num_rows == 0) {
        $sql_insert = "INSERT INTO visits (ip_address, session_id, visit_date, page_visited) VALUES (?, ?, ?, ?)";
        $stmt_insert = $conn->prepare($sql_insert);
        $stmt_insert->bind_param("ssss", $ip_address, $session_id, $visit_date, $page_visited);
        $stmt_insert->execute();
        $_SESSION['visited'] = true;
    }
}
else {
    $session_id = session_id();
    $visit_date = date('Y-m-d H:i:s');
    $page_visited = basename($_SERVER['PHP_SELF']);
    $ip_address = $_SERVER['REMOTE_ADDR'];
    $sql_check_page = "SELECT * FROM visits WHERE session_id = ? AND page_visited = ?";
    $stmt_check_page = $conn->prepare($sql_check_page);
    $stmt_check_page->bind_param("ss", $session_id, $page_visited);
    $stmt_check_page->execute();
    $result_page = $stmt_check_page->get_result();
    if ($result_page->num_rows == 0) {
        $sql_insert_page = "INSERT INTO visits (ip_address, session_id, visit_date, page_visited) VALUES (?, ?, ?, ?)";
        $stmt_insert_page = $conn->prepare($sql_insert_page);
        $stmt_insert_page->bind_param("ssss", $ip_address, $session_id, $visit_date, $page_visited);
        $stmt_insert_page->execute();
    }
}
?>