# dev utils
sudo pacman -S base-devel
uname -a
sudo pacman -S linux-headers

# install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome --noconfirm
yay -S geary --noconfirm
yay -S pantheon-calendar --noconfirm
yay -S spotify --noconfirm
yay -S lollypop --noconfirm
yay -S telegram-desktop --noconfirm
# font for telegram
yay -S ttf-opensans --noconfirm
yay -S discord --noconfirm
yay -S lutris --noconfirm
yay -S steam --noconfirm
yay -S gwe --noconfirm
yay -S cpu-x --noconfirm
yay -S qbittorrent --noconfirm
yay -S psensor --noconfirm
yay -S timeshift --noconfirm
yay -S teamviewer --noconfirm
yay -S visual-studio-code-bin --noconfirm
yay -S simplenote-electron-bin --noconfirm
yay -S vlc --noconfirm
yay -S foliate --noconfirm
yay -S libreoffice-still --noconfirm
yay -S nerd-fonts-fira-code --noconfirm
yay -S nvm --noconfirm
yay -S zsh --noconfirm

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
yay -S appimagelauncher-git --noconfirm

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
sudo cp dotfiles/ddc/99-ddcci.rules /etc/udev/rules.d/99-ddcci.rules
sudo cp dotfiles/ddc/ddcci@.service /etc/systemd/system/ddcci@.service
sudo udevadm trigger
sudo groupadd ddc
sudo usermod -aG ddc $USER

# Keyboard Keychron K2/Apple
sudo cp dotfiles/keychron/hid_apple.conf /etc/modprobe.d/hid_apple.conf
mkinitcpio

# Gnome OneDark Pro Terminal
dconf load /org/gnome/terminal/legacy/profiles:/:1430663d-083b-4737-a7f5-8378cc8226d1/ < dotfiles/gnome-terminal/theme-profile.dconf

# NodeJS install
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source ~/.zshrc
nvm install --lts
