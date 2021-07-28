#!/bin/bash
#Script Cria Usuario
#V1.0
#Criado por Luis
###Esse script irá criar um usuário com permissões de sudo para ser acessar uma VM Linux através de uma chave SSH
###Basta fornecer o nome do usuário e a chave pública
clear
 
# Verifica se o login existe 
echo
echo "+----------------------------------+"
echo "|   Verificacao de usuario         |"
echo "+----------------------------------+"
echo " Informe o nome do usuário [ENTER]:"
read USER
 
if grep -qs $USER /etc/passwd false;
# Caso exista usuario ja cadastrado siga a partir daqui caso contrario pule
then echo ' ---> Usuario encontrado!';
echo
echo
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
if ( $? != "0")
then
    echo "Houve um erro ao criar o usuário"
else
    echo "Usuario $USER criado com sucesso!"
fi
exit
# Caso ainda nao exista usuario cadastrado realizar cadastro

else echo ' ---> Usuario NAO encontrado!';
fi
# Cadastrando usuario
echo " Informe um login [ENTER]:"
echo "+----------------------------------+"
echo "|       Cadastro de usuario        |"
echo "+----------------------------------+"
#fi
read USER
echo 
echo "                    ATENCAO!"
echo "      +--------------------------------------+"
echo " ---> | Para cadastrar usuarios voce precisa |"
echo "      | ser administrador do sistema.        |"
echo "      +--------------------------------------+"
echo " --->  Informe a senha do root:"
su root -c "adduser $USER"
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
if ( $? != "0")
then
    echo "Houve um erro ao criar o usuário"
else
    echo "Usuario $USER criado com sucesso!"
fi

