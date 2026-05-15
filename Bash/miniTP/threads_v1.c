#include <limits.h>

void calculo_aritmetico(void)
{
        int contador = 0;
        while (contador < INT_MAX)
                contador += 1;
}

int main(void)
{
        calculo_aritmetico();
        calculo_aritmetico();
        calculo_aritmetico();
        calculo_aritmetico();
        calculo_aritmetico();

        return 0;
}
