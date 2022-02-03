#!/bin/bash
#VARs
arq="$(dpkg --print-architecture)"
arq_amd='amd'
arq_armhf='armhf'
arq_arm64='arm64'
install_path="./instaladores"
#Criando path onde será baixado o instalador
mkdir -p  $install_path
#instalando o libfuse2 para executar o .AppImage
if !  dpkg --list | grep libfuse2  > /dev/null 2>&1
    then
        sudo apt install libfuse2:$arq
    fi
#Verificando se o instalador ja esta baixado.
if ! ls $install_path/ | grep install_iotedge > /dev/null 2>&1
    then
        #baixando o programa.
        if [[ $arq == *"$arq_amd"* ]]
            then
                curl -L https://github.com/rodrigocruzdev/instaladores/raw/main/install_iotedge_and_provising_device-0.1.0-x86_64.AppImage  -o $install_path/install_iotedge_and_provising_device-0.1.0-x86_64.AppImage   > /dev/null 2>&1     
        elif [[ $arq == *"$arq_armhf"* ]]
            then
                curl -L https://github.com/rodrigocruzdev/instaladores/raw/main/install_iotedge_and_provising_device-0.1.0-armhf.AppImage   -o  $install_path/install_iotedge_and_provising_device-0.1.0-armhf.AppImage   > /dev/null 2>&1
        elif [[ $arq == *"$arq_arm64"* ]]
            then
                curl -L https://github.com/rodrigocruzdev/instaladores/raw/main/install_iotedge_and_provising_device-0.1.0-aarch64.AppImage -o  $install_path/install_iotedge_and_provising_device-0.1.0-aarch64.AppImage  > /dev/null 2>&1
            fi
    fi
#liberando acesso
sudo chmod a+x $install_path/*.AppImage
sudo chmod 777 $install_path/*.AppImage
#executando o programa.
sudo $install_path/*.AppImage
