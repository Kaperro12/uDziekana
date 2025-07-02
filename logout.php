<?php
include 'polaczenie.php';
session_start();

if (isset($_SESSION['id_sesji'])) {
    $id_sesji = intval($_SESSION['id_sesji']);
    $conn->query("UPDATE Sesja_Zakupowa SET Data_zakonczenia = NOW(), Aktywna = 0 WHERE ID_Sesji = $id_sesji");
}

session_destroy();
header('Location: login.php');
exit;
