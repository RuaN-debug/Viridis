#include <math.h>
#include <stdio.h>

int main() {
    int op = 0, aux = 1, i;
    float saldo = 1200.00, quant;
    char conta[10];
    while (aux == 1) {
        printf("\nCAIXA ELETRÔNICO \n");
        printf("Seu saldo: R$%f \n", saldo);
        printf("\nEscolha a operação desejada: \n");
        printf("        1- Saque\n");
        printf("        2- Depósito\n");
        printf("        3- Tranferência\n");
        scanf("%d", &op);

        if (op == 1) {
            printf("\nO quanto deseja sacar? \n");
            scanf("%f", &quant);
            if (quant > saldo) {
                printf("\nVocê não possui saldo suficiente \n");
            } else {
                saldo = saldo - quant;
                printf("\nSeu novo saldo: R$ %f \n", saldo);
            }
        } else if (op == 2) {
            printf("\nO quanto deseja depositar? \n");
            scanf("%f", &quant);
            saldo = saldo + quant;
            printf("\nSeu novo saldo: R$ %f \n", saldo);
        } else if (op == 3) {
            printf("\nPara qual conta deseja transferir? \n");
            for (i = 0; i < 10; i++) {
                scanf("%c", &conta[i]);
            }
            printf("\nDigite a quantidade que deseja transferir: \n");
            scanf("%f", &quant);
            saldo = saldo - quant;
            printf("\nTransferência realizada \n");
            printf("\nSeu novo saldo: %f \n", saldo);
        }

        printf("\nDeseja continuar?");
        printf("        1-Sim");
        printf("        2-Não\n");
        scanf("%d", &aux);
    }

    return 0;
}