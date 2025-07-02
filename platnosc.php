<?php
include 'polaczenie.php';
if (!isset($_SESSION['klient'])) { header('Location: login.php'); exit; }
?>

<html>
<head>
    <title>uDziekana - Płatność</title>
    <link rel='stylesheet' href='style.css'>
</head>
<body>
<nav><a href='index.php'>uDziekana</a></nav>

<div class='content' style='justify-content:center; width:100%;'>
<div class='panel'>
<h2>Wybierz metodę płatności</h2>

<form method='POST' class='pay-options'>
<?php
$res = $conn->query("SELECT * FROM Metoda_Platnosci");
while($row = $res->fetch_assoc()) {
    echo "<button name='metoda' value='{$row['ID_Metody']}'>{$row['Nazwa']}</button>";
}
?>
</form>

<?php
if (isset($_POST['metoda'])) {
    $klient = $_SESSION['klient'];
    $suma = 0;

    // Liczymy sumę koszyka
    foreach ($_SESSION['koszyk'] as $pid => $ilosc) {
        $r = $conn->query("SELECT Cena FROM Produkt WHERE ID_Produktu = $pid")->fetch_assoc();
        $subtotal = $r['Cena'] * $ilosc;
        $suma += $subtotal;
    }

    // Zapis transakcji
    $conn->query("INSERT INTO Transakcja (Data, ID_Klienta, ID_Metody, Kwota) VALUES (NOW(), $klient, {$_POST['metoda']}, $suma)");
    $id_transakcji = $conn->insert_id;

    // Szczegóły transakcji i aktualizacja magazynu
    foreach ($_SESSION['koszyk'] as $pid => $ilosc) {
        $r = $conn->query("SELECT Cena FROM Produkt WHERE ID_Produktu = $pid")->fetch_assoc();
        $cena = $r['Cena'];
        $wartosc = $cena * $ilosc;

        $conn->query("INSERT INTO Szczegoly_Transakcji (ID_Transakcji, ID_Produktu, Ilosc, Cena_za_sztuke, Wartosc)
                      VALUES ($id_transakcji, $pid, $ilosc, $cena, $wartosc)");

        $conn->query("UPDATE Magazyn SET Ilosc_na_stanie = Ilosc_na_stanie - $ilosc WHERE ID_Produktu = $pid");
    }

    // Zamykanie sesji zakupowej w bazie
    if (isset($_SESSION['id_sesji'])) {
        $id_sesji = intval($_SESSION['id_sesji']);
        $conn->query("UPDATE Sesja_Zakupowa SET Data_zakonczenia = NOW(), Aktywna = 0 WHERE ID_Sesji = $id_sesji");
    }

    // Czyszczenie danych sesji
    unset($_SESSION['koszyk']);
    unset($_SESSION['id_sesji']);
    unset($_SESSION['klient']);

    header("Location: podziekowanie.php");
    exit;
}
?>
</div>
</div>

</body>
</html>
