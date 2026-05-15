#include <limits.h>
#include <stdio.h>

int main(void){
    int num;

    //Entrada (I/O) - Estado S (Sleeping)
    printf("Ingrese un numero: ");
    scanf("%d", &num);

    printf("Ingresaste: %d\n", num);

    long long result = 0;

    //Calculo - Estado R (Running)
    for (int i = 0; i < INT_MAX; i++){
        result +=1;
        printf("Result: %lld\r",result);
    }
    return 0;
}