#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>
#include <fcntl.h>

int main(int argc, char *argv[])
{
	int fd = open(argv[1], O_RDONLY);
	char buf[256] = {'\0'};

	read(fd, buf, sizeof(buf));
	printf("%s\n", buf);

	return 0;
}
