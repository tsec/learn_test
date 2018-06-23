#include <stdio.h>
#include <string.h>
#define __USE_GNU
#define TEST1 "/hello/world"
//char TEST1[] = "/hello/world";
int main(int argc, char *argv[])
{
	printf("%s\n", basename(TEST1));
}
