#include <signal.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <pthread.h>  
//signal function should not call I/O function and nother non-reentrant functions
//this test would have a dead lock. Because localtime_r have a lock. When signal interrupt
//occurs, if the main function get the lock and had not released it, the dead lock produced.

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void handler(int signum)
{
	printf("signum: %d\n", signum);
	pthread_mutex_lock(&mutex);  
	printf("lock: %d\n", signum);
	sleep(10);
	pthread_mutex_unlock(&mutex);
	printf("unlock: %d\n", signum);
}

int main (void)
{
	if (signal(41, handler) == SIG_IGN)
	signal(41, SIG_IGN);

	while(1)
	{
		handler(0);
	}
	return 0;
}
