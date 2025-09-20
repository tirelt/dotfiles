#include <stdio.h>

int main( int argc, char *argv[]) {
    unsigned long long number;
    int error;
    for(int i = 1; i < argc; ++i) {
        number = 0;
        error = 0;
        int j = 0;
        while (argv[i][j] != '\0') {
            if (argv[i][j] != '0' && argv[i][j] != '1') {
                error = 1;
                break;
            } else
                number = (number << 1) + (argv[i][j] - '0');
            j++;
        }
        if(error)
            printf("Error: %s is not a binary number\n", argv[i]); 
        else 
            printf("%s -> %llu\n", argv[i], number);
    }
    return 0;
}

