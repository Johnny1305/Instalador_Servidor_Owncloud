#!/bin/bash

# Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m'

function ctrl_c(){
    echo -e "\n${redColour}[!]${endColour} ${yellowColour}Saliendo...${endColour}\n"
    sleep 2
    clear
    tput cnorm && exit 1
}

# Ctrl + C
trap ctrl_c INT

# Menú de Ayuda

# Función para mostrar el panel de ayuda
function helpPanel(){
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Uso:${endColour}\n"
    echo -e "\t${yellowColour}[+]${endColour} ${grayColour}Sistemas Soportados 🖥${endColour}\n"
    echo -e "\t\t${greenColour}[+]${endColour} Ubuntu"
    echo -e "\t\t${greenColour}[+]${endColour} Debian"
    echo -e "\t\t${greenColour}[+]${endColour} Kali Linux"
    echo -e "\t\t${redColour}[-]${endColour} Parrot ${endColour}${redColour}(No soportado)${endColour}"
    echo -e "\t\t${redColour}[-]${endColour} Arch Linux ${endColour}${redColour}(No soportado)${endColour}\n"
    echo -e "\t${purpleColour}[?]${endColour} ${grayColour}No hay tantos problemas con este script, es sencillo 😝${endColour}\n"
    echo -e "\t${purpleColour}v)${endColour} ${grayColour}👉 Ver versión del software 👈${endColour}\n"
}

function soporte(){
    echo -e "${greenColour}[+]${endColour} Ubuntu"
    echo -e "${greenColour}[+]${endColour} Debian"
    echo -e "${greenColour}[+]${endColour} Kali Linux"
    echo -e "${redColour}[-]${endColour} Parrot"
    echo -e "${redColour}[-]${endColour} Arch Linux"
}

#Función para ver la versión del software
function versionSoftware(){
    clear

    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Instalador Owncloud Automático${endColour}"

    echo -e "\n"

    echo -e "\e[32m     ____.      .__                          ____________   \e[0m"
    echo -e "\e[32m    |    | ____ |  |__   ____   ____ ___.__./_   \_____  \  \e[0m"
    echo -e "\e[32m    |    |/  _ \|  |  \ /    \ /    <   |  | |   | \e[32m(__  <\e[0m  "
    echo -e "\e[32m/\__|    (  <_> )   Y  \   |  \   |  \___  | |   |\e[32m/       \e[0m "
    echo -e "\e[32m\________|\____/|___|  /___|  /___|  / ____| |___\e[32m/______  \e[0m"
    echo -e "\e[32m                     \/     \/     \/\/                 \/  \e[0m"


    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Versión: 1.0${endColour}"
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Desarrollado por${endColour}${greenColour} Johnny13${endColour}"
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} ©${endColour} ${yellowColour}$(date +'%Y')${endColour}${grayColour} Todos los derechos reservados${endColour}\n"
}

# Funcion para mostrar el nombre del programa

function nombre(){
    echo -e "\e[34m _____ _    _ _  _ ___ __   _____ __  __ ____    \e[36m ____ _  _ ___ ____  __   __   __  \e[36m ____ ____ \e[0m"
    echo -e "\e[34m(  _  ( \/\ / (\\( / __(  ) (  _  (  )(  (  _ \  \e[36m (_  _( \\( / __(_  _)/__\\ (  ) (  ) \e[36m( ___(  _ \ \\e[0m"
    echo -e "\e[34m )(_)( )    ( )  ( (__ )(__ )(_)( )(__)( )(_) ) \e[36m  _)(_ )  (\\__ \ )( /(__)\\ )(__ )(__ \e[36m)__) )   /\e[0m"
    echo -e "\e[34m(_____(__/\__(_)\_\___(____(_____(______(____/  \e[36m (____(_)\_(___/(__(__)(__(____(____(____(_)\_) \e[36m  \e[0m"
                                                                                      

}



# Función para descargar o actualizar archivos necesarios
function debian(){
    tput civis
    clear
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Comprobando Conectividad a Internet..."
    sleep 1
    clear
    ip
    sleep 2
    clear
    echo -e "\n${redColour}[-]${endColour} ${grayColour} Instalando dependencias...${endColour}\n"
    sudo groupadd owncloud
    sudo usermod -a -G owncloud $LOGNAME
    git clone https://github.com/Johnny1305/owncloud.git
    rm -rf owncloud/owncloud.sh
    chmod +x owncloud/install.sh
    sudo chown $LOGNAME:owncloud owncloud/
    sudo apt install curl 2>/dev/null
    sleep 5
    clear
    echo -e "\n${greenColour}[+]${endColour} ${grayColour} Dependencias instaladas${endColour}\n"
    sleep 3
    clear
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour} Ejecutando el Instalador Owncloud...${endColour}\n"
    sleep 2
    instalador
    rm -rf owncloud/
    tput cnorm
}

