#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/un.h>
#include <string.h>

int main(int argc, char *argv[])
{
    struct sockaddr_un server;
    server.sun_family = AF_LOCAL;
    strcpy(server.sun_path,"/tmp/myserversock");

    struct sockaddr_un client;
    client.sun_family = AF_LOCAL;
    strcpy(client.sun_path,"/tmp/myclientsock");

    int nlen = sizeof(server);  
    
    int sock = -1;  
    if ((sock = socket(AF_LOCAL, SOCK_DGRAM, 0)) == -1)
	{     
        return;  
    } 
 
    unlink("/tmp/myclientsock");
    
    if (bind(sock,(struct sockaddr *)&(client), nlen) == -1)
	{     
        return;  
    }
    
    char smsg[100] = "hello";
	
	sendto(sock, smsg, strlen(smsg), 0, (struct sockaddr*)&server, nlen);

	memset(smsg, 0, sizeof(smsg));
	int ret = recv(sock, smsg, 100, 0);
	if (ret <= 0)  
	{  
	}  
	else  
	{         
		printf("recv: %s\n", smsg);
	}
	return 0;
 /*   while (1){  
        //从广播地址接受消息  
		memset(smsg, 0, sizeof(smsg));
        int ret = recvfrom(sock, smsg, 100, 0, (struct sockaddr*)&client, (socklen_t*)&nlen);  
        if (ret <= 0)  
        {  
        }  
        else  
        {         
			printf("recv: %s\n", smsg);
        }  
    }  */

}
