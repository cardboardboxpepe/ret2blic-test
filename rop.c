#include <stdio.h>
#include <string.h>

void rop1() {
    printf("ROP 1!\n");
}

void rop2(int a) {
    printf("ROP 2: %x!\n", a);
}

void rop3(int a, int b) {
    printf("ROP 3: %x, %x!\n", a, b);
}

void vulnerable(char* string) {
    char buffer[100];
    strcpy(buffer, string);
}

int main(int argc, char** argv) {
    vulnerable(argv[1]);
    return 0;
}

