#!/bin/bash

# Instala Zenity si no está instalado
if ! command -v zenity >/dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y zenity gdebi synaptic make automake cmake autoconf git aptitude synaptic curl
fi

# Función para mostrar el menú de selección
show_menu() {
  zenity --list --checklist --title="Selección de programas" --text="Selecciona los programas que deseas instalar:" \
    --column="Instalar" --column="Programa" --column="Descripción" \
    FALSE "Fuentes y codecs" "instalará algunos codecs y fuentes" \
    FALSE "Impresoras" "Instalar driver de multiples impresoras" \
    FALSE "instalador-flatpak" "Instalador de Flatpak" \
    FALSE "Compilación de software" "Herramientas de compilación y gestión." \
    FALSE "Wine" "permite ejecutar aplicaciones de Windows" \
    FALSE "Particiones" "Editores de particiones" \
    FALSE "htop" "Monitor de sistema interactivo" \
    FALSE "geany" "Editor de texto ligero" \
    FALSE "leafpad" "Editor de texto básico" \
    FALSE "gimp" "Editor de imágenes" \
    FALSE "inkscape" "Editor de gráficos vectoriales" \
    FALSE "Photoshop" "Editor de imágenes" \
    FALSE "Ilustrator" "Editor de gráficos vectoriales" \
    FALSE "filezilla" "Cliente FTP" \
    FALSE "transmission-gtk" "Cliente BitTorrent" \
    FALSE "Gnome Boxes" "acceder a sistemas remotos o virtuales" \
    FALSE "Google Chrome" "Navegador web Chrome de Google" \
    FALSE "brave-browser" "Navegador web Brave" \
    FALSE "default-jdk" "Java Development Kit (JDK)" \
    FALSE "ffmpeg" "Conversor y manipulador de multimedia" \
    FALSE "vlc" "Reproductor multimedia" \
    FALSE "audacity" "Editor de audio" \
    FALSE "Codecs multimedia" "Codecs multimedia y librerías" \
    FALSE "Obs Studio" "Software de grabación y transmisión en vivo" \
    FALSE "soundconverter" "Conversor de audio" \
    FALSE "kdenlive" "Editor de video" \
    FALSE "mpv" "Reproductor multimedia basado en MPlayer" \
    FALSE "vokoscreen" "Grabador de pantalla" \
    FALSE "steam" "Plataforma de juegos" \
    --separator="|" --width=600 --height=600
}

# Ejecuta el menú y guarda la selección en la variable "selection"
IFS='|' read -ra selection <<< "$(show_menu)"

# Instala los programas seleccionados
if [[ -n "$selection" ]]; then
  sudo apt update
  for program in "${selection[@]}"; do
    case $program in
      "Fuentes y codecs")
        sudo apt install -y ubuntu-restricted-extras libavcodec-extra curl ttf-mscorefonts-installer mtp-tools ipheth-utils ideviceinstaller ifuse
        ;;
      "Impresoras")
        sudo apt -y install printer-driver-all
        ;;
      "instalador-flatpak")
        sudo apt install -y flatpak
        sudo apt install -y gnome-software-plugin-flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        ;;
      "Compilación de software")
      	sudo apt install -y build-essential make automake cmake autoconf git wget
      	;;
      "steam")
      	wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
	sudo dpkg --add-architecture i386
	sudo apt install -y libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 python-apt libgl1-nvidia-glx
	sudo apt update
	sudo dpkg -i steam.deb
	rm steam.deb
	;;
      "Codecs multimedia")
      	sudo apt install -y w64codecs libdvdcss2 gstreamer1.0-libav
      	;;
      "Particiones")
      	sudo apt install -y gparted exfat-fuse hfsplus hfsutils ntfs-3g
      	;;
      "Wine")
      	sudo dpkg --add-architecture i386 
      	sudo mkdir -pm755 /etc/apt/keyrings
		sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
		sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
		sudo apt update
		sudo apt install --install-recommends winehq-stable
      	;;
      "Gnome Boxes")
      	sudo apt install -y gnome-boxes qemu-kvm libvirt0 virt-manager bridge-utils
      	;;
      "Google Chrome")
      	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      	sudo dpkg -i google-chrome-stable_current_amd64.deb
      	sudo apt install -f -y
      	rm *.deb
      	;;
      "kdenlive")
      	sudo apt install -y kdenlive mediainfo
      	;;
      "Obs Studio")
      	sudo add-apt-repository ppa:obsproject/obs-studio
		sudo apt update
		sudo apt install -y obs-studio
      	;;
      "Photoshop")
      	cd /tmp/
      	git clone https://gitlab.com/csmarckitus1/photoshop.git
      	cd photoshop
		make
		./Photoshop2020
      	;;
      "Ilustrator")
		cd /tmp/
      	wget https://github.com/LinSoftWin/Illustrator-CC-2021-Linux/releases/download/1.0.0/install-illustrator-2021.sh
      	chmod +x install-illustrator-2021.sh
		sh install-illustrator-2021.sh
      	;;
      *)
        sudo apt install -y "$program"
        ;;
    esac
  done
fi

