#!/bin/bash

# Получаем текущую раскладку
layouts=$(hyprctl devices | grep "active keymap" | awk -F': ' '{print $2}')
layout=$(echo "$layouts" | grep -v "English (US)" | head -n 1)

if [ -z "$layout" ]; then
    layout="English (US)"
fi

case "$layout" in
    *Ukrainian*)
        code="УКР"
        ;;
    *Russian*)
        code="РУС"
        ;;
    *English*)
        code="ENG"
        ;;
    *)
        code="??"
        ;;
esac

# Показываем новое окно (не убивая старое)
yad --text="<span font='JetBrainsMono Nerd Bold 24' foreground='#ffffff'>$code</span>" \
    --no-buttons \
    --undecorated \
    --skip-taskbar \
    --on-top \
    --center \
    --borders=20 \
    --title="layout_osd" \
    --fixed \
    --justify=center \
    --align=center \
    --text-align=center \
    --geometry=300x50 \
    --window-icon=none &

# Сохраняем PID нового окна
NEW_YAD_PID=$!

# Дадим окну время открыться (чтобы не моргало)
sleep 0.1

# Теперь закрываем старое окно (если есть)
pkill -f "yad --text=.*layout_osd" --older 2>/dev/null

# Ждём немного и закрываем текущее окно
sleep 1
kill "$NEW_YAD_PID" 2>/dev/null
