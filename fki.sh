#!/bin/bash

# BASH menu script for Fresh Kali Installs
# https://github.com/samuelhogg/scripts
# by Samuel Hogg

red='\e[31m'
green='\e[32m'
orange='\e[33m'
blue='\e[34m'
clear='\e[0m'

function banner(){
	printf "$blue     
#################################
##                             ## 
##  888888888 88      a8P  88  ## 	 
##  88        88    .88'   88  ## 
##  88        88   88'     88  ##
##  88888     88 d88       88  ##
##  88'''     8888'88.     88  ##
##  88        88P   Y8b    88  ##
##  88        88     '88.  88  ##
##  88        88       Y8b 88  ##
##                             ##
################### by Samuel ###
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       FRESH KALI INSTALL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
}

banner

function WrongCommand() {
    echo "ddd"
    menu
}

function version_check() {
    echo ""
	uname -a && grep VERSION /etc/os-release
    echo -e "\n"
}

function update_upgrade() {
    echo ""
	sudo apt update && sudo apt -y full-upgrade
    echo -e "\n"
}

function keyboard_layout() {
	echo -ne "
	$(ColorBlue 'a)') Change to UK Keyboard Layout
	$(ColorBlue 'b)') Reconfigure Keyboard Configuartion
	$(ColorBlue 'c)') Change to UK Timezone
	$(ColorBlue 'd)') Reconfigure Timezone Configuartion
	$(ColorBlue 'e)') Install Kali Gnome Desktop
	$(ColorBlue 'x)') Exit Sub Menu
	$(ColorOrange 'Choose an option:') "
			read a
			case $a in
				a) setxkbmap gb ; menu ;;
				b) sudo dpkg-reconfigure keyboard-configuration ; menu ;;
				c) sudo timedatectl set-timezone Europe/London ; menu ;;
				d) sudo dpkg-reconfigure tzdata ; menu ;;
				e) sudo apt update && sudo apt install -y kali-desktop-gnome ; menu ;;
				x) menu ;;
				*) echo -e $red"Wrong option."$clear; WrongCommand ;;
			esac
}

function change_password() {
	echo -ne "
	$(ColorBlue 'a)') Change Current User Password
	$(ColorBlue 'b)') Change Root Password
	$(ColorBlue 'x)') Exit Sub Menu
	$(ColorOrange 'Choose an option:') "
			read a
			case $a in
				a) passwd ; menu ;;
				b) sudo passwd root ; menu ;;
				x) menu ;;
				*) echo -e $red"Wrong option."$clear; WrongCommand ;;
			esac
}

function ssh_keys() {
# https://kali.training/topic/configuring-services/
    echo ""
	echo "[+] Replacing default SSH keys..."
	#ls -la /etc/ssh
	sudo mkdir /etc/ssh/default_kali_keys
	sudo mv /etc/ssh/ssh_host_* /etc/ssh/default_kali_keys
	sudo dpkg-reconfigure openssh-server
	sudo md5sum /etc/ssh/default_kali_keys/ssh_host_*
	sudo md5sum /etc/ssh/ssh_host_*
	sudo systemctl restart ssh
    echo ""
}

function install_tools() {
	echo -ne "
	$(ColorBlue 'a)') ProtonVPN
	$(ColorBlue 'b)') Visual Studio Code
	$(ColorBlue 'c)') Atom.io
	$(ColorBlue 'd)') tmux
	$(ColorBlue 'x)') Exit Sub Menu
	$(ColorOrange 'Choose an option:') "
			read a
			case $a in
				a) wget "https://protonvpn.com/download/protonvpn-stable-release_1.0.0-1_all.deb" -O ~/Downloads/protonvpn.deb && sudo apt install ~/Downloads/protonvpn.deb && sudo apt update && sudo apt install protonvpn ; menu ;;
				b) curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o ~/Downloads/vscode.deb && sudo apt install ~/Downloads/vscode.deb ; menu ;;
				c) wget "https://atom.io/download/deb" -O ~/Downloads/atom.deb && sudo apt install ~/Downloads/atom.deb ; menu ;;
				d) sudo apt install tmux ; menu ;;
				x) menu ;;
				*) echo -e $red"Wrong option."$clear; WrongCommand ;;
			esac
}

function install_ctf_tools() {
	echo -ne "
	$(ColorBlue 'a)') RustScan
	$(ColorBlue 'b)') ffuf
	$(ColorBlue 'c)') ccc
	$(ColorBlue 'd)') ddd
	$(ColorBlue 'x)') Exit Sub Menu
	$(ColorOrange 'Choose an option:') "
			read a
			case $a in
				a) RustScan ; menu ;;
				b) sudo git clone https://github.com/ffuf/ffuf /opt/ffuf ; cd /opt/ffuf ; go get ; go build ; menu ;;
				c) wget "https://atom.io/download/deb" -O ~/Downloads/atom.deb && sudo apt install ~/Downloads/atom.deb ; menu ;;
				d) sudo apt install tmux ; menu ;;
				x) menu ;;
				*) echo -e $red"Wrong option."$clear; WrongCommand ;;
			esac
}

ColorGreen(){
	echo -ne $green$1$clear
}
ColorOrange(){
	echo -ne $orange$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

menu(){
echo -ne "
$(ColorGreen 'Fresh Kali Install Menu')\n
$(ColorBlue '1)') Check Version
$(ColorBlue '2)') Update & Upgrade
$(ColorBlue '3)') Change Keyboard Layout
$(ColorBlue '4)') Change Password
$(ColorBlue '5)') Replace default SSH keys
$(ColorBlue '6)') Install Tools
$(ColorBlue '7)') Install ctf Tools
$(ColorBlue '0)') Exit
$(ColorOrange 'Choose an option:') "
        read a
        case $a in
	        1) version_check ; menu ;;
	        2) update_upgrade ; menu ;;
	        3) keyboard_layout ; menu ;;
	        4) change_password ; menu ;;
	        5) ssh_keys ; menu ;;
		6) install_tools ; menu ;;
		7) install_ctf_tools ; menu ;;
		0) exit 0 ;;
		*) echo -e $red"Wrong option."$clear; WrongCommand ;;
        esac
}

# Call the menu function
menu
