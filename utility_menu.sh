#!/bin/bash

while true
do
    echo ""
    echo "============================="
    echo "     🧰 Utility Menu"
    echo "============================="
    echo "1. Calculator"
    echo "2. Count Files in Current Directory"
    echo "3. Greet Multiple People"
    echo "4. Temperature Converter (C → F)"
    echo "5. Exit"
    echo "============================="
    read -p "Choose an option (1–5): " choice
    echo ""

    case $choice in
        1)
            echo "🧮 Calculator"
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            read -p "Enter operator (+, -, *): " op
            case $op in
                +)
                    result=$((num1 + num2))
                    ;;
                -)
                    result=$((num1 - num2))
                    ;;
                \*)
                    result=$((num1 * num2))
                    ;;
                *)
                    echo "Invalid operator!"
                    continue
                    ;;
            esac
            echo "Result: $num1 $op $num2 = $result"
            ;;
        2)
            echo "📂 Counting files..."
            count=$(find . -maxdepth 1 -type f | wc -l)
            echo "There are $count files in the current directory."
            ;;
        3)
            echo "👋 Greeting names (type 'done' to stop)"
            while true
            do
                read -p "Enter a name: " name
                if [ "$name" == "done" ]; then
                    echo "All greetings done!"
                    break
                fi
                echo "Hello, $name!"
            done
            ;;
        4)
            echo "🌡 Temperature Converter"
            read -p "Enter temperature in Celsius: " celsius
            fahrenheit=$(echo "scale=2; $celsius * 9 / 5 + 32" | bc)
            echo "$celsius°C = $fahrenheit°F"
            ;;
        5)
            echo "👋 Exiting... Have a nice day!"
            break
            ;;
        *)
            echo "❌ Invalid choice! Please choose 1–5."
            ;;
    esac
done
