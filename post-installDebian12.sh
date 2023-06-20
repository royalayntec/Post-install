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
    FALSE "firmware-linux-nonfree" "Firmware no libre para Linux" \
    FALSE "agregar-usuario-sudo" "Agregar usuario al grupo sudo" \
    FALSE "instalador-flatpak" "Instalador de Flatpak" \
    FALSE "Compilación de software" "Herramientas de compilación y gestión." \
    FALSE "wine" "permite ejecutar aplicaciones de Windows" \
    FALSE "gparted" "Editor de particiones" \
    FALSE "htop" "Monitor de sistema interactivo" \
    FALSE "geany" "Editor de texto ligero" \
    FALSE "leafpad" "Editor de texto básico" \
    FALSE "gimp" "Editor de imágenes" \
    FALSE "inkscape" "Editor de gráficos vectoriales" \
    FALSE "filezilla" "Cliente FTP" \
    FALSE "transmission-gtk" "Cliente BitTorrent" \
    FALSE "brave-browser" "Navegador web Brave" \
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
    --separator="|" --width=600 --height=600
}

# Ejecuta el menú y guarda la selección en la variable "selection"
IFS='|' read -ra selection <<< "$(show_menu)"

# Instala los programas seleccionados
if [[ -n "$selection" ]]; then
  sudo apt update
  for program in "${selection[@]}"; do
    case $program in
      "firmware-linux-nonfree")
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
      *)
        sudo apt install -y "$program"
        ;;
    esac
  done
fi
