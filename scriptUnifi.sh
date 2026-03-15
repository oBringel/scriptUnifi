#!/bin/bash
source /home/unifi/.env

USER_SSH="$USER"
PASS_SSH="$PASS"


IPS=(
192.168.0.x
192.168.0.x
192.168.1.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.3.x
192.168.1.x
192.168.0.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
192.168.2.x
)
# valide se está ativo o ssh nas configuras da unifi
# pegue o usuário e senha em settings/system/controller e veja a opção - Device SSH Authentication
# Você precisa instalar o sshpass
# valide se suas antenas tem algum update ou esta tendo comunicação
for IP in "${IPS[@]}"
do
        if sshpass -p "$PASS_SSH" ssh -o StrictHostKeyChecking=no $USER_SSH@$IP "reboot";then
                echo "Reiniciando... Antena $IP"
        else
                echo "Falha ao reiniar Antena: $IP"
                echo "passando para proxima"
        fi
done

## script simples mas que funcionou aqui na empresa
# validado pelo analista 
