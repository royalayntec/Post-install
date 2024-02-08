#!/bin/bash

# Instala Zenity si no está instalado y paquetes basicos
if ! command -v zenity >/dev/null 2>&1; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y zenity gdebi synaptic make automake cmake autoconf git aptitude synaptic curl
fi


# Función para mostrar el menú de selección de secciones
show_section_menu() {
  zenity --list --checklist --title="Ubuntu 24.04" --text="Selecciona los programas que deseas instalar por sección:" \
    --column="Marcar" --column="Sección" \
    FALSE "🛠️ Accesorios" \
    FALSE "🎨 Graficos" \
    FALSE "🌐 Internet" \
    FALSE "🎬 Multimedia" \
    FALSE "🎮 Juegos" \
    FALSE "📄 Oficina" \
    FALSE "🖥️ Escritorios" \
    --separator="|" --width=400 --height=300
}

# Función para mostrar el menú de selección de programas en una sección específica
show_program_menu() {
  local section=$1
  case $section in
    "🛠️ Accesorios")
      zenity --list --checklist --title="🛠️ Accesorios" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        TRUE "Fuentes y codecs" "Instalará algunos codecs y fuentes"\
        FALSE "Impresoras" "Instalar driver de multiples impresoras"\
        FALSE "instalador-flatpak" "Instalador para paquetes Flatpak"\
        TRUE "Compilación de software" "Herramientas de compilación y gestión."\
        TRUE "Compresores" "Basico para comprimir o Descomprimir paquetes"\
        FALSE "PeaZip - flatpak" "Herramienta de compresión de archivos"\
        FALSE "Wine" "permite ejecutar aplicaciones de Windows"\
        TRUE "GParted y más" "Múltiples herramientas para el disco duro"\
        FALSE "BalenaEtcher" "Crea una USB o SD booteable"\
        FALSE "htop" "Monitor de sistema interactivo"\
        FALSE "Mission Center - flatpak" "Supervise el uso de CPU, memoria y GPU"\
        FALSE "CPU-X - flatpak" "Visualiza la información sobre CPU y más"\
        FALSE "Warehouse - flatpak" "Administra los Flatpaks instalados"\
        FALSE "BleachBit" "Libera rápidamente espacio en disco"\
        FALSE "Fondo - flatpak" "Cambia los fondos de pantalla"\
        FALSE "Geany" "Editor de texto ligero"\
        FALSE "Atom - flatpak" "Editor de texto moderno, accesible"\
        FALSE "Sublime Text - flatpak" "Editor de texto y editor de código fuente"\
        --separator="|" --width=600 --height=520
      ;;
    "🎨 Graficos")
      zenity --list --checklist --title="🎨 Graficos" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        TRUE "Gimp" "Editor de imágenes"\
        FALSE "inkscape" "Editor de gráficos vectoriales"\
        FALSE "Synfig" "Editor de gráficos vectoriales de animación"\
        FALSE "Blender" "programa de modelado, renderizado, la animación en 3D"\
        FALSE "Photoshop" "Editor de imágenes"\
        FALSE "Illustrator" "Editor de gráficos vectoriales"\
        FALSE "LibreSprite - flatpak" "Crea animaciones 2D para videojuegos"\
        FALSE "Pixelorama - flatpak" "Editor de sprites 2D gratuito y de código abierto"\
        FALSE "Krita - flatpak" "Estudio de arte digital completo para diseñar y pintar"\
        FALSE "darktable - flatpak" "Programa de procesamiento fotográfico en formato raw"\
        --separator="|" --width=600 --height=350
      ;;
    "🌐 Internet")
      zenity --list --checklist --title="🌐 Internet" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        TRUE "Google Chrome" "Navegador web Chrome de Google"\
        FALSE "Brave-browser" "Navegador web Brave"\
        FALSE "Vivaldi - flatpak" "Navegador web potente, personal y privado"\
        FALSE "Microsoft Edge - flatpak" "Navegador web desarrollado por Microsoft"\
        FALSE "Opera - flatpak" "Navegador web rápido, seguro y fácil de usar"\
        FALSE "Firefox - flatpak" "Navegador web gratuito respaldado por Mozilla"\
        FALSE "LibreWolf - flatpak" "Navegador web y un fork de Firefox"\
        FALSE "Tor Browser Launcher - flatpak" "Navegador web Tor"\
        FALSE "Midori Web Browser - flatpak" "Navegador web ligero"\
        FALSE "WhatsApp Desktop - flatpak" "Cliente no oficial de WhatsApp Web Desktop"\
        FALSE "Telegram Desktop - flatpak" "Plataforma de mensajería y VOIP"\
        FALSE "Signal Desktop - flatpak" "Aplicación gratuita de mensajería y llamadas"\
        FALSE "teams-for-linux - flatpak" "Cliente no oficial de Microsoft Teams"\
        FALSE "Discord - flatpak" "Servicio de mensajería y chat de voz VolP"\
        FALSE "JDownloader - flatpak" "Gestor de descargas"\
        --separator="|" --width=600 --height=460       
      ;;
    "🎬 Multimedia")
      zenity --list --checklist --title="🎬 Multimedia" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        TRUE "vlc" "Reproductor multimedia"\
        FALSE "Spotify" "Servicio de música digital"\
        FALSE "Audacity" "Editor de audio"\
        TRUE "Codecs multimedia" "Codecs multimedia y librerías"\
        FALSE "Obs Studio" "Software de grabación y transmisión en vivo"\
        FALSE "Soundconverter" "Conversor de audio"\
        FALSE "Kdenlive" "Editor de video"\
        FALSE "Kodi" "Reproduce vídeos, música, podcasts y otros archivos"\
        FALSE "Video Downloader - flatpak" "Descargue videos de sitios web"\
        FALSE "FreeTube - flatpak" "Reproductor de YouTube de escritorio"\
        FALSE "HandBrake - flatpak" "Herramienta para convertir vídeos"\
        FALSE "Stremio - flatpak" "Servicio de streaming para ver películas, series y tv"\
        FALSE "Plex - flatpak" "Convertir tu ordenador en un centro multimedia"\
        FALSE "Shortwave - flatpak" "Reproductor de radio por Internet"\
        FALSE "Bitwig Studio - flatpak" "Estudio de audio digital (DAW)"\
        FALSE "Mixxx DJ - flatpak" "Software de DJ gratuito"\
        FALSE "Flameshot - flatpak" "Captura de pantalla potente y fácil"\
        --separator="|" --width=600 --height=500
      ;;
    "🎮 Juegos")
      zenity --list --checklist --title="🎮 Juegos" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        FALSE "steam" "Plataforma de juegos"\
        FALSE "Lutris" "Acceder a tu biblioteca de Steam, Epic Games Store y GOG"\
        FALSE "Minecraft - flatpak"  "videojuego de construcción de tipo mundo abierto"\
        FALSE "Dolphin" "Emulador para GameCube y Wii"\
        FALSE "Citra" "Emulador de 3DS"\
        FALSE "Cemu" "Emulador para WiiU"\
        FALSE "yuzu - flatpak" "Emulador de nintendo switch"\
        FALSE "Ryujinx - flatpak" "Emulador de nintendo switch"\
        FALSE "DuckStation - flatpak" "Emulador de Playstation"\
        FALSE "PPSSPP - flatpak" "Emulador de PSP"\
        FALSE "PCSX2 - flatpak" "Emulador de PS2"\
        FALSE "RetroArch - flatpak" "Plataforma multiplataforma para emuladores"\
        FALSE "VICE - flatpak" "Emulador de computadoras Commodore's 8-bit"\
        FALSE "Amiberry - flatpak" "Emulador de computadoras Amiga"\
        FALSE "DOSBox-X - flatpak" "Emulador de computadoras IBM PC y DOS"\
        FALSE "Pack Juegos Retro" "Plataforma de juegos"\
        --separator="|" --width=600 --height=500
      ;;
    "📄 Oficina")
      zenity --list --checklist --title="📄 Oficina" --text="Selecciona los programas que deseas instalar:"\
        --column="Marcar" --column="Programa" --column="Descripción"\
        FALSE "LibreOffice" "Alternativa de Microsoft Office"\
        FALSE "WPS Office" "Las mejores alternativas para Microsoft Office"\
        FALSE "ONLYOFFICE Desktop - flatpak" "Edite documentos, hojas de cálculo y más"\
        FALSE "Calligra" "Otra suite de ofimática"\
        FALSE "Dropbox" "Servicio de alojamiento de archivo en la nube"\
        FALSE "MEGASync" "Servicio de alojamiento de archivo en la nube"\
        FALSE "Insync" "Gestiona servicios en OneDrive, Google Drive y Dropbox"\
        FALSE "calibre - flatpak" "Herramienta de gestión de libros electrónicos"\
        FALSE "Foliate - flatpak" "Aplicación de lectura de libros electrónicos"\
        FALSE "Adobe Reader - flatpak" "Lector de PDF gratuito con Adobe"\
        FALSE "Master PDF Editor - flatpak" "Ver, crear, modificar, firmar, escanear PDF"\
        FALSE "FreeCAD - flatpak" "Modelador 3D paramétrico de código abierto"\
        FALSE "UltiMaker Cura - flatpak" "Aplicación diseñada para impresoras 3D"\
        FALSE "KiCad - flatpak" "Software para diseño electrónico"\
        FALSE "Fritzing - flatpak" "Aplicación de automatización de diseño electrónico"\
        FALSE "Arduino IDE - flatpak" "Programa para escribir y cargar programas en placas"\
        FALSE "DL: language lessons - flatpak" "Cliente para escritorio de Duolingo"\
        FALSE "GnuCash - flatpak" "Administre sus finanzas, cuentas e inversiones"\
        --separator="|" --width=600 --height=550
      ;;
	"🖥️ Escritorios")
	  zenity --list --checklist --title="🖥️ Escritorios" --text="Selecciona los programas que deseas instalar:"\
		--column="Marcar" --column="Programa" --column="Descripción"\
		FALSE "Unity" "Escritorio Unity"\
		FALSE "Gnome" "Escritorio Gnome"\
		FALSE "Cinnamon" "Escritorio Cinnamon"\
		FALSE "Budgie" "Escritorio Budgie"\
		FALSE "KDE Plasma" "Escritorio Kubuntu"\
		FALSE "KDE Full" "Paquete completo de KDE"\
		FALSE "KDE Standard" "KDE estándar incluye el escritorio"\
		FALSE "KDE Plasma Desktop" "Paquete mínimo con escritorio y aplicaciones"\
		FALSE "ubuntu-mate" "Escritorio ubuntu-mate"\
		FALSE "Xubuntu" "Escritorio Xubuntu"\
		FALSE "XFCE 4" "Escritorio XFCE4"\
		FALSE "Lubuntu" "Escritorio Lubuntu"\
		FALSE "LXQt" "Escritorio LXQt"\
		FALSE "LXDE" "Escritorio LXDE"\
		--separator="|" --width=600 --height=440
	  ;;
  esac
}