# Comprobar conectividad

function ip(){

    # Dirección IP de destino
    ip_address="8.8.8.8"

    # Intenta hacer ping a la dirección IP
    ping -c 1 $ip_address > /dev/null

    # Comprueba el código de salida del último comando ejecutado
    if [ $? -eq 0 ]; then
      echo -e "\n${greenColour}[+]${endColour}${grayColour} Conectividad de red presente${endColour}"
    else
      echo -e "\n${redColour}[-]${endColour}${grayColour} No hay conectividad de red${endColour}"
    fi

}


function sistemaOperativo(){
    clear
    letrasSO
    echo -e "\n${greenColour}[+]${endColour}${grayColour} Selecciona su Sistema Operativo${endColour}\n"
    echo -e "${yellowColour}1.${endColour}${grayColour} Ubuntu${endColour}"
    echo -e "${yellowColour}2.${endColour}${grayColour} Debian${endColour}"
    echo -e "${yellowColour}3.${endColour}${grayColour} Kali Linux${endColour}"
    echo -e "${yellowColour}4.${endColour}${grayColour} Parrot ${endColour}${redColour}(No soportado)${endColour}"
    echo -e "${yellowColour}5.${endColour}${grayColour} Arch Linux ${endColour}${redColour}(No soportado)${endColour}\n"

    read opcion

    case $opcion in
        1)
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ha seleccionado ${greenColour}Ubuntu${endColour} como su Sistema Operativo${endColour}"
            sleep 5
            debian
            ;;
        2)
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ha seleccionado ${greenColour}Debian${endColour} como su Sistema Operativo${endColour}"
            sleep 5
            debian
            ;;
        3)
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ha seleccionado ${greenColour}Kali Linux${endColour} como su Sistema Operativo${endColour}"
            sleep 5
            debian
            ;;
        
        4)
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ha seleccionado ${greenColour}Parrot${endColour} como su Sistema Operativo${endColour}"
            echo "Parrot NO Soportado"
            # Agrega aquí el código a ejecutar para la opción 3
            ;;

        5)
            echo -e "\n${yellowColour}[+]${endColour}${grayColour} Ha seleccionado ${greenColour}Arch Linux${endColour} como su Sistema Operativo${endColour}"
            echo "ArchLinux NO Soportado"
            # Agrega aquí el código a ejecutar para la opción 3
            ;;

        *)
            echo "Opción no válida."
            ;;
    esac
}

function letrasSO(){
    #!/bin/bash

echo -e "\e[1;36m  ____  _     _                               \e[0m"
echo -e "\e[1;36m / ___|(_)___| |_ ___ _ __ ___   __ _         \e[0m"
echo -e "\e[1;36m \___ \| / __| __/ _ | '_ \` _ \ / _\` |        \e[0m"
echo -e "\e[1;36m  ___) | \__ | ||  __| | | | | | (_| |        \e[0m"
echo -e "\e[1;36m |____/|_|___/\__\___|_|_|_| |_|\__,_|        \e[0m"
echo -e "\e[1;35m  / _ \ _ __   ___ _ __| |_ __ _(___   _____  \e[0m"
echo -e "\e[1;35m | | | | '_ \ / _ | '__| __/ _\` | \ \ / / _ \ \e[0m"
echo -e "\e[1;35m | |_| | |_) |  __| |  | || (_| | |\ V | (_) |\e[0m"
echo -e "\e[1;35m  \___/| .__/ \___|_|   \__\__,_|_| \_/ \___/ \e[0m"
echo -e "\e[1;35m       |_|                                    \e[0m"

}

