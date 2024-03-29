// 9.- gcc suma_09_Casm.c -o suma_09_Casm -O / -Og -g

#include <stdio.h>		// para printf()
#include <stdlib.h>		// para exit()
#include <sys/time.h>		// para gettimeofday(), struct timeval

#define SIZE (1<<16) 		// tamaño suficiente para tiempo apreciable
//int lista[SIZE];

int resultado=0;
unsigned lista[SIZE]={0x80000000, 0x00400000, 0x00000200, 0x00000001};
unsigned lista[SIZE]={0x7fffffff, 0xffbfffff, 0xfffffdff, 0xfffffffe, 0x01000023, 0x00456700, 0x8900ab00, 0x00cd00ef};
unsigned lista[SIZE]={0x0 , 0x01020408, 0x35906a0c, 0x70b0d0e0, 0xffffffff, 0x12345678, 0x9abcdef0, 0xdeadbeef};

int suma1(int* array, int len)
{
    int  i,   res=0;
    for (i=0; i<len; i++)
	 res += array[i];
    return res;
}

int suma2(int* array, int len)
{
    int  i,   res=0;
    for (i=0; i<len; i++)
//	 res += array[i]; 		// traducir sólo esta línea a ASM
    asm("add (%[a],%[i],4),%[r]"
     :	[r] "+r"     (res)		// output-input
     :	[i]  "r" ((long)i),		// input
	[a]  "r"   (array)
//   : "cc"				// clobber
    );
    return res;
}

int suma3(int* array, int len)
{
  asm(" mov  $0, %%eax		\n"	// EAX – gcc salva-invocante
"	mov  $0, %%rdx		\n"	// RDX – gcc salva-invocante
"bucle:				\n"
"	add  (%%rdi,%%rdx,4), %%eax\n"
"	inc   %%rdx		\n"
"	cmp   %%rdx,%%rsi	\n"
"	jne    bucle		  "
     : 					// output
     : 					// input
     : "cc",				// clobber – como usamos sintaxis extendida
       "rax","rdx"			// hay que referirse a los registros con %%
    );
}

void crono(int (*func)(), char* msg){
    struct timeval tv1,tv2; 			// gettimeofday() secs-usecs
    long           tv_usecs;			// y sus cuentas

    gettimeofday(&tv1,NULL);
    resultado = func(lista, SIZE);
    gettimeofday(&tv2,NULL);

    tv_usecs=(tv2.tv_sec -tv1.tv_sec )*1E6+
             (tv2.tv_usec-tv1.tv_usec);
    printf("resultado = %d\t", resultado);
    printf("%s:%9ld us\n", msg, tv_usecs);
}

int main()
{
    int i;					// inicializar array
    for (i=0; i<SIZE; i++)			// se queda en cache
	 lista[i]=i;

    crono(suma1, "suma1 (en lenguaje C    )");
    crono(suma2, "suma2 (1 instrucción asm)");
    crono(suma3, "suma3 (bloque asm entero)");
    printf("N*(N+1)/2 = %d\n", (SIZE-1)*(SIZE/2)); /*OF*/

    exit(0);
}
