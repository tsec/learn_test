
limits.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <print_bin>:
#include <limits.h>
#include <float.h>


void print_bin(unsigned char a)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 20          	sub    $0x20,%rsp
   8:	89 f8                	mov    %edi,%eax
   a:	88 45 ec             	mov    %al,-0x14(%rbp)
    int i = 0;
   d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 
    for(i = 7; i >= 0; i--)//略去高位0.
  14:	c7 45 fc 07 00 00 00 	movl   $0x7,-0x4(%rbp)
  1b:	eb 2e                	jmp    4b <print_bin+0x4b>
    {
       if(a & (1 << i))
  1d:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
  21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  24:	89 c1                	mov    %eax,%ecx
  26:	d3 fa                	sar    %cl,%edx
  28:	89 d0                	mov    %edx,%eax
  2a:	83 e0 01             	and    $0x1,%eax
  2d:	85 c0                	test   %eax,%eax
  2f:	74 0c                	je     3d <print_bin+0x3d>
	   {
		  printf("1"); 
  31:	bf 31 00 00 00       	mov    $0x31,%edi
  36:	e8 00 00 00 00       	callq  3b <print_bin+0x3b>
  3b:	eb 0a                	jmp    47 <print_bin+0x47>
	   }
	   else
	   {
		   printf("0");
  3d:	bf 30 00 00 00       	mov    $0x30,%edi
  42:	e8 00 00 00 00       	callq  47 <print_bin+0x47>

void print_bin(unsigned char a)
{
    int i = 0;
 
    for(i = 7; i >= 0; i--)//略去高位0.
  47:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  4b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  4f:	79 cc                	jns    1d <print_bin+0x1d>
	   else
	   {
		   printf("0");
	   }
    }
	printf("\n");
  51:	bf 0a 00 00 00       	mov    $0xa,%edi
  56:	e8 00 00 00 00       	callq  5b <print_bin+0x5b>
}
  5b:	c9                   	leaveq 
  5c:	c3                   	retq   

000000000000005d <main>:

void main()
{
  5d:	55                   	push   %rbp
  5e:	48 89 e5             	mov    %rsp,%rbp
  61:	48 83 ec 30          	sub    $0x30,%rsp
	double a = 1000000000;
  65:	48 b8 00 00 00 00 65 	movabs $0x41cdcd6500000000,%rax
  6c:	cd cd 41 
  6f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	double b = 1000000001;
  73:	48 b8 00 00 80 00 65 	movabs $0x41cdcd6500800000,%rax
  7a:	cd cd 41 
  7d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
	printf("float:%lf\n", a);
  81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  85:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  89:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  8e:	bf 00 00 00 00       	mov    $0x0,%edi
  93:	b8 01 00 00 00       	mov    $0x1,%eax
  98:	e8 00 00 00 00       	callq  9d <main+0x40>
	printf("float:%lf\n", b);
  9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  a1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  a5:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
  aa:	bf 00 00 00 00       	mov    $0x0,%edi
  af:	b8 01 00 00 00       	mov    $0x1,%eax
  b4:	e8 00 00 00 00       	callq  b9 <main+0x5c>
	unsigned char *pa = (unsigned char *)&a;
  b9:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  bd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	print_bin(pa[3]);
  c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  c5:	48 83 c0 03          	add    $0x3,%rax
  c9:	0f b6 00             	movzbl (%rax),%eax
  cc:	0f b6 c0             	movzbl %al,%eax
  cf:	89 c7                	mov    %eax,%edi
  d1:	e8 00 00 00 00       	callq  d6 <main+0x79>
	print_bin(pa[2]);
  d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  da:	48 83 c0 02          	add    $0x2,%rax
  de:	0f b6 00             	movzbl (%rax),%eax
  e1:	0f b6 c0             	movzbl %al,%eax
  e4:	89 c7                	mov    %eax,%edi
  e6:	e8 00 00 00 00       	callq  eb <main+0x8e>
	print_bin(pa[1]);
  eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  ef:	48 83 c0 01          	add    $0x1,%rax
  f3:	0f b6 00             	movzbl (%rax),%eax
  f6:	0f b6 c0             	movzbl %al,%eax
  f9:	89 c7                	mov    %eax,%edi
  fb:	e8 00 00 00 00       	callq  100 <main+0xa3>
	print_bin(pa[0]);
 100:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 104:	0f b6 00             	movzbl (%rax),%eax
 107:	0f b6 c0             	movzbl %al,%eax
 10a:	89 c7                	mov    %eax,%edi
 10c:	e8 00 00 00 00       	callq  111 <main+0xb4>
	printf("float:%d\n", sizeof(float));
 111:	be 04 00 00 00       	mov    $0x4,%esi
 116:	bf 00 00 00 00       	mov    $0x0,%edi
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
 120:	e8 00 00 00 00       	callq  125 <main+0xc8>
	printf("the FLOAT_MIN number is : %f\n",FLT_MIN);
 125:	48 b8 00 00 00 00 00 	movabs $0x3810000000000000,%rax
 12c:	00 10 38 
 12f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 133:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
 138:	bf 00 00 00 00       	mov    $0x0,%edi
 13d:	b8 01 00 00 00       	mov    $0x1,%eax
 142:	e8 00 00 00 00       	callq  147 <main+0xea>
	printf("the FLOAT_MAX number is : %f\n",FLT_MAX);
 147:	48 b8 00 00 00 e0 ff 	movabs $0x47efffffe0000000,%rax
 14e:	ff ef 47 
 151:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 155:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
 15a:	bf 00 00 00 00       	mov    $0x0,%edi
 15f:	b8 01 00 00 00       	mov    $0x1,%eax
 164:	e8 00 00 00 00       	callq  169 <main+0x10c>
	
	printf("the INT_MAX number is : %d\n",INT_MAX);
 169:	be ff ff ff 7f       	mov    $0x7fffffff,%esi
 16e:	bf 00 00 00 00       	mov    $0x0,%edi
 173:	b8 00 00 00 00       	mov    $0x0,%eax
 178:	e8 00 00 00 00       	callq  17d <main+0x120>
	
	printf("char: %d\n", sizeof(char));
 17d:	be 01 00 00 00       	mov    $0x1,%esi
 182:	bf 00 00 00 00       	mov    $0x0,%edi
 187:	b8 00 00 00 00       	mov    $0x0,%eax
 18c:	e8 00 00 00 00       	callq  191 <main+0x134>
	printf("int: %d\n", sizeof(int));
 191:	be 04 00 00 00       	mov    $0x4,%esi
 196:	bf 00 00 00 00       	mov    $0x0,%edi
 19b:	b8 00 00 00 00       	mov    $0x0,%eax
 1a0:	e8 00 00 00 00       	callq  1a5 <main+0x148>
	printf("short: %d\n", sizeof(short));
 1a5:	be 02 00 00 00       	mov    $0x2,%esi
 1aa:	bf 00 00 00 00       	mov    $0x0,%edi
 1af:	b8 00 00 00 00       	mov    $0x0,%eax
 1b4:	e8 00 00 00 00       	callq  1b9 <main+0x15c>
	printf("float: %d\n", sizeof(float));
 1b9:	be 04 00 00 00       	mov    $0x4,%esi
 1be:	bf 00 00 00 00       	mov    $0x0,%edi
 1c3:	b8 00 00 00 00       	mov    $0x0,%eax
 1c8:	e8 00 00 00 00       	callq  1cd <main+0x170>
	printf("double: %d\n", sizeof(double));
 1cd:	be 08 00 00 00       	mov    $0x8,%esi
 1d2:	bf 00 00 00 00       	mov    $0x0,%edi
 1d7:	b8 00 00 00 00       	mov    $0x0,%eax
 1dc:	e8 00 00 00 00       	callq  1e1 <main+0x184>
	printf("long: %d\n", sizeof(long));
 1e1:	be 08 00 00 00       	mov    $0x8,%esi
 1e6:	bf 00 00 00 00       	mov    $0x0,%edi
 1eb:	b8 00 00 00 00       	mov    $0x0,%eax
 1f0:	e8 00 00 00 00       	callq  1f5 <main+0x198>
	printf("long long: %d\n", sizeof(long long));
 1f5:	be 08 00 00 00       	mov    $0x8,%esi
 1fa:	bf 00 00 00 00       	mov    $0x0,%edi
 1ff:	b8 00 00 00 00       	mov    $0x0,%eax
 204:	e8 00 00 00 00       	callq  209 <main+0x1ac>
//	printf("the DLB_MAX number is : %f\n",DLB_MAX);
	printf("the LONG_MAX number is : %ld\n",LONG_MAX);
 209:	48 be ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rsi
 210:	ff ff 7f 
 213:	bf 00 00 00 00       	mov    $0x0,%edi
 218:	b8 00 00 00 00       	mov    $0x0,%eax
 21d:	e8 00 00 00 00       	callq  222 <main+0x1c5>
	printf("the LLONG_MAX number is : %lld\n",LLONG_MAX);
 222:	48 be ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rsi
 229:	ff ff 7f 
 22c:	bf 00 00 00 00       	mov    $0x0,%edi
 231:	b8 00 00 00 00       	mov    $0x0,%eax
 236:	e8 00 00 00 00       	callq  23b <main+0x1de>
}
 23b:	c9                   	leaveq 
 23c:	c3                   	retq   
