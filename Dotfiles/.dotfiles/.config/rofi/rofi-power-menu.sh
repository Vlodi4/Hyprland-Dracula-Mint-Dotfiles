CHOICE=$(echo -e "Power Off\nReboot" | rofi -theme ~/.config/rofi/launchers/type-2/style-1-power.rasi -dmenu -p "   Power ")

case $CHOICE in
	"Power Off") poweroff ;;
	"Reboot") reboot ;;
esac
