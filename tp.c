#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define CANT_PRESIDENTES 10
#define CANT_NAVES 33
#define CANT_CIUDADES 33

// ================= SEMAFOROS =================
sem_t mutex_charla;
sem_t naves_listas;
sem_t orden_ataque;
sem_t ciudades_caidas;

// ================= FUNCIONES (simulan primitivas) =================
void hablar_con_comandante(int id) {
    printf("Presidente %d hablando con el comandante\n", id);
    sleep(1);
}

void tomar_posicion(int id) {
    printf("Nave %d en posicion\n", id);
    sleep(1);
}

void atacar(int id) {
    printf("Nave %d atacando!\n", id);
}

void defender(int id) {
    printf("Ciudad %d inicia defensa\n", id);
}

void contraatacar(int id) {
    printf("Ciudad %d contraataca (ineficaz)\n", id);
}

void perder(int id) {
    printf("Ciudad %d ha caido\n", id);
}

void descender() {
    printf("\nLa nave nodriza desciende...\n");
}

void abrir_compuertas() {
    printf("Se abren las compuertas...\n");
}

void abandonar_tierra() {
    printf("Evacuacion! Los aliens abandonan la Tierra\n");
}

// ================= THREADS =================

// PRESIDENTES (exclusion mutua)
void* presidente(void* arg) {
    int id = *(int*)arg;

    sem_wait(&mutex_charla);
    hablar_con_comandante(id);
    sem_post(&mutex_charla);

    pthread_exit(NULL);
}

// NAVES (barrera + espera orden)
void* nave(void* arg) {
    int id = *(int*)arg;

    tomar_posicion(id);

    // Avisa que esta lista
    sem_post(&naves_listas);

    // Espera orden de ataque
    sem_wait(&orden_ataque);

    atacar(id);

    pthread_exit(NULL);
}

// CIUDADES (respuesta y fin)
void* ciudad(void* arg) {
    int id = *(int*)arg;

    defender(id);
    contraatacar(id);
    perder(id);

    // Avisa que cayo
    sem_post(&ciudades_caidas);

    pthread_exit(NULL);
}

// COMANDANTE (coordina todo)
void* comandante(void* arg) {

    // Espera a todas las naves
    for (int i = 0; i < CANT_NAVES; i++)
        sem_wait(&naves_listas);

    printf("\nTodas las naves listas. ORDEN DE ATAQUE!\n\n");

    // Habilita ataque simultaneo
    for (int i = 0; i < CANT_NAVES; i++)
        sem_post(&orden_ataque);

    // Espera a que todas las ciudades caigan
    for (int i = 0; i < CANT_CIUDADES; i++)
        sem_wait(&ciudades_caidas);

    printf("\nTodas las ciudades han caido...\n");

    descender();
    abrir_compuertas();
    abandonar_tierra();

    pthread_exit(NULL);
}

// ================= MAIN =================

int main() {
    pthread_t t_presidentes[CANT_PRESIDENTES];
    pthread_t t_naves[CANT_NAVES];
    pthread_t t_ciudades[CANT_CIUDADES];
    pthread_t t_comandante;

    int id_presidentes[CANT_PRESIDENTES];
    int id_naves[CANT_NAVES];
    int id_ciudades[CANT_CIUDADES];

    // Inicializar semaforos
    sem_init(&mutex_charla, 0, 1);
    sem_init(&naves_listas, 0, 0);
    sem_init(&orden_ataque, 0, 0);
    sem_init(&ciudades_caidas, 0, 0);

    // Crear comandante
    pthread_create(&t_comandante, NULL, comandante, NULL);

    // Crear naves y ciudades
    for (int i = 0; i < CANT_NAVES; i++) {
        id_naves[i] = i;
        id_ciudades[i] = i;

        pthread_create(&t_naves[i], NULL, nave, &id_naves[i]);
        pthread_create(&t_ciudades[i], NULL, ciudad, &id_ciudades[i]);
    }

    // Crear presidentes
    for (int i = 0; i < CANT_PRESIDENTES; i++) {
        id_presidentes[i] = i;
        pthread_create(&t_presidentes[i], NULL, presidente, &id_presidentes[i]);
    }

    // Esperar a todos
    pthread_join(t_comandante, NULL);

    for (int i = 0; i < CANT_PRESIDENTES; i++)
        pthread_join(t_presidentes[i], NULL);

    for (int i = 0; i < CANT_NAVES; i++) {
        pthread_join(t_naves[i], NULL);
        pthread_join(t_ciudades[i], NULL);
    }

    // Destruir semaforos
    sem_destroy(&mutex_charla);
    sem_destroy(&naves_listas);
    sem_destroy(&orden_ataque);
    sem_destroy(&ciudades_caidas);

    return 0;
}