#include <stdio.h>

int main()
{
    int contV=0, contM=0,contP=0, contA=0;
    int op=0, aux=0;
    
    
    printf("* Este é o quizz das princesas *\n");
    printf("Qual princesa você é?\n");
    
    printf("\n");
    
    while(aux==0){
        printf("PERGUNTA NÚMERO 1: \n");
        printf("Escolha uma comida: \n");
        printf("        1- Pirulito\n");
        printf("        2- Arroz\n");
        printf("        3- Milho cozido\n");
        printf("        4- Porco no rolete\n");
        scanf("%d",&op);
    
        if(op==1){
            contV++;
            op=0;
            aux=1;
        }
        else if(op==2){
            contM++;
            op=0;
            aux=1;
        }
        else if(op==3){
            contP++;
            op=0;
            aux=1;
        }
        else if(op==4){
            contA++;
            op=0;
            aux=1;
        }
        else{
            printf("Digite um número possível >:(  \n");
        }
    }
    
    
    while(aux==1){
        printf("PERGUNTA NÚMERO 2: \n");
        printf("Escolha um animal: \n");
        printf("        1- Furão\n");
        printf("        2- Cavalo\n");
        printf("        3- Guaxinim\n");
        printf("        4- Pombo\n");
        scanf("%d",&op);
        if(op==1){
            contV++;
            op=0;
            aux=2;
        }
        else if(op==2){
            contM++;
            op=0;
            aux=2;
        }
        else if(op==3){
            contP++;
            op=0;
            aux=2;
        }
        else if(op==4){
            contA++;
            op=0;
            aux=2;
        }
        else{
            printf("Digite um número possível >:(  \n");
        }
    }
    
    
    
    while(aux==2){
        printf("PERGUNTA NÚMERO 3: \n");
        printf("Escolha uma cor: \n");
        printf("        1- Rosa\n");
        printf("        2- Vermelho\n");
        printf("        3- Verde\n");
        printf("        4- Azul\n");
        scanf("%d",&op);
        if(op==1){
            contV++;
            op=0;
            aux=3;
        }
        else if(op==2){
            contM++;
            op=0;
            aux=3;
        }
        else if(op==3){
            contP++;
            op=0;
            aux=3;
        }
        else if(op==4){
            contA++;
            op=0;
            aux=3;
        }
        else{
                printf("Digite um número possível >:(  \n");
        }
    }



    while(aux==3){
        printf("PERGUNTA NÚMERO 4: \n");
        printf("Escolha um hobbie: \n");
        printf("        1- Corrida\n");
        printf("        2- Pintar\n");
        printf("        3- Nadar\n");
        printf("        4- Cantar\n");
        scanf("%d",&op);
        if(op==1){
            contV++;
            op=0;
            aux=4;
        }
        else if(op==2){
            contM++;
            op=0;
            aux=4;
        }
        else if(op==3){
            contP++;
            op=0;
            aux=4;
        }
        else if(op==4){
            contA++;
            op=0;
            aux=4;
        }
        else{
                    printf("Digite um número possível >:(  \n");
        }
    }
    
    
    
    while(aux==4){
        printf("PERGUNTA NÚMERO 5: \n");
        printf("Escolha uma linguagem de programação: \n");
        printf("        1- Python\n");
        printf("        2- Java\n");
        printf("        3- C++\n");
        printf("        4- Assembly\n");
        scanf("%d",&op);
        if(op==1){
            contV++;
            op=0;
            aux=5;
        }
        else if(op==2){
            contM++;
            op=0;
            aux=5;
        }
        else if(op==3){
            contP++;
            op=0;
            aux=5;
        }
        else if(op==4){
            contA++;
            op=0;
            aux=5;
        }
        else{
                    printf("Digite um número possível >:(  \n");
        }
    }
    
    
    
    
    if((contV>contA) && (contV>contM) && (contV>contP)){
        printf("Parabéns, você é a Vanellope!! <3 ");
    }
    else if((contM>contV) && (contM>contP) && (contM>contA)){
        printf("Parabéns, você é a Mulan!! <3 ");
    }
    else if((contP>contV) && (contP>contM) && (contP>contA)){
        printf("Parabéns, você é a Pocahontas!! <3 ");
    }
    else if((contA>contV) && (contA>contM) && (contA>contP)){
        printf("Parabéns, você é a Aurora!! <3 ");
    }
    else{
        if(contV==contM){
            printf("Empate entre Vanelope e Mulan :O \n");
        }
        else if(contV==contP){
            printf("Empate entre Vanelope e Pocahontas :O \n");
        }
        else if(contV==contA){
            printf("Empate entre Vanelope e Aurora :O \n");
        }
        else if(contM==contP){
            printf("Empate entre Mulan e Pocahontas :O \n");
        }
        else if(contM==contA){
            printf("Empate entre Mulan e Aurora :O \n");
        }
        else if(contP==contA){
            printf("Empate entre Pocahontas e Aurora :O \n");
        }
    }
    
    return 0;
}