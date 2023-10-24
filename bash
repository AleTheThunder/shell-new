#!/bin/bash

# Funktion zur Berechnung der Fibonacci-Folge
fibonacci() {
    local n=$1
    local a=0
    local b=1
    local result=0

    echo "Fibonacci-Folge bis zur $n-ten Zahl:"

    for ((i=0; i<n; i++)); do
        echo -n "$a "
        result=$((a + b))
        a=$b
        b=$result
    done
    echo
}

while true; do
    clear
    echo "Willkommen zum coolen Shell-Programm!"
    echo "1. Coole Nachricht anzeigen"
    echo "2. Zufälligen Witz erzählen"
    echo "3. Datum und Uhrzeit anzeigen"
    echo "4. Zeige kreatives ASCII-Art"
    echo "5. Zeige beeindruckende Tatsache"
    echo "6. Einen Namen rückwärts anzeigen"
    echo "7. Einfache Rechenoperationen"
    echo "8. Zufällige Zahl generieren"
    echo "9. Prüfe auf Palindrom"
    echo "10. Liste sortieren"
    echo "11. Fibonacci-Folge generieren"
    echo "12. Beenden"
    read -p "Bitte wählen Sie eine Option: " option

    case $option in
        1)
            echo "Das hier ist wirklich cool!"
            ;;
        2)
            jokes=("Warum hat der Mathematikbuch geweint? Weil es zu viele Probleme hatte!" "Was ist schwerer als eine Tonne, aber leicht wie eine Feder? Eine Tonne Federn!" "Warum hat der Tomate rot geworden? Weil es sich geschält hat!")
            random_index=$((RANDOM % ${#jokes[@]}))
            echo "${jokes[$random_index]}"
            ;;
        3)
            date +"Heute ist %A, der %d. %B %Y. Es ist %H:%M Uhr."
            ;;
        4)
            echo "  _   _      _ _         __  __ _ _"
            echo " | | | | ___| | | ___   |  \/  (_) |__  ___"
            echo " | |_| |/ _ \ | |/ _ \  | |\/| | | '_ \/ __|"
            echo " |  _  |  __/ | | (_) | | |  | | | |_) \__ \\"
            echo " |_| |_|\___|_|_|\___/  |_|  |_|_|_.__/|___/"
            ;;
        5)
            facts=("Bienen können Farben sehen!" "Der König der Löwen war der erste Disney-Film, der ohne menschliche Charaktere auskam." "In China gibt es eine Mauer aus Schokolade.")
            random_index=$((RANDOM % ${#facts[@]}))
            echo "${facts[$random_index]}"
            ;;
        6)
            read -p "Bitte geben Sie Ihren Namen ein: " name
            echo "Ihr Name rückwärts: $(echo $name | rev)"
            ;;
        7)
            read -p "Bitte geben Sie die erste Zahl ein: " num1
            read -p "Bitte geben Sie die zweite Zahl ein: " num2
            echo "Ergebnisse:"
            echo "Addition: $(($num1 + $num2))"
            echo "Subtraktion: $(($num1 - $num2))"
            echo "Multiplikation: $(($num1 * $num2))"
            echo "Division: $(($num1 / $num2))"
            ;;
        8)
            echo "Zufällige Zahl: $((RANDOM))"
            ;;
        9)
            read -p "Bitte geben Sie einen Text ein: " text
            reverse=$(echo $text | rev)
            if [ "$text" == "$reverse" ]; then
                echo "$text ist ein Palindrom!"
            else
                echo "$text ist kein Palindrom."
            fi
            ;;
        10)
            read -p "Bitte geben Sie eine Liste von Elementen (getrennt durch Leerzeichen) ein: " elements
            sorted_elements=$(echo $elements | tr ' ' '\n' | sort)
            echo "Sortierte Liste: $sorted_elements"
            ;;
        11)
            read -p "Bitte geben Sie die Anzahl der Fibonacci-Zahlen an, die generiert werden sollen: " fib_count
            fibonacci $fib_count
            ;;
        12)
            echo "Auf Wiedersehen!"
            exit 0
            ;;
        *)
            echo "Ungültige Auswahl. Bitte versuchen Sie es erneut."
            ;;
    esac

    read -p "Drücken Sie eine beliebige Taste, um fortzufahren..."
done
