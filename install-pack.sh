# dev utils
sudo pacman -S base-devel

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome
yay -S geary
yay -S spotify
yay -S lollypop
yay -S telegram-desktop
# font for telegram
yay -S ttf-opensans
yay -S discord
yay -S lutris
yay -S steam
yay -S gwe
yay -S cpu-x
yay -S qbittorrent
yay -S psensor
yay -S timeshift
yay -S teamviewer
yay -S visual-studio-code-bin
yay -S simplenote-electron-bin
yay -S vlc
yay -S foliate
yay -S libreoffice-still
yay -S nerd-fonts-fira-code
yay -S nvm
yay -S zsh

yay -S inav-configurator-bin
# Access to usb serial
sudo usermod -a -G uucp $USER
sudo usermod -a -G lock $USER

yay -S opentx-companion-bin
yay -S cura
yay -S inxi
yay -S neofetch
yay -S conky
yay -S simplescreenrecorder
yay -S ttf-ms-fonts

# SSH
yay -S openssh
sudo systemctl start sshd
sudo systemctl enable sshd

# Docker
yay -S docker-compose
sudo gpasswd -a $USER docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

# ocs-url - for open some themes and other
yay -S ocs-url
# AppImage integration to the system, analog appimaged
yay -S appimagelauncher-git

#
# Settings system
#

# dotfiles
cp -R dotfiles/.config/conky ~/.config/conky
cp dotfiles/.gitignore ~
cp dotfiles/.gitconfig ~
cp dotfiles/.zshrc ~

# git
git config --global user.name "Anton Palgunov"
git config --global user.email "toxblh@gmail.com"

# Fast reconnection for bluetooth
sudo sed -i 's/#FastConnectable = false/FastConnectable = true/g' /etc/bluetooth/main.conf

# DDC Utils
sudo modprobe i2c-dev
sudo cp dotfiles/ddc/i2c-dev.conf /etc/modules-load.d/i2c-dev.conf
sudo cp dotfiles/ddc/45-ddcutil-i2c.rules /etc/udev/rules.d/45-ddcutil-i2c.rules
sudo udevadm trigger
sudo groupadd ddc
sudo usermod -aG ddc $USER

# Gnome OneDark Pro Terminal
dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < dotfiles/gnome-terminal/theme-profile.dconf

# NodeJS install
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source ~/.zshrc
nvm install --lts
