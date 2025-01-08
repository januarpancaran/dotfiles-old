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
$AUR_HELPER -S base-devel bluez bluez-utils networkmanager hyprland foot nautilus polkit-gnome brightnessctl pipewire wireplumber waybar swaync hypridle hyprlock rofi-wayland swww wlogout qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xwaylandvideobridge grim slurp wl-clipboard htop trash-cli alsa-utils alsa-firmware pipewire-pulse pipewire-alsa blueberry xorg-xhost bat fastfetch eog network-manager-applet unzip unrar wget --needed --noconfirm

echo "Installing Fonts..."
$AUR_HELPER -S ttf-meslo-nerd ttf-jetbrains-mono-nerd ttf-space-mono-nerd otf-font-awesome ttf-material-symbols-variable-git noto-fonts-emoji noto-fonts-cjk terminus-font --noconfirm 

echo "Installing Applications..."
$AUR_HELPER -S auto-cpufreq timeshift-autosnap firefox visual-studio-code-bin neovim spotify-launcher obs-studio telegram-desktop mpv webcord --needed --noconfirm 

# Enabling Services
sudo systemctl enable --now NetworkManager bluetooth auto-cpufreq cronie
systemctl enable --user --now pipewire.socket pipewire.service foot.service

# Moving all the dotfiles
if [ ! -d "$HOME/.config" ]; then
        mkdir -p "$HOME/.config"
fi

cp -r ./Configs/* "$HOME/.config"

echo "if [ -z '$DISPLAY' ] && [ '$XDG_VTNR' == 1 ]; then" >> "$HOME/.bash_profile"
echo "exec Hyprland" >> "$HOME/.bash_profile"
echo "fi" >> "$HOME/.bash_profile"
