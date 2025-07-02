<?php
$host = "localhost";
$user = "root";
$password = "";
$database = "udziekana";
$conn = new mysqli($host, $user, $password, $database);
if ($conn->connect_error) { die("Błąd połączenia: " . $conn->connect_error); }
session_start();
?>