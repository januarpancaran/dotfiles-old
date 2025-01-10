#!/bin/sh

AUR_HELPER=""
if [ -f /usr/bin/yay ]; then
        AUR_HELPER="yay"
elif [ -f /usr/bin/paru ]; then
        AUR_HELPER="paru"
else 
        echo "No AUR Helper installed. Installing yay"
        sudo pacman -S base-devel git --needed
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
        
        echo "yay installed!"
        AUR_HELPER="yay"
fi

echo "Installing Packages..."
$AUR_HELPER -S base-devel bluez bluez-utils networkmanager hyprland kitty polkit-gnome brightnessctl pipewire wireplumber waybar swaync hypridle hyprlock rofi-wayland swww wlogout qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xwaylandvideobridge grim slurp wl-clipboard htop trash-cli alsa-utils alsa-firmware pipewire-pulse pipewire-alsa blueberry xorg-xhost bat fastfetch eog network-manager-applet unzip unrar wget openssh xdg-desktop-portal libnotify zoxide playerctl gruvbox-gtk-theme-git fzf ripgrep --needed pavucontrol --noconfirm

echo "Installing Fonts..."
$AUR_HELPER -S ttf-meslo-nerd ttf-jetbrains-mono-nerd ttf-space-mono-nerd otf-font-awesome ttf-material-symbols-variable-git noto-fonts-emoji noto-fonts-cjk terminus-font --noconfirm 

echo "Installing Applications..."
$AUR_HELPER -S auto-cpufreq timeshift-autosnap firefox neovim spotify-launcher obs-studio telegram-desktop mpv webcord --needed --noconfirm 

# Enabling Services
sudo systemctl enable --now NetworkManager bluetooth auto-cpufreq cronie
systemctl enable --user --now pipewire.socket pipewire.service 

# Moving all the dotfiles
if [ ! -d "$HOME/.config" ]; then
        mkdir -p "$HOME/.config"
fi

SRC="./Configs/"
DESTINATION="$HOME/.config"

for folder in "$SRC"*; do
        base_folder=$(basename "$folder")
        destination_folder="$DESTINATION/$base_folder"

        for item in "$folder"*; do
                item_name=$(basename "$item")
                destination_item="$destination_folder/$item_name"

                if [ -f "$destination_item" ]; then
                        mv "$destination_item" "$destination_item.bak"
                fi

                cp -r "$item" "$destination_folder"
        done
done

GRUVBOX_DIR="/usr/share/themes/Gruvbox-Dark"
if [ -d "$GRUVBOX_DIR" ]; then
	mkdir -p "$HOME/gtk-4.0"
	ln -s "$GRUVBOX_DIR/gtk-4.0/assets" "$HOME/gtk-4.0/assets"
	ln -s "$GRUVBOX_DIR/gtk-4.0/gtk.css" "$HOME/gtk-4.0/gtk.css"
	ln -s "$GRUVBOX_DIR/gtk-4.0/gtk-dark.css" "$HOME/gtk-4.0/gtk-dark.css"
else
	echo "Gruvbox theme not installed in your system"
fi
