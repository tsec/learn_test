#include <stdio.h>
#include <limits.h>
#include <float.h>


void print_bin(unsigned char a)
{
    int i = 0;
 
    for(i = 7; i >= 0; i--)//略去高位0.
    {
       if(a & (1 << i))
	   {
		  printf("1"); 
	   }
	   else
	   {
		   printf("0");
	   }
    }
	printf("\n");
}

void main()
{
	double a = 1000000000;
	double b = 1000000001;
	printf("float:%lf\n", a);
	printf("float:%lf\n", b);
	unsigned char *pa = (unsigned char *)&a;
	print_bin(pa[3]);
	print_bin(pa[2]);
	print_bin(pa[1]);
	print_bin(pa[0]);
	printf("float:%d\n", sizeof(float));
	printf("the FLOAT_MIN number is : %f\n",FLT_MIN);
	printf("the FLOAT_MAX number is : %f\n",FLT_MAX);
	
	printf("the INT_MAX number is : %d\n",INT_MAX);
	
	printf("char: %d\n", sizeof(char));
	printf("int: %d\n", sizeof(int));
	printf("short: %d\n", sizeof(short));
	printf("float: %d\n", sizeof(float));
	printf("double: %d\n", sizeof(double));
	printf("long: %d\n", sizeof(long));
	printf("long long: %d\n", sizeof(long long));
//	printf("the DLB_MAX number is : %f\n",DLB_MAX);
	printf("the LONG_MAX number is : %ld\n",LONG_MAX);
	printf("the LLONG_MAX number is : %lld\n",LLONG_MAX);
}
// 00111111 00011001 10011001 10011010

//00111111

//0 01111110 0011001 10011001 10011010  0.6

//0.25 0.01

//0.6 0.10

//0.5 0.25 0.125 0.0625 0.03125 0.015625 0.0078125 0.00390625
//1       0     0      1    1     0           0        1


//31536000
//2147483647
