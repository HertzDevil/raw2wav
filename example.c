#include <stdio.h>
int main(void){int t;for(;;++t)putchar((t*5&t>>7)|(t*3&t>>10));}
