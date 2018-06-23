#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/ioctl.h>
#include <string.h>

void usage()
{

}

int send_to_webserver(char *str)
{
	struct sockaddr_in servaddr;
	int sockfd;
	int nRet;
	char buf_r[16] = {'\0'};

	sockfd = socket(AF_INET, SOCK_DGRAM, 0);
	bzero(&servaddr, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	inet_pton(AF_INET, "127.0.0.1", &servaddr.sin_addr);
	servaddr.sin_port = htons(13260);

	nRet = sendto(sockfd, str, strlen(str) + 1, 0, (struct sockaddr *)&servaddr, sizeof(servaddr));
	if (nRet == -1)
	{
		printf("send error\n");
		close(sockfd);
		return nRet;
	}

	int toRead = 0;
	int cnt = 30;
	while(cnt--)
	{
		if((ioctl(sockfd, FIONREAD, &toRead) < 0) || toRead <= 0)
		{
			sleep(1);
			continue;
		}
		else
		{
			break;
		}
	}

	if(cnt > 0)
	{
		nRet = recv(sockfd, buf_r, sizeof(buf_r), 0);
		if(nRet > 0)
		{
			printf("Bind %s\n", buf_r);
			if(strcmp(buf_r, "OK") == 0)
			{
				nRet = 0;
			}
			else
			{
				nRet = -1;
			}
		}
		else
		{
			printf("read error");
			nRet = -1;
		}
	}
	else
	{
		printf("time out");
		nRet = -1;
	}

	close(sockfd);
	return nRet;
}

int main(int argc, char *argv[])
{
	char cmd[100] = {'\0'};

	usage();
	sprintf(cmd, "{\"cmd\":\"bindRobot\",\"phone\":\"%s\",\"password\":\"%s\"}", "1336051", "12345678");

	int ret = send_to_webserver(cmd);
	if(ret < 0)
	{
		printf("bind failed, will user retry\n");
	}

	return 0;
}