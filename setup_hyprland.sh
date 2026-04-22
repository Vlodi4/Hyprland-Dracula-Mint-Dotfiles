#!/bin/bash

# Install AUR
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si

# Install Programs
sudo pacman -Sy wayland xorg xorg-server xorg-xwayland hyprland xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk kitty alacritty neovim firefox pavucontrol pamixer nemo grim slurp swappy rofi rofi-calc rofi-emoji waybar mako ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-firacode-nerd noto-fonts-emoji otf-font-awesome file-roller hyprpicker hypridle hyprlock btop calcurse telegram-desktop discord wlsunset geoclue2 python3 swayimg swaybg nodejs npm eza fish fuse2 wl-clipboard mc udiskie vlc mpv unzip flatpak fastfetch zenity gsimplecal flameshot steam qbittorrent blender mission-center chromium wine winetricks yad qt5ct qt5 qt5-graphicaleffects qt5-quickcontrols2 qt5-svg qt6ct kolourpaint sddm playerctl xed stow vivaldi hyprpolkitagent krita torbrowser-launcher gzip unrar bzip2 xz 7zip audacity kdiskmark gamescope mangohud qemu-full obsidian --noconfirm

yay -S swayosd bibata-cursor-theme-bin pwvucontrol vscodium-bin elyprismlauncher-bin viber adwsteamgtk betterdiscordctl zoom

flatpak install flathub com.obsproject.Studio com.github.wwmm.easyeffects

flatpak override --user --filesystem=~/.themes
flatpak override --user --filesystem=~/.icons
flatpak override --user --filesystem=xdg-config/gtk-3.0:ro
flatpak override --user --filesystem=xdg-config/gtk-4.0:ro

# Creating some directories
mkdir -p ~/.config
mkdir -p ~/.config/VSCodium/User
mkdir -p ~/.config/fish
mkdir -p ~/.config/BetterDiscord
mkdir -p ~/.config/micro
mkdir -p ~/.config/nvim

mkdir -p ~/.themes

mkdir -p ~/.vscode-oss/extensions

mkdir -p ~/.mozilla/firefox/n0eij4j3.default-release
mkdir -p ~/.config/vivaldi

mkdir -p ~/.local/share/ElyPrismLauncher/themes

# Copying Configuration Files SDDM
sudo cp -rf ~/Hyprland-Dracula-Mint-Dotfiles/Dotfiles/SDDM/sugar-dark /usr/share/sddm/themes/
sudo cp ~/Hyprland-Dracula-Mint-Dotfiles/Dotfiles/SDDM/sddm.conf /etc/

# Copying Dotfiles Directories
cp -rf ~/Hyprland-Dracula-Mint-Dotfiles/Dotfiles/.dotfiles ~/

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
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

systemctl --user enable hyprpolkitagent.service
xdg-mime default firefox.desktop x-scheme-handler/https
xdg-mime default firefox.desktop text/html
xrandr --output DP-1 --primary