# Mostrar el menú de selección de secciones
selection=$(show_section_menu)
IFS='|' read -ra selected_sections <<< "$selection"

# Instala los programas seleccionados
if [[ -n "$selection" ]]; then
  sudo apt update
  for section in "${selected_sections[@]}"; do
    case $section in
      "🛠️ Accesorios" | "🎨 Graficos" | "🎬 Multimedia" | "🌐 Internet" | "🎮 Juegos" | "📄 Oficina" | "🖥️ Escritorios")
        programs=$(show_program_menu "$section")
        IFS='|' read -ra selected_programs <<< "$programs"
        for program in "${selected_programs[@]}"; do
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
            "Compresores")
              sudo apt install -y p7zip-full p7zip-rar rar unrar zip unzip unace bzip2 arj lzip lzma gzip unar
              ;;
            "PeaZip - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.github.peazip.PeaZip
              ;;
            "Wine")
              sudo dpkg --add-architecture i386 
              sudo mkdir -pm755 /etc/apt/keyrings
              sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
              sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
              sudo apt update
              sudo apt install -y --install-recommends winehq-stable
              ;;
            "GParted y más")
              sudo apt install -y gparted exfat-fuse hfsplus hfsutils ntfs-3g
              ;;
            "BalenaEtcher")
              cd /tmp/
              wget https://github.com/balena-io/etcher/releases/download/v1.18.11/balena-etcher_1.18.11_amd64.deb
              sudo dpkg -i balena-etcher_1.18.11_amd64.deb
              sudo apt install -y -f
              rm balena-etcher_1.18.11_amd64.deb
              ;;
            "htop")
              sudo apt install -y htop
              ;;
            "geany")
              sudo apt install -y geany
              ;;
            "Mission Center - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.missioncenter.MissionCenter
              ;;
            "CPU-X - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.github.thetumultuousunicornofdarkness.cpu-x
              ;;
            "Warehouse - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.github.flattool.Warehouse
              ;;
            "BleachBit")
              cd /tmp/
              wget https://download.bleachbit.org/bleachbit_4.6.0-0_all_ubuntu2310.deb
              sudo dpkg -i bleachbit_4.6.0-0_all_ubuntu2310.deb
              sudo apt install -y -f
              rm bleachbit_4.6.0-0_all_ubuntu2310.deb
              ;;
            "Fondo - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.calo001.fondo
              ;;
            "Geany")
              sudo apt install -y gimp
              ;;
            "Atom - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.atom.Atom
              ;;
            "Sublime Text - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.sublimetext.three
              ;;
            "Gimp")
              sudo apt install -y gimp
              ;;
            "Inkscape")
              sudo apt install -y inkscape
              ;;
            "Synfig")
              sudo apt install -y synfig
              ;;
            "Blender")
              sudo apt install -y blender              
              ;;  
	    "Photoshop")
		sudo apt update && sudo apt upgrade -y
		sudo apt install -y zenity gdebi synaptic make automake cmake autoconf git aptitude synaptic curl
		cd /tmp/
		git clone https://gitlab.com/csmarckitus1/photoshop.git
		cd photoshop
		make
		./Photoshop2020
		;;
	    "Ilustrator")
		sudo apt update && sudo apt upgrade -y
		sudo apt install -y zenity gdebi synaptic make automake cmake autoconf git aptitude synaptic curl
		cd /tmp/
		wget https://github.com/LinSoftWin/Illustrator-CC-2021-Linux/releases/download/1.0.0/install-illustrator-2021.sh
		chmod +x install-illustrator-2021.sh
		sh install-illustrator-2021.sh
		;;
            "LibreSprite - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.libresprite.LibreSprite
              ;;
            "Pixelorama - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.orama_interactive.Pixelorama
              ;;   
            "Krita - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.orama_interactive.Pixelorama
              ;;   
            "darktable - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.darktable.Darktable
              ;;           
            "vlc")
              sudo apt install -y vlc
              ;;
            "Spotify")
		curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
		echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
		sudo apt-get update && sudo apt-get install spotify-client
              ;;
            "Audacity")
              sudo apt install -y audacity
			  ;;
            "Codecs multimedia")
      	     sudo apt install -y w64codecs libdvdcss2 gstreamer1.0-libav
      	      ;;
	    "kdenlive")
	     sudo apt install -y kdenlive mediainfo
	      ;;
	    "Obs Studio")
	      sudo add-apt-repository ppa:obsproject/obs-studio
	      sudo apt update
	      sudo apt install -y obs-studio
	      ;;
            "Soundconverter")
              sudo apt install -y soundconverter
              ;;
            "Kdenlive")
              sudo apt install -y kdenlive
              ;;
            "Kodi")
              sudo apt install -y kodi
              ;;
            "Video Downloader - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.unrud.VideoDownloader
              ;;  
            "FreeTube - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.freetubeapp.FreeTube
              ;;  
            "HandBrake - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub fr.handbrake.ghb
              ;;  
            "Stremio - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.stremio.Stremio
              ;; 
            "Plex - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub tv.plex.PlexDesktop
              ;; 
            "Shortwave - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub de.haeckerfelix.Shortwave
              ;; 
            "Bitwig Studio - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.bitwig.BitwigStudio
              ;;
            "Mixxx DJ - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.mixxx.Mixxx
              ;;
            "Flameshot - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.flameshot.Flameshot
              ;;
            "Google Chrome")
              cd /tmp/
              wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
              sudo dpkg -i google-chrome-stable_current_amd64.deb
              sudo apt install -f -y
              rm google-chrome-stable_current_amd64.deb
              ;;
            "Brave-browser")
              sudo apt install -y curl
              sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
              echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg  arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
              sudo apt update
              sudo apt install -y brave-browser
              ;;
            "Vivaldi - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.vivaldi.Vivaldi
              ;;
            "Microsoft Edge - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.microsoft.Edge
              ;;
            "Opera - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.opera.Opera
              ;;
            "Firefox - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.mozilla.firefox
              ;;
            "LibreWolf - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.gitlab.librewolf-community
              ;;
            "Tor Browser Launcher - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.micahflee.torbrowser-launcher
              ;;
            "Midori Web Browser - flatpak")
			  cd /tmp/
              wget https://astian.org/wp-content/uploads/midori-browser/linux/midori_11.2_amd64.deb
              sudo dpkg -i midori_11.2_amd64.deb
              sudo apt install -y -f
              rm midori_11.2_amd64.deb
              ;;
            "WhatsApp Desktop - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub io.github.mimbrero.WhatsAppDesktop
              ;;
            "Telegram Desktop - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.telegram.desktop
              ;;
            "Signal Desktop - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.signal.Signal
              ;;
            "teams-for-linux - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux
              ;;
            "Discord - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.discordapp.Discord
              ;;
            "JDownloader - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.jdownloader.JDownloader
              ;;
            "LibreOffice")
              sudo apt install -y libreoffice libreoffice-l10n-es
              ;;
            "steam")
              cd /tmp/
              wget https://cdn.akamai.steamstatic.com/client/installer/steam.deb
              sudo dpkg --add-architecture i386
              sudo apt install -y libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 python-apt libgl1-nvidia-glx
              sudo apt update
              sudo dpkg -i steam.deb
              sudo apt install -y -f
              rm steam.deb
              ;;
            "Lutris")
			  cd /tmp/
              wget https://github.com/lutris/lutris/releases/download/v0.5.14/lutris_0.5.14_all.deb
              sudo dpkg -i lutris_0.5.14_all.deb
              sudo apt install -y -f
              rm lutris_0.5.14_all.deb
              ;;
            "Minecraft - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.mojang.Minecraft
              ;;
             "Dolphin")
              sudo apt-add-repository ppa:dolphin-emu/ppa
	      sudo apt update
	      sudo apt install -y dolphin-emu
              ;;
             "Citra - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y org.citra_emu.citra
              ;;
            "Cemu - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub info.cemu.Cemu
              ;;
            "yuzu - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.yuzu_emu.yuzu
              ;;
            "Ryujinx - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.ryujinx.Ryujinx
              ;;
            "DuckStation - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.duckstation.DuckStation
              ;;
            "PPSSPP - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.ppsspp.PPSSPP
              ;;
            "PCSX2 - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub net.pcsx2.PCSX2
              ;;
            "RetroArch - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.libretro.RetroArch
              ;;
            "VICE - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub net.sf.VICE
              ;;
            "Amiberry - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.blitterstudio.amiberry
              ;;
            "DOSBox-X - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.dosbox_x.DOSBox-X
              ;;
            "Pack Juegos Retro")
              sudo apt -y install alienblaster boswars enigma freedoom gweled hedgewars neverball njam pingus pipenightdreams pokerth pychess seahorse-adventures supertux supertuxkart vodovod xmoto xgalaga
              ;;
            "WPS Office")
              cd /tmp/
              wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11711/wps-office_11.1.0.11711.XA_amd64.deb
              sudo dpkg -i wps-office_11.1.0.11711.XA_amd64.deb
              sudo apt install -y -f
              rm wps-office_11.1.0.11711.XA_amd64.deb
              ;;
            "ONLYOFFICE Desktop - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.onlyoffice.desktopeditors
              ;; 
            "Calligra")
              sudo apt install -y calligra
              ;;
            "MEGASync")
              cd /tmp/
              wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb
              sudo dpkg -i megasync-xUbuntu_22.04_amd64.deb
              sudo apt install -y -f
              rm megasync-xUbuntu_22.04_amd64.deb
              ;;
            "Insync")
              cd /tmp/
              wget https://cdn.insynchq.com/builds/linux/insync_3.8.6.50504-mantic_amd64.deb
              sudo dpkg -i insync_3.8.6.50504-mantic_amd64.deb
              sudo apt install -y -f
              rm insync_3.8.6.50504-mantic_amd64.deb
              ;;
            "calibre - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.calibre_ebook.calibre
              ;;
            "Foliate - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.github.johnfactotum.Foliate
              ;; 
            "Adobe Reader - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.adobe.Reader
              ;; 
            "Master PDF Editor - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub net.codeindustry.MasterPDFEditor
              ;; 
            "FreeCAD - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.freecadweb.FreeCAD
              ;; 
            "UltiMaker Cura - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub com.ultimaker.cura
              ;; 
            "KiCad - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.kicad.KiCad
              ;; 
            "Fritzing - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.fritzing.Fritzing
              ;; 
            "Arduino IDE - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub cc.arduino.arduinoide
              ;; 
            "DL: language lessons - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub ro.go.hmlendea.DL-Desktop
              ;;
            "GnuCash - flatpak")
              sudo apt install -y flatpak
              sudo apt install -y gnome-software-plugin-flatpak
              flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
              flatpak install -y flathub org.gnucash.GnuCash
              ;;
            "Unity")
              sudo apt install -y ubuntu-unity-desktop
              ;;
            "Gnome")
              sudo apt install -y ubuntu-gnome-desktop
              ;;
            "Cinnaomon")
              sudo apt install -y cinnamon
              ;;
            "Budgie")
              sudo apt install -y buntu-budgie-desktop
              ;;
            "KDE Plasma")
              sudo apt install -y kubuntu-desktop
              ;;
            "KDE Full")
              sudo apt install -y kubuntu-desktop
              ;;
            "KDE Standard")
              sudo apt install -y kde-standard
              ;;
            "KDE Plasma Desktop")
              sudo apt install -y kde-plasma-desktop
              ;;
            "ubuntu-mate")
              sudo apt install -y ubuntu-mate-desktop 
              ;;
            "Xubuntu")
              sudo apt install -y xubuntu-desktop
              ;;
            "XFCE 4")
              sudo apt install -y xfce4
              ;;
            "Lubuntu")
              sudo apt install -y lubuntu-desktop
              ;;
            "LXQt")
              sudo apt install -y task-lxqt-desktop
              ;;
            "LXDE")
              sudo apt install -y task-lxde-desktop
              ;;
          esac
        done
        ;;
    esac
  done
fi
