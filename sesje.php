<?php include 'polaczenie.php'; ?>
<html><head><title>uDziekana - Sesje Zakupowe</title><link rel='stylesheet' href='style.css'></head><body>
<nav><a href='index.php' style='font-size:24px;'>uDziekana</a> <a href='panel.php'>Panel Pracownika</a></nav>
<div class='content' style='flex-direction:column;'>
<h2>Sesje Zakupowe</h2>
<table><tr><th>ID Sesji</th><th>ID Klienta</th><th>Data startu</th><th>Data zakończenia</th><th>Aktywna</th></tr>
<?php
$res = $conn->query("SELECT * FROM Sesja_Zakupowa ORDER BY Data_startu DESC");
while($row = $res->fetch_assoc()) {
$status = $row['Aktywna'] ? "Tak" : "Nie";
echo "<tr><td>{$row['ID_Sesji']}</td><td>{$row['ID_Klienta']}</td><td>{$row['Data_startu']}</td><td>{$row['Data_zakonczenia']}</td><td>{$status}</td></tr>";
}
?>
</table>
</div></body></html>