#!/bin/bash

##################################################################
#----------------------------------------------------------------#
# Nome do Script: batch_user_creation.sh                         #
#----------------------------------------------------------------#
# Descrição: Esse script automatiza a criação de usuários,       #
# criando um diálogo onde é inserido o user, o nome e a senha    #
# o que dispensa todo o comando de criação.                      #
# Junto é criada a pasta home e a senha é criptografada          #
# com o openssl                                                  #
#----------------------------------------------------------------#
# Site: https://hagen.dev.br                                     #
#----------------------------------------------------------------#
# Autor: João Pedro Hagen <joaopedro@hagen.dev.br>               #
# ---------------------------------------------------------------#
# Histórico:                                                     #
#   V1.0.1 2022-12-11                                            #
#       -Initial release.                                        #
#----------------------------------------------------------------#
##################################################################

echo;
echo;

echo "┌┐ ┌─┐┌┬┐┌─┐┬ ┬    ┬ ┬┌─┐┌─┐┬─┐    ┌─┐┬─┐┌─┐┌─┐┌┬┐┬┌─┐┌┐┌";
echo "├┴┐├─┤ │ │  ├─┤    │ │└─┐├┤ ├┬┘    │  ├┬┘├┤ ├─┤ │ ││ ││││";
echo "└─┘┴ ┴ ┴ └─┘┴ ┴────└─┘└─┘└─┘┴└─────└─┘┴└─└─┘┴ ┴ ┴ ┴└─┘┘└┘";

echo;
echo;

INTRO () {

    echo "                                  Criando Usuários                                          ";
    echo;
    echo " Insira o usuário e depois a senha. Essa rotina já cria os usuários com a pasta home";
    echo " e criptografa a senha.";
    echo;
    echo " Caso tenha finalizado ou deseje cancelar o processo, digite sair no campo Usuário. ";

    sleep 3;
}

INTRO;

echo;
echo;


while [ "$USERLOGIN" != "sair" ];
do

    USERINPUT () {

        echo;
        echo;
        read -p " Insira o usuário: " USERLOGIN;

        if [ "$USERLOGIN" == "sair" ]; then
            echo " Saindo. Até mais! ";
            sleep 3;
            exit 0;
    
        elif [ "$USERLOGIN" == "" ]; then
            echo;
            echo;
            echo " O campo Usuário é obrigatório! ";
            sleep 2;
            USERINPUT;

        fi

        sleep 2;
    }

    NAMEINPUT () {

        read -p " Insira o nome do usuário: " USERNAME;
        sleep 2;

    }


    PASSINPUT () {

        echo;
        echo;
        read -p " Insira a senha: " USERPASS;
        sleep 2;

        if [ "$USERPASS" == "" ]; then
            echo;
            echo;
            echo " O campo Senha é obrigatório! ";
            sleep 2;
            PASSINPUT;
        fi

    }

    PASSINPUT2 () {

        echo;
        echo;
        read -p " Repita a senha: " USERPASS2
        sleep 2;

    }

    
    USERINPUT;
    NAMEINPUT;
    PASSINPUT;
    PASSINPUT2;

    while [ "$USERPASS" != "$USERPASS2" ];
    do

        echo;
        echo;
        echo " As senhas não são as mesmas! ";
    
        PASSINPUT;
        PASSINPUT2;

    done

    #useradd "$USERLOGIN" -c "$USERNAME" -s /bin/bash -m -p $(openssl passwd -crypt "$USERPASS2");

done

echo;
echo;
echo " ____   ___  ____  __  ____  ____                                    ";
echo "/ ___) / __)(  _ \(  )(  _ \(_  _)                                   ";
echo "\___ \( (__  )   / )(  ) __/  )(                                     ";
echo "(____/ \___)(__\_)(__)(__)   (__)                                    ";
echo " ____  _  _  _    _  _   __    ___  ____  __ _     ____  ____  _  _  ";
echo "(  _ \( \/ )(_)  / )( \ / _\  / __)(  __)(  ( \   (    \(  __)/ )( \ ";
echo " ) _ ( )  /  _   ) __ (/    \( (_ \ ) _) /    / _  ) D ( ) _) \ \/ / ";
echo "(____/(__/  (_)  \_)(_/\_/\_/ \___/(____)\_)__)(_)(____/(____) \__/  ";

sleep 5; 

exit 0;
