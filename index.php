<?php
include 'polaczenie.php';
if (!isset($_SESSION['klient'])) { header('Location: login.php'); exit; }
if (!isset($_SESSION['koszyk'])) { $_SESSION['koszyk'] = []; }

// Obsługa dodawania do koszyka
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add'])) {
    $pid = intval($_POST['add']);
    $qty = intval($_POST['qty']);
    $res = $conn->query("SELECT Ilosc_na_stanie FROM Magazyn WHERE ID_Produktu = $pid");
    if ($row = $res->fetch_assoc()) {
        $dostepne = $row['Ilosc_na_stanie'];
        $w_koszyku = $_SESSION['koszyk'][$pid] ?? 0;
        if ($qty > 0 && ($qty + $w_koszyku) <= $dostepne) {
            $_SESSION['koszyk'][$pid] = $w_koszyku + $qty;
        }
    }
    header('Location: index.php');
    exit;
}

// Obsługa usuwania z koszyka
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['remove'])) {
    unset($_SESSION['koszyk'][$_POST['remove']]);
    header('Location: index.php');
    exit;
}

$klient = $_SESSION['klient'];
$res = $conn->query("SELECT Punkty FROM Karta_Lojalnosciowa WHERE ID_Klienta = $klient");
$punkty = ($row = $res->fetch_assoc()) ? $row['Punkty'] : 0;
?>

<html>
<head>
    <title>uDziekana - Sklep</title>
    <link rel='stylesheet' href='style.css'>
</head>
<body>
<nav>
    <a href='index.php' style='font-size:24px;'>uDziekana</a>
    <a href='panel.php'>Panel Pracownika</a>
    <a href='logout.php'>Zakończ sesję</a>
    <span style='float:right;'>Klient ID: <?php echo $klient; ?> | Punkty: <?php echo $punkty; ?></span>
</nav>

<div class='content'>
    <div class='products'>
        <?php
        $res = $conn->query("SELECT * FROM Produkt JOIN Magazyn ON Produkt.ID_Produktu = Magazyn.ID_Produktu");
        while($row = $res->fetch_assoc()) {
            echo "<div class='product'>
            {$row['Nazwa']}<br>{$row['Cena']} zł<br>Dostępne: {$row['Ilosc_na_stanie']}<br>
            <form method='POST'>
                <input type='hidden' name='add' value='{$row['ID_Produktu']}'>
                <input type='number' name='qty' value='1' min='1' max='{$row['Ilosc_na_stanie']}' style='width:50px;'><br>
                <button>Dodaj</button>
            </form>
            </div>";
        }
        ?>
    </div>

    <div class='cart'>
        <h2>Koszyk</h2>
        <?php
        $suma = 0;
        foreach ($_SESSION['koszyk'] as $pid => $ilosc) {
            $r = $conn->query("SELECT * FROM Produkt WHERE ID_Produktu=$pid")->fetch_assoc();
            $subtotal = $r['Cena'] * $ilosc;
            echo "<div>{$r['Nazwa']} - {$ilosc} szt. - {$subtotal} zł
            <form method='POST' style='display:inline;'>
                <input type='hidden' name='remove' value='$pid'>
                <button>Usuń</button>
            </form>
            </div>";
            $suma += $subtotal;
        }
        echo "<p><b>Suma: $suma zł</b></p>";
        if ($suma > 0) {
            echo "<a href='platnosc.php'><button>Płatność</button></a>";
        }
        ?>
    </div>
</div>
</body>
</html>
