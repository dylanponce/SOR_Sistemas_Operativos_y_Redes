#include <pthread.h>
#include <limits.h>

#define CANT_THREADS 5

void *calculo_aritmetico(void *param)
{
        int contador = 0;
        while (contador < INT_MAX)
                contador += 1;

        pthread_exit(0);
}

int main(void)
{
        pthread_t threads[CANT_THREADS];

        for (int i = 0; i < CANT_THREADS; i++)
                pthread_create(&threads[i], NULL, calculo_aritmetico, NULL);

        for (int i = 0; i < CANT_THREADS; i++)
                pthread_join(threads[i], NULL);

        return 0;
}
