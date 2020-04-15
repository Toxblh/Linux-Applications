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

