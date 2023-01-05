#!/bin/bash








INTRO () {

    echo "                                  Criando Usuários                                          ";
    echo;
    echo " Insira o usuário e depois a senha. Essa rotina já cria os usuários com a pasta home";
    echo " e criptografa a senha.";
    echo;
    echo " Caso tenha finalizado ou deseje cancelar o processo, digite sair no campo Usuário. ";

    sleep 3;
}

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

    useradd "$USERLOGIN" -c "$USERNAME" -s /bin/bash -m -p $(openssl passwd -crypt "$USERPASS2");

done

