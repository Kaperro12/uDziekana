<?php include 'polaczenie.php'; ?>
<html><head><title>Magazyn</title><link rel='stylesheet' href='style.css'></head><body>
<nav><a href='index.php'>Strona Główna</a> <a href='panel.php'>Panel</a></nav>
<div class='content' style='padding:20px;'>
<h2>Stan Magazynowy</h2>
<table border='1' style='background:#fff;'><tr><th>ID Produktu</th><th>Ilość na stanie</th><th>Data uzupełnienia</th></tr>
<?php
$res = $conn->query("SELECT * FROM Magazyn");
while($row = $res->fetch_assoc()) {
echo "<tr><td>{$row['ID_Produktu']}</td><td>{$row['Ilosc_na_stanie']}</td><td>{$row['Data_uzupelnienia']}</td></tr>";
}
?>
</table>
</div></body></html>