<?php
include 'polaczenie.php';
session_start();
?>
<html>
<head>
    <title>Logowanie i Rejestracja - uDziekana</title>
    <link rel='stylesheet' href='style.css'>
    <style>
    input, button {
        color: black;
    }
	.header {
    	text-align: center;
	}

    </style>
</head>
<body>
<div class='header'>
    <h1>uDziekana</h1>
    <p>Witamy w samoobsługowym sklepie studenckim</p>
</div>

<div class='content' style='justify-content:center; width:100%; display:flex; gap:50px;'>

<!-- Logowanie -->
<div class='panel' style='max-width:300px; flex:1;'>
<h2>Zaloguj się</h2>
<p><small>Wpisz dowolne z poniższych pól, aby się zalogować:</small></p>
<form method='POST'>
Imię: <input type='text' name='imie'><br><br>
Nazwisko: <input type='text' name='nazwisko'><br><br>
Email: <input type='email' name='email'><br><br>
ID karty lojalnościowej: <input type='number' name='karta'><br><br>
<button type='submit' name='logowanie' value='1'>Zaloguj</button>
</form>

<?php
if (isset($_POST['logowanie'])) {
    $warunki = [];

    if (!empty($_POST['imie']) && !empty($_POST['nazwisko'])) {
        $imie = $conn->real_escape_string($_POST['imie']);
        $nazwisko = $conn->real_escape_string($_POST['nazwisko']);
        $warunki[] = "(Imie = '$imie' AND Nazwisko = '$nazwisko')";
    }
    if (!empty($_POST['email'])) {
        $email = $conn->real_escape_string($_POST['email']);
        $warunki[] = "Email = '$email'";
    }
    if (!empty($_POST['karta'])) {
        $idkarty = intval($_POST['karta']);
        $res = $conn->query("SELECT ID_Klienta FROM Karta_Lojalnosciowa WHERE ID_Karty = $idkarty");
        if ($res->num_rows) {
            $_SESSION['klient'] = $res->fetch_assoc()['ID_Klienta'];
            $conn->query("INSERT INTO Sesja_Zakupowa (ID_Klienta, Data_startu, Aktywna) VALUES ({$_SESSION['klient']}, NOW(), 1)");
            $_SESSION['id_sesji'] = $conn->insert_id;
            header('Location: index.php');
            exit;
        }
    }

    if (!empty($warunki)) {
        $sql = "SELECT * FROM Klient WHERE " . implode(" OR ", $warunki) . " LIMIT 1";
        $res = $conn->query($sql);
        if ($res->num_rows) {
            $_SESSION['klient'] = $res->fetch_assoc()['ID_Klienta'];
            $conn->query("INSERT INTO Sesja_Zakupowa (ID_Klienta, Data_startu, Aktywna) VALUES ({$_SESSION['klient']}, NOW(), 1)");
            $_SESSION['id_sesji'] = $conn->insert_id;
            header('Location: index.php');
            exit;
        } else {
            echo "<p style='color:red;'>Nie znaleziono klienta.</p>";
        }
    }
}
?>
</div>

<!-- Rejestracja -->
<div class='panel' style='max-width:300px; flex:1;'>
<h2>Zarejestruj się</h2>
<form method='POST'>
Imię: <input type='text' name='imie_r' required><br><br>
Nazwisko: <input type='text' name='nazwisko_r' required><br><br>
Email: <input type='email' name='email_r' required><br><br>
Dodaj kartę lojalnościową: <input type='checkbox' name='karta_r' value='1'><br><br>
<button type='submit' name='rejestracja' value='1'>Zarejestruj</button>
</form>

<?php
if (isset($_POST['rejestracja'])) {
    $imie = $conn->real_escape_string($_POST['imie_r']);
    $nazwisko = $conn->real_escape_string($_POST['nazwisko_r']);
    $email = $conn->real_escape_string($_POST['email_r']);
    $conn->query("INSERT INTO Klient (Imie, Nazwisko, Email) VALUES ('$imie', '$nazwisko', '$email')");
    $id_klienta = $conn->insert_id;

    if (isset($_POST['karta_r'])) {
        $conn->query("INSERT INTO Karta_Lojalnosciowa (ID_Klienta, Punkty) VALUES ($id_klienta, 0)");
    }
    $_SESSION['klient'] = $id_klienta;
    $conn->query("INSERT INTO Sesja_Zakupowa (ID_Klienta, Data_startu, Aktywna) VALUES ($id_klienta, NOW(), 1)");
    $_SESSION['id_sesji'] = $conn->insert_id;
    header('Location: index.php');
    exit;
}
?>
</div>

</div>
</body>
</html>
