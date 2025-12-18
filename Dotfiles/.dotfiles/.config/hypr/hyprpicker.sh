#!/bin/bash

# Запускаем hyprpicker, получаем выбранный цвет (обычно выводит в формате #RRGGBB)
color=$(hyprpicker)

if [ -n "$color" ]; then
    notify-send "$color"
else
    notify-send "Hyprpicker" "No color"
fi
