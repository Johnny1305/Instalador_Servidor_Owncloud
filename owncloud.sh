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

function ctrl_c(){
    echo -e "\n${redColour}[!]${endColour} ${yellowColour}Saliendo...${endColour}\n"
    tput cnorm && exit 1
}

# Ctrl + C
trap ctrl_c INT

# Menú de Ayuda

# Función para mostrar el panel de ayuda
function helpPanel(){
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Uso:${endColour}\n"
    echo -e "\t${purpleColour}u)${endColour} ${grayColour}Descargar o actualizar archivos necesarios${endColour}\n"
    echo -e "\t${purpleColour}h)${endColour} ${grayColour}Mostrar este panel de ayuda${endColour}\n"
    echo -e "\t${purpleColour}v)${endColour} ${grayColour}Ver versión del software${endColour}\n"
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
function updateFiles(){
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
    ejecute
    rm -rf owncloud/
    tput cnorm
}

# Ejecutar el archivo descargado

function ejecute(){
    file_path="owncloud/install.sh"
    tput civis
    clear
    if [

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
    ejecute
else
    clear
    nombre
    echo -e "\n${redColour}[?]${endColour} Usa el parámetro ${yellowColour}-h${endColour} para mostrar el panel de ayuda${grayColour}${endColour}\n"
fi -e $file_path ]; then
        echo -e "\n${yellowColour}[-]${endColour} ${grayColour} Cambiando permisos...${endColour}\n"
        chmod +x "$file_path"
        sleep 2
        echo -e "\n${greenColour}[+]${endColour} ${grayColour} Ejecutando el archivo${endColour}\n"
        source $file_path
        sleep 2
    else
        echo -e "\n${redColour}[-]${endColour} ${grayColour} El archivo no existe${endColour}\n"
        sleep 2
        clear
    fi
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
    ejecute
else
    clear
    nombre
    echo -e "\n${redColour}[?]${endColour} Usa el parámetro ${yellowColour}-h${endColour} para mostrar el panel de ayuda${grayColour}${endColour}\n"
fi
