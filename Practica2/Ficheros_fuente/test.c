// gcc -Og -o prog main.c mstore.c [-no-pie]; objdump -d prog

#include <stddef.h>

size_t mystrlen(const char *s) {
    size_t len;
    for (len = 0; s[len] != 0; len++);
    return len;
} 

int main(){
    const char *s = "hola";
    return mystrlen(s);
}