<?php include 'polaczenie.php'; ?>
<html><head><title>uDziekana - Historia Transakcji</title><link rel='stylesheet' href='style.css'></head><body>
<nav><a href='index.php' style='font-size:24px;'>uDziekana</a> <a href='panel.php'>Panel Pracownika</a></nav>
<div class='content' style='flex-direction:column;'>
<h2>Historia Transakcji</h2>
<?php
$res = $conn->query("SELECT t.ID_Transakcji, t.Data, t.ID_Klienta, m.Nazwa AS Metoda, t.Kwota,
s.ID_Produktu, p.Nazwa AS Produkt, s.Ilosc, s.Cena_za_sztuke, s.Wartosc
FROM Transakcja t
JOIN Metoda_Platnosci m ON t.ID_Metody = m.ID_Metody
JOIN Szczegoly_Transakcji s ON t.ID_Transakcji = s.ID_Transakcji
JOIN Produkt p ON s.ID_Produktu = p.ID_Produktu
ORDER BY t.Data DESC, t.ID_Transakcji DESC");
$aktualna_transakcja = null;
while($row = $res->fetch_assoc()) {
if ($row['ID_Transakcji'] != $aktualna_transakcja) {
if ($aktualna_transakcja !== null) { echo "</table><br>"; }
echo "<h3>Transakcja nr {$row['ID_Transakcji']}</h3>";
echo "<p>Data: {$row['Data']} | Klient: {$row['ID_Klienta']} | Metoda płatności: {$row['Metoda']} | Łączna kwota: {$row['Kwota']} zł</p>";
echo "<table><tr><th>Produkt</th><th>Ilość</th><th>Cena/szt</th><th>Łącznie</th></tr>";
$aktualna_transakcja = $row['ID_Transakcji'];
}
echo "<tr><td>{$row['Produkt']}</td><td>{$row['Ilosc']}</td><td>{$row['Cena_za_sztuke']} zł</td><td>{$row['Wartosc']} zł</td></tr>";
}
if ($aktualna_transakcja !== null) { echo "</table>"; }
?>
</div></body></html>