function comienzo(){
    tput civis
    echo -e "${yellowColour}[?]${endColour}${grayColour} Esto es un instalador de un Servidor Owncloud\n${endColour}"
    sleep 2
    echo -e "${yellowColour}[?]${endColour}${grayColour} Por lo que puede modificar archivos que pueden ser importantes del sistema.\n${endColour}"
    sleep 2
    echo -e "${yellowColour}[?]${endColour}${grayColour} Realiza una copia de seguridad, por si algun fichero del sistema da algún fallo.\n${endColour}"
    #sleep 2
    #echo -e "${yellowColour}[?]${endColour}${grayColour} .\n${endColour}"
    sleep 3
    echo -e "${CYAN}[+]${endColour}${grayColour} ¿Desea continuar con la instalación?${endColour} (${greenColour}s${endColour}/${redColour}n${endColour})"


    # Establecer un tiempo límite de 10 segundos para la respuesta
    if read -t 10 respuesta; then
        # Si se recibió una respuesta dentro del tiempo límite
        if [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]; then
            sleep 2
            sistemaOperativo
    elif [ "$respuesta" = "n" ] || [ "$respuesta" = "N" ]; then
        ctrl_c
    else
        echo -e "\n${redColour}[-]${endColour}${grayColour} Respuesta no válida.${endColour}"
        sleep 3
        ctrl_c
    fi
else
    # Si no se recibió una respuesta dentro del tiempo límite, salir del script
    echo -e "\n${redColour}[-]${endColour}${grayColour} No se recibió ninguna respuesta.${endColour}"
    ctrl_c
fi
    tput cnorm

}

function instalador(){
    # Actualizar los paquetes existentes
clear
tput civis
nombre
sleep 5
clear
sudo apt update

# Instalar los paquetes necesarios para OwnCloud
sudo apt install bind9 apache2 php7.4 mysql-server mysql-client php-zip php-gd php-curl php-mbstring php-mysql php-pgsql php-dom php-xmlreader php-intl php-xmlwriter -y
systemctl restart apache2

# Descargar e instalar OwnCloud
mkdir $HOME/Desktop 
wget https://download.opensuse.org/repositories/isv:/ownCloud:/server:/10/Ubuntu_21.10/all/owncloud-complete-files_10.11.0-1+7.1_all.deb
mv owncloud-complete-files_10.11.0-1+7.1_all.deb $HOME/Desktop
dpkg -i $HOME/Desktop/owncloud-complete-files_10.11.0-1+7.1_all.deb
sudo mv /var/www/owncloud /var/www/html/owncloud

# Crear la base de datos para OwnCloud
sudo mysql -u root <<EOF
UPDATE mysql.user SET plugin='mysql_native_password' WHERE user='root';
FLUSH PRIVILEGES;
DROP DATABASE IF EXISTS owncloud;
CREATE DATABASE IF NOT EXISTS onwcloud;
EOF
sleep 2
clear
tput cnorm
echo -e "\n${greenColour}[+]${endColour}${grayColour} Seguridad MySQL${endColour}"
sudo mysql_secure_installation
clear
tput civis
#Reiniciar los servicios necesarios
echo -e "\n${yellowColour}[+]${endColour}${grayColour} Reiniciando Apache2...${endColour}\n"
sudo systemctl restart apache2
sleep 2
clear
echo -e "\n${yellowColour}[+]${endColour}${grayColour} Reiniciando MySQL...${endColour}\n"
sudo systemctl restart mysql

sleep 3
clear
echo -e "\n${greenColour}[+]${endColour}${grayColour} Onwcloud Instalado Correctamente${endColour}\n"
echo -e "${greenColour}[+]${endColour}${yellowColour} Servidor:${endColour}${redColour} http://127.0.0.1/owncloud${endColour}"
echo -e "${greenColour}[+]${endColour}${yellowColour} Usario:${endColour}${redColour} root${endColour}"
echo -e "${greenColour}[+]${endColour}${yellowColour} Contraseña:${endColour}${redColour} root${endColour}"
echo -e "${greenColour}[+]${endColour}${yellowColour} Nombre Base de Datos:${endColour}${redColour} owncloud${endColour}\n"
versionSoftware
sleep 10
rm -rf ../owncloud.sh
rm -rf ../owncloud
clear
tput cnorm
}


# Indicadores

declare -i parameter_counter=0

while getopts "huvm" arg; do
    case $arg in
        u) let parameter_counter+=2;;
        v) let parameter_counter+=1;;
        h) let parameter_counter+=3;;
        m) let parameter_counter+=4;;
    esac
done

if [ "$parameter_counter" -eq 2 ]; then
    updateFiles
elif [ "$parameter_counter" -eq 1 ]; then
    versionSoftware
elif [ "$parameter_counter" -eq 3 ]; then
    clear
    helpPanel
elif [ "$parameter_counter" -eq 4 ]; then
    instalador
else
    clear
    nombre
    echo -e "\n${redColour}[?]${endColour} Usa el parámetro ${yellowColour}-h${endColour} para mostrar el panel de ayuda${grayColour}${endColour}\n"
    comienzo
fi
