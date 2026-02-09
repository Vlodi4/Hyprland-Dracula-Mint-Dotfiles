CHOICE=$(echo -e "Power Off\nReboot" | rofi -theme ~/.config/rofi/launchers/type-7/style-2.rasi -dmenu -p "   Power ")

case $CHOICE in
	"Power Off") poweroff ;;
	"Reboot") reboot ;;
esac
