#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int main( int argc, char *argv[]) {
    struct tm *ts;
    char buf[80];
    for(int i = 1; i < argc; ++i) {
        time_t epoch_time = atoi(argv[i]);
        ts = localtime(&epoch_time);
        strftime(buf, sizeof(buf), "%a %Y-%m-%d %H:%M:%S %Z", ts);
        printf("%ld -> %s\n", epoch_time, buf);
    }
    return 0;
}
