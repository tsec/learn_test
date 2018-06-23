#include <stdio.h>
#include <sys/time.h>
#include <string.h>
#include <time.h>
char *getTimeStamp()
{
	static char buf[64];
	memset(buf, '\0', sizeof(buf));
	struct timeval tv;
	struct timezone tz;
	gettimeofday(&tv, &tz);

	sprintf(buf, "%s %d", ctime(&(tv.tv_sec)), (int)(tv.tv_usec / 1000));
	return buf;
}

int main(int argc, char *argv[])
{
	printf("%s\n", getTimeStamp());
	return 0;
}
