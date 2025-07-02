<?php include 'polaczenie.php';
$id = intval($_GET['id']);
$conn->query("INSERT INTO Karta_Lojalnosciowa (ID_Klienta, Punkty) VALUES ($id, 0)");
$_SESSION['klient'] = $id;
header('Location: index.php');
?>