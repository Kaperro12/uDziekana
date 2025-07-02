<?php include 'polaczenie.php'; ?>
<html>
<head>
    <title>uDziekana - Dodaj Produkt</title>
    <link rel='stylesheet' href='style.css'>
    <style>
        input, button {
            color: black;
        }
    </style>
</head>
<body>
<nav>
    <a href='index.php' style='font-size:24px;'>uDziekana</a>
    <a href='panel.php'>Panel Pracownika</a>
</nav>

<div class='content' style='justify-content:center; width:100%;'>
    <div class='panel' style='max-width:400px; width:100%;'>
        <h2>Dodaj Produkt</h2>
        <form method='POST'>
            Nazwa: <input type='text' name='nazwa' required><br><br>
            Cena (zł): <input type='number' step='0.01' name='cena' required><br><br>
            Waga (kg, opcjonalnie): <input type='number' step='0.001' name='waga'><br><br>
            Ilość na magazynie: <input type='number' name='ilosc' required><br><br>
            <button type='submit'>Dodaj</button>
        </form>

        <?php
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $nazwa = $conn->real_escape_string($_POST['nazwa']);
            $cena = floatval($_POST['cena']);
            $waga = $_POST['waga'] !== '' ? floatval($_POST['waga']) : 'NULL';
            $ilosc = intval($_POST['ilosc']);

            $conn->query("INSERT INTO Produkt (Nazwa, Cena, Waga) VALUES ('$nazwa', $cena, $waga)");
            $id_produktu = $conn->insert_id;

            $conn->query("INSERT INTO Magazyn (ID_Produktu, Ilosc_na_stanie, Data_uzupelnienia) VALUES ($id_produktu, $ilosc, NOW())");

            echo "<p style='color:green;'>Produkt dodany pomyślnie!</p>";
        }
        ?>
    </div>
</div>
</body>
</html>
