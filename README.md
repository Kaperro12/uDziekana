# uDziekana — Sklepik Samoobsługowy

Prosta aplikacja webowa symulująca samoobsługowy sklep studencki z funkcją zakupów, koszyka, płatności i panelem pracownika.

---

## ✅ Wymagania

- Zainstalowany **XAMPP** (pakiet zawierający Apache i MySQL)  
- Przeglądarka internetowa  
- Edytor tekstowy (opcjonalnie) do edycji kodu  
- Pliki projektu: 13 plików PHP + plik CSS + plik bazy danych `.sql`  

---

## ✅ Instalacja i uruchomienie krok po kroku

### 1. Pobierz i zainstaluj XAMPP  
[XAMPP download](https://www.apachefriends.org/index.html)  
Pobierz wersję dla swojego systemu i zainstaluj.  

---

### 2. Uruchom XAMPP i włącz serwery  
- Otwórz **XAMPP Control Panel**  
- Kliknij **Start** przy `Apache` i `MySQL`  

Na macOS możesz uruchomić XAMPP poprzez aplikację `manager-osx`.

---

### 3. Przygotowanie plików projektu  
Skopiuj cały folder projektu (13 plików PHP + plik CSS) do odpowiedniego katalogu:

**Na Windowsie:**  
```
C:\xampp\htdocs\udziekana
```

**Na macOS:**  
```
/Applications/XAMPP/htdocs/udziekana
```

Twoja struktura powinna wyglądać np. tak:

```
htdocs
└── udziekana
    ├── index.php
    ├── login.php
    ├── logout.php
    ├── platnosc.php
    ├── produkty.php
    ├── sesje.php
    ├── transakcje.php
    ├── dodaj_produkt.php
    ├── panel.php
    ├── podziekowanie.php
    ├── style.css
    ├── polaczenie.php
    └── ...
```

---

### 4. Import bazy danych  
1. Otwórz przeglądarkę i wejdź na:  
   [http://localhost/phpmyadmin](http://localhost/phpmyadmin)  
2. Kliknij **Nowa** i utwórz bazę danych o nazwie:  
   `udziekana`  
3. Będąc w tej bazie, kliknij zakładkę **Import**  
4. Wybierz plik `.sql` z folderu projektu i kliknij **Wykonaj**  

---

### 5. Konfiguracja połączenia z bazą (opcjonalnie)  
W pliku **`polaczenie.php`** znajdują się dane połączeniowe do bazy:

```php
$host = "localhost";
$user = "root";
$password = "";
$database = "udziekana";
```

Dla standardowej instalacji XAMPP nic nie musisz zmieniać.  
Jeśli masz inne hasło do MySQL, zaktualizuj je tutaj.

---

### 6. Uruchomienie strony  
Wejdź w przeglądarce na:  
[http://localhost/udziekana/login.php](http://localhost/udziekana/login.php)  

---

## ✅ Korzystanie  
- Zaloguj się jako istniejący klient lub zarejestruj nowego  
- Dodawaj produkty do koszyka i przeprowadzaj płatność  
- Panel pracownika umożliwia dodawanie produktów i przeglądanie historii  

---

## ✅ Uwagi  
- System nie wymaga kont użytkowników z hasłami — identyfikacja na podstawie danych klienta lub karty  
- Płatność jest symulowana — nie integruje się z realnymi systemami płatności  
- Projekt nie zawiera zaawansowanego systemu uprawnień — panel pracownika jest dostępny po kliknięciu linku  

---

## ✅ Autor  
Projekt edukacyjny przygotowany jako ćwiczenie z tworzenia aplikacji webowej z bazą danych w środowisku XAMPP.
