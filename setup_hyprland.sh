#!/bin/bash

# Install AUR
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si

# Install Programs
sudo pacman -Sy wayland xorg xorg-server xorg-xwayland hyprland xdg-desktop-portal-hyprland kitty alacritty neovim firefox pavucontrol pamixer nemo grim slurp swappy rofi rofi-calc rofi-emoji waybar mako ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji otf-font-awesome file-roller hyprpicker hypridle hyprlock btop calcurse telegram-desktop discord wlsunset geoclue2 python3 swayimg swaybg nodejs npm eza fish fuse2 wl-clipboard mc udiskie vlc mpv unzip flatpak fastfetch zenity gsimplecal flameshot steam qbittorrent blender mission-center chromium wine winetricks yad qt5ct qt5 qt5-graphicaleffects qt5-quickcontrols2 qt5-svg qt6ct kolourpaint sddm playerctl calf lsp-plugins-lv2 zam-plugins-lv2 mda.lv2 yelp easyeffects xed stow --noconfirm

yay -S bibata-cursor-theme-bin
yay -S vscodium-bin
yay -S viber
yay -S elyprismlauncher-bin
yay -S swayosd
yay -S adwsteamgtk
yay -S pwvucontrol

# Creating some directories
mkdir -p ~/.config
mkdir -p ~/.config/VSCodium/User
mkdir -p ~/.config/fish
mkdir -p ~/.config/BetterDiscord

mkdir -p ~/.themes
mkdir -p ~/.mozilla/firefox/n0eij4j3.default-release
mkdir -p ~/.vscode-oss/extensions


# Copying Configuration Files SDDM
sudo cp -rf ~/Hyprland-Dracula-Mint/Dotfiles/SDDM/sugar-dark /usr/share/sddm/themes/
sudo cp ~/Hyprland-Dracula-Mint/Dotfiles/SDDM/sddm.conf /etc/

# Copying Dotfiles Directories
sudo cp -rf ~/Hyprland-Dracula-Mint/Dotfiles/.dotfiles

# Chmod
chmod +x ~/.dotfiles/.config/rofi/network-manager.sh
chmod +x ~/.dotfiles/.config/rofi/rofi-power-menu.sh
chmod +x ~/.dotfiles/.config/hypr/show_layout_popup.sh
chmod +x ~/.dotfiles/.config/hypr/hyprpicker.sh

# Stow
stow -d ~/.dotfiles/ .

# Other Settings
gsettings set org.gnome.desktop.interface gtk-theme Nordic-darker-standard-buttons
gsettings set org.gnome.desktop.interface font-name 'JetBrainsMono Nerd Font 12'
gsettings set org.gnome.desktop.wm.preferences button-layout :
gsettings set org.cinnamon.desktop.default-applications.terminal exec "alacritty"
xdg-settings set default-web-browser firefox.desktop
hyprctl setcursor Bibata-Modern-Classic 21
xrandr --output DP-1 --primary