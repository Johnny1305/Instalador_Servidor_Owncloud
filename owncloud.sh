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
    echo "Versión del software: 1.0"
}

# Función para descargar o actualizar archivos necesarios
function updateFiles(){

    file_path="install.sh"
    download_url="https://ejemplo.com/archivo-para-descargar"

    sudo apt install curl
    clear

 if [ -f $file_path ]; then
        echo "Archivo encontrado, comprobando actualizaciones..."
        current_checksum=$(md5sum $file_path | awk '{print $1}')
        updated_checksum=$(curl -s $download_url | md5sum | awk '{print $1}')
        if [ $current_checksum != $updated_checksum ]; then
            echo "Actualizaciones encontradas, actualizando archivo..."
            curl -o $file_path $download_url
            if [ -f $file_path ]; then
                echo "Archivo actualizado con éxito en la ruta: $file_path"
            else
                echo "Error al actualizar el archivo."
            fi
        else
            echo "No se encontraron actualizaciones para el archivo."
        fi
    else
        echo "Archivo no encontrado, descargando..."
        curl -o $file_path $download_url
        if [ -f $file_path ]; then
            echo "Archivo descargado con éxito en la ruta: $file_path"
        else
            echo "Error al descargar el archivo."
        fi
    fi
}




declare -i parameter_counter=0

while getopts "huv" arg; do
    case $arg in
        u) let parameter_counter+=2;;
        v) let parameter_counter+=1;;
        h) let parameter_counter+=3;;
    esac
done

if [ "$parameter_counter" -eq 2 ]; then
    updateFiles
elif [ "$parameter_counter" -eq 1 ]; then
    versionSoftware
elif [ "$parameter_counter" -eq 3 ]; then
    helpPanel
else
    echo -e "\n${redColour}[?]${endColour} Usa el parámetro ${yellowColour}-h${endColour} para mostrar el panel de ayuda${grayColour}${endColour}\n"
fi
