# dev utils
sudo pacman -S base-devel
uname -a
sudo pacman -S linux-headers

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome --noconfirm
yay -S spotify --noconfirm
yay -S lollypop --noconfirm
yay -S telegram-desktop --noconfirm
# font for telegram
yay -S ttf-opensans --noconfirm
yay -S discord --noconfirm
yay -S slack-desktop --noconfirm
yay -S gwe --noconfirm
yay -S cpu-x --noconfirm
yay -S qbittorrent --noconfirm
yay -S psensor --noconfirm
yay -S timeshift --noconfirm
yay -S teamviewer --noconfirm
yay -S visual-studio-code-bin --noconfirm
yay -S simplenote-electron-bin --noconfirm
yay -S foliate --noconfirm
yay -S nerd-fonts-fira-code --noconfirm
yay -S nvm --noconfirm
yay -S zsh --noconfirm
yay -S fd --noconfirm
yay -S jq --noconfirm
yay -S htop --noconfirm
yay -S papirus-icon-theme --noconfirm
yay -S vim --noconfirm
yay -S rustscan --noconfirm
yay -S ranger --noconfirm
yay -S thunderbird --noconfirm
yay -S krita --noconfirm
yay -S obs-studio --noconfirm
yay -S blender --noconfirm
yay -S 1password-bin --noconfirm
yay -S ulauncher --noconfirm
yay -S alacritty --noconfirm
yay -S lsd --noconfirm
yay -S diff-so-fancy --noconfirm
yay -S solaar --noconfirm

# Printer Epson
yay -S epson-inkjet-printer-escpr --noconfirm
yay -S epson-printer-utility --noconfirm

# Games Wine Deps https://github.com/lutris/docs/blob/master/WineDependencies.md
yay -S lutris --noconfirm
yay -S steam --noconfirm
yay -S mangohud --noconfirm
yay -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm

yay -S inav-configurator-bin --noconfirm
# Access to usb serial
sudo usermod -a -G uucp $USER
sudo usermod -a -G lock $USER

yay -S opentx-companion-bin --noconfirm
yay -S cura --noconfirm
yay -S inxi --noconfirm
yay -S neofetch --noconfirm
yay -S conky --noconfirm
yay -S simplescreenrecorder --noconfirm
yay -S ttf-ms-fonts --noconfirm

yay -S httpie --noconfirm
yay -S google-cloud-sdk --noconfirm
yay -S helm --noconfirm
yay -S aurpublish --noconfirm
yay -S celluloid --noconfirm

# Extrernal Brightness (linux-headers required)
yay -S ddcutil --noconfirm
yay -S ddcci-driver-linux-dkms --noconfirm

# SSH
yay -S openssh --noconfirm
sudo systemctl start sshd
sudo systemctl enable sshd

# Docker
yay -S docker-compose --noconfirm
sudo gpasswd -a $USER docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

# ocs-url - for open some themes and other
yay -S ocs-url --noconfirm
# AppImage integration to the system, analog appimaged
# yay -S appimagelauncher-git --noconfirm

#
# Settings system
#

# dotfiles
# cp -R dotfiles/.config/conky ~/.config/conky
# cp dotfiles/.gitignore ~
# cp dotfiles/.gitconfig ~
# cp dotfiles/.zshrc ~

# git
# git config --global user.name "Anton Palgunov"
# git config --global user.email "toxblh@gmail.com"

# Fast reconnection for bluetooth
# sudo sed -i 's/#FastConnectable = false/FastConnectable = true/g' /etc/bluetooth/main.conf

# DDC Utils
sudo modprobe i2c-dev
sudo cp $(pwd)/dotfiles/ddc/i2c-dev.conf /etc/modules-load.d/i2c-dev.conf
sudo cp $(pwd)/dotfiles/ddc/45-ddcutil-i2c.rules /etc/udev/rules.d/45-ddcutil-i2c.rules
sudo cp $(pwd)/dotfiles/ddc/99-ddcci.rules /etc/udev/rules.d/99-ddcci.rules
sudo cp $(pwd)/dotfiles/ddc/ddcci@.service /etc/systemd/system/ddcci@.service
sudo udevadm trigger
sudo groupadd ddc
sudo usermod -aG ddc $USER

# Keyboard Keychron K2/Apple
sudo cp $(pwd)/dotfiles/keychron/hid_apple.conf /etc/modprobe.d/hid_apple.conf
sudo mkinitcpio -P

# Gnome OneDark Pro Terminal
# dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < dotfiles/gnome-terminal/theme-profile.dconf

# NodeJS install
# echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
# source ~/.zshrc
# nvm install --lts

# Xbox controler
# TODO: Should be with sudo
echo 'options bluetooth disable_ertm=1' > /etc/modprobe.d/xbox_bt.conf
yay -S dkms bluez bluez-utils
yay -S xpadneo-dkms-git

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java

# LDAC audio
yay -S libldac pulseaudio-modules-bt-git
