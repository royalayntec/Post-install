#!/bin/bash

# Instala Zenity si no está instalado
sudo apt update && sudo apt upgrade -y
sudo apt install -y git aptitude synaptic curl gdebi synaptic make automake cmake autoconf 

if ! command -v zenity >/dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y zenity 
fi

# Función para mostrar el menú de selección
show_menu() {
  zenity --list --checklist --title="Selección de programas" --text="Selecciona los programas que deseas instalar:" \
    --column="Instalar" --column="Programa" --column="Descripción" \
    FALSE "agregar-usuario-sudo" "Agregar usuario al grupo sudo" \
    FALSE "Repositorio-nonfree" "Firmware no libre para Linux" \
    FALSE "instalador-flatpak" "Instalador de Flatpak" \
    FALSE "Compilación de software" "build-essential make automake cmake autoconf git" \
    FALSE "Compresores-archivos" "p7zip-full p7zip-rar rar unrar zip unzip unace, etc..." \
    FALSE "wine" "permite ejecutar aplicaciones de Windows" \
    FALSE "gparted" "Editor de particiones" \
    FALSE "htop" "Monitor de sistema interactivo" \
    FALSE "geany" "Editor de texto ligero" \
    FALSE "mousepad" "Editor de texto básico" \
    FALSE "gimp" "Editor de imágenes" \
    FALSE "inkscape" "Editor de gráficos vectoriales" \
    FALSE "filezilla" "Cliente FTP" \
    FALSE "transmission-gtk" "Cliente BitTorrent" \
    FALSE "Google Chrome" "Navegador web Chrome de Google" \
    FALSE "brave-browser" "Navegador web Brave" \
    FALSE "skype" "comunicaciones de texto, voz y vídeo" \
    FALSE "default-jdk" "Java Development Kit (JDK)" \
    FALSE "ffmpeg" "Conversor y manipulador de multimedia" \
    FALSE "vlc" "Reproductor multimedia" \
    FALSE "audacity" "Editor de audio" \
    FALSE "Codecs multimedia" "Codecs multimedia y librerías" \
    FALSE "obs-studio" "Software de grabación y transmisión en vivo" \
    FALSE "soundconverter" "Conversor de audio" \
    FALSE "kdenlive" "Editor de video" \
    FALSE "mpv" "Reproductor multimedia basado en MPlayer" \
    FALSE "vokoscreen" "Grabador de pantalla" \
    FALSE "steam" "Plataforma de juegos" \
    FALSE "Driver-Nvidia" "Controladores de gráficos Nvidia" \
    FALSE "Driver-AMD" "Controladores de gráficos AMD" \
    --separator="|" --width=600 --height=600
}

# Ejecuta el menú y guarda la selección en la variable "selection"
IFS='|' read -ra selection <<< "$(show_menu)"

# Instala los programas seleccionados
if [[ -n "$selection" ]]; then
  sudo apt update
  for program in "${selection[@]}"; do
    case $program in
      "Repositorio-nonfree")
        sudo sh -c 'echo "deb http://deb.debian.org/debian bookworm non-free non-free-firmware
        deb-src http://deb.debian.org/debian bookworm non-free non-free-firmware
        deb http://deb.debian.org/debian-security bookworm-security non-free non-free-firmware
        deb-src http://deb.debian.org/debian-security bookworm-security non-free non-free-firmware
        deb http://deb.debian.org/debian bookworm-updates non-free non-free-firmware
        deb-src http://deb.debian.org/debian bookworm-updates non-free non-free-firmware" > /etc/apt/sources.list.d/repositorios.list'
        sudo apt update
        sudo apt install -y firmware-linux-nonfree
        ;;
      "agregar-usuario-sudo")
        sudo echo "$USER ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers && sudo addgroup $USER sudo
        ;;
      "instalador-flatpak")
        sudo apt install -y flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        ;;
      "Compilación de software")
        sudo apt install -y build-essential make automake cmake autoconf git wget
        ;;
      "Compresores-archivos")
        sudo apt install -y p7zip-full p7zip-rar rar unrar zip unzip unace bzip2 arj lzip lzma gzip unar
        ;;
      "Google Chrome")
      	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
      	sudo dpkg -i google-chrome-stable_current_amd64.deb
      	sudo apt install -f -y
      	rm *.deb
      	;;
      "brave-browser")
        sudo apt install -y curl
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg  arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install -y brave-browser
        ;;
      "skype")
        wget https://go.skype.com/skypeforlinux-64.deb
        sudo apt install ./skypeforlinux-64.deb -y
        rm skypeforlinux-64.deb
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
        sudo apt install -y gstreamer1.0-libav
        ;;
      "Driver-Nvidia")
        sudo apt install -y nvidia-detect
        recommended_driver=$(sudo nvidia-detect | grep "recommended" -A1 | tail -n1 | awk '{print $NF}')
        if [[ -n "$recommended_driver" ]]; then
          sudo apt install -y "$recommended_driver"
        fi
        ;;
      "Driver-AMD")
        sudo apt install -y firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati
        ;;
      *)
        sudo apt install -y "$program"
        ;;
    esac
  done
fi
