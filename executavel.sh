arq="$(dpkg --print-architecture)"
arq_amd='amd'
arq_arm='arm'

#!/bin/bash

#liberando acesso
sudo chmod a+x ./instaladores/*.AppImage
sudo chmod 777 ./instaladores/*.AppImage

#instalando o libfuse2 para executar o .AppImage
if !  dpkg --list | grep libfuse2  > /dev/null 2>&1
    then
        sudo apt install libfuse2:$arq
fi

#Executando o programa.
if [[ $arq == *"$arq_amd"* ]]
   then
    sudo ./instaladores/install_iotedge_and_provising_device-0.1.0-x86_64.AppImage

elif [[ $arq == *"$arq_arm"* ]]
   then
    sudo ./instaladores/install_iotedge_and_provising_device-0.1.0-armhf.AppImage

fi
