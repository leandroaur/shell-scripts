#!/bin/bash
#Script Cria Usuario
#V1.0
#Criado por Luis
###Esse script irá criar um usuário com permissões de sudo para ser acessar uma VM Linux através de uma chave SSH
###Basta fornecer o nome do usuário e a chave pública

echo "Informe o numero do usuário:"
read USER
echo "Informe a chave publica do usuario:"
read PUBKEY
sudo useradd -m $USER
sudo usermod -aG sudo $USER
mkdir /home/$USER/.ssh
sudo chmod 0700 /home/$USER/.ssh
sudo chown $USER:$USER /home/$USER/.ssh
sudo touch /home/$USER/.ssh/authorized_keys
sudo chmod 0644 /home/$USER/.ssh/authorized_keys
sudo echo $PUBKEY > /home/$USER/.ssh/authorized_keys
sudo echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "Usuario $USER criado com sucesso!"
