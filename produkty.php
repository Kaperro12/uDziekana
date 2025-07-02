<?php include 'polaczenie.php'; ?>
<html><head><title>uDziekana - Lista Produktów</title><link rel='stylesheet' href='style.css'></head><body>
<nav><a href='index.php' style='font-size:24px;'>uDziekana</a><a href='panel.php'>Panel Pracownika</a></nav>
<div class='content' style='flex-direction:column;'>
<h2>Lista Produktów</h2>
<table><tr><th>Nazwa</th><th>Cena</th><th>Ilość w magazynie</th><th>Data uzupełnienia</th><th>Łączna wartość</th></tr>
<?php
$res = $conn->query("SELECT p.Nazwa, p.Cena, m.Ilosc_na_stanie, m.Data_uzupelnienia FROM Produkt p JOIN Magazyn m ON p.ID_Produktu = m.ID_Produktu");
while($row = $res->fetch_assoc()) {
$wartosc = $row['Cena'] * $row['Ilosc_na_stanie'];
echo "<tr><td>{$row['Nazwa']}</td><td>{$row['Cena']} zł</td><td>{$row['Ilosc_na_stanie']}</td><td>{$row['Data_uzupelnienia']}</td><td>{$wartosc} zł</td></tr>";
}
?>
</table>
</div></body></html>