#include <stdio.h>		
#include <stdlib.h>		
#include <sys/time.h>

#define WSIZE (8*sizeof(int))

#ifndef TEST 
#define TEST 5 
#endif 

//------------------------------------------
#if TEST==1 
    #define SIZE 4
    unsigned lista[SIZE]={0x80000000, 0x00400000, 0x00000200, 0x00000001};   
    #define RESULT 4 
//------------------------------------------
#elif TEST==2 
    #define SIZE 8
    unsigned lista[SIZE]={0x7fffffff, 0xffefffff, 0xfffff7ff, 0xfffffffe, 0x01000024, 0x00356700, 0x8900ac00, 0x00bd00ef};   
    #define RESULT 156
//------------------------------------------
#elif TEST==3
    #define SIZE 8
    unsigned lista[SIZE]={0x0	   , 0x10204080, 0x3590ac06, 0x70b0d0e0, 0xffffffff ,0x12345678, 0x9abcdef0, 0xcafebeef};   
    #define RESULT 116
//------------------------------------------
#elif TEST==4 || TEST==0 
    #define NBITS 20
    #define SIZE (1<<NBITS)
    unsigned lista[SIZE];
    #define RESULT (NBITS*(1<<NBITS-1))
//------------------------------------------
#else 
    #error "Definir TEST entre 0..4" 
#endif

// Primera version del popcount: recorremos array y bits con for
unsigned popcount1(int* array, int len){

	int i;
	int j;
	unsigned result = 0;
	unsigned x;

	for(i = 0; i < len; i++) {	      		    // Para todos los números del vector:
		x = array[i];					      	// Extraemos un número

		for(j = 0; j < WSIZE; j++){    	    	// Recorremos todos los bits del número.
			unsigned mascara = 1 << j; 			// Extraemos los bits con una máscara 0x1
			result += (x & mascara) != 0; 		// Vamos acumulando el resultado
		}
	}
	return result;
}

// Segunda version del popcount: recorremos array con for y bits con while
unsigned popcount2(int* array, int len){

	int i;
	unsigned x;
	unsigned result = 0;

	for(i = 0; i < len; i++) {    // Recorremos el vector
		x = array[i];			  // Extraemos un número

		while (x) {			  // Recorremos todos los bits de dicho número
			result += x&0x1; 	  // Extraemos los bits con una máscara 0x1 y
								  // los acumulamos en el contador "resultado"
			x >>= 1;			  // Realizamos el desplazamiento de bits a la dcha
		}
	}

	return result;
}

// Tercera version del popcount: recorremos el array con for y bits con asm (orden adc)
unsigned popcount3(unsigned *array, int len){

	int i;
  	unsigned result = 0;
  	unsigned x;

  	for(i = 0; i < len; i++){
   		x = array[i];
    	asm(
            "                       \n"
            "ini3:				  \n\t"	   	// Seguiremos mientras num != 0
            "shr  %[x]			  \n\t"	   	// LSB en CF
            "adc  $0, 	%[result] \n\t"	   	// Acumulamos el acarreo
            "test %[x], %[x]	  \n\t"	   	// Comprobamos si num != 0
            "jnz  ini3			  \n\t"	   	// Hacemos el salto si quedan bits a 1
            : [result]"+r" (result)			// E/S: añadir lo acumulado por el momento
            : [x] "r" (x)  			   		// entrada: valor elemento
		);
    }

  	return result;
}


// Quinta versión del popcount: recorremos con for anidado y la suma en arbol
unsigned popcount5(unsigned *array, int len){

	int i;
	int j;
	unsigned val = 0;
  	unsigned result = 0;
  	unsigned x;

  	for(i = 0; i < len; i++){     // Recorremos el vector
	  	x = array[i];			  // Escogemos un numero del vector

    	for(j = 0; j < 8; j++){	      // Recorremos los bytes
            val += x & 0x01010101;	  // Acumulamos los bits de cada byte recorrido
            x >> 1;					  // Realizamos el desplazamiento a la dcha
    	}

    	val += (val >> 16);		  // Volvemos a acumular en "valor" mientras desplazamos
    	val += (val >> 8);		  // Volvemos a acumular en "valor" mientras desplazamos

    	result += (val & 0xFF);   // Acumulamos todo en "resultado"
    	val = 0; 			 	  // Volvemos a poner a cero la variable valor
								  // y volvemos a empezar el bucle
   }

	return result;
}

// Sexta version del popcount: version naive de Wikipedia aplicada a array
int popcount64a(unsigned x) {     
    x = (x & 0x5555555555555555 ) + ((x >>  1) & 0x5555555555555555 ); //put count of each  2 bits into those  2 bits      
    x = (x & 0x3333333333333333 ) + ((x >>  2) & 0x3333333333333333 ); //put count of each  4 bits into those  4 bits     
    x = (x & 0x0f0f0f0f0f0f0f0f ) + ((x >>  4) & 0x0f0f0f0f0f0f0f0f ); //put count of each  8 bits into those  8 bits      
    x = (x & 0x00ff00ff00ff00ff ) + ((x >>  8) & 0x00ff00ff00ff00ff ); //put count of each 16 bits into those 16 bits      
    x = (x & 0x0000ffff0000ffff ) + ((x >> 16) & 0x0000ffff0000ffff ); //put count of each 32 bits into those 32 bits      
    x = (x & 0x00000000ffffffff ) + ((x >> 32) & 0x00000000ffffffff ); //put count of each 64 bits into those 64 bits      
    
    return x; 
} 

unsigned popcount6(unsigned *array, int len){

    int i;
    unsigned result = 0;
    unsigned x;

    for(i = 0; i < len; i++){     // Recorremos el vector
        x = array[i];
        result += popcount64a(x);
    }

    return result;
}

// Septima version del popcount: version naive de Wikipedia aplicada a array con desenrollado de bucle
unsigned popcount7(unsigned *array, int len){

    int i;
    unsigned result = 0;
    unsigned x1, x2, x3, x4;

    for(i = 0; i < len; i+=4){     // Recorremos el vector
        x1 = array[i];
        x2 = array[i+1];
        x3 = array[i+2];
        x4 = array[i+3];
        result += popcount64a(x1) + popcount64a(x2) + popcount64a(x3) + popcount64a(x4);
    }

    return result;
}

// Octava versión del popcount: SSE3
unsigned popcount8 (unsigned *array, int len){

	int i;
  	unsigned val;
	unsigned result = 0;
  	int SSE_mascara[] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f};
  	int SSE_LUTb[] = {0x02010100, 0x03020201, 0x03020201, 0x04030302};

  	if (len & 0x3)
   	printf("leyendo 128b pero len no multiplo de 4?\n");

    	for (i = 0; i < len; i += 4){
      	asm(
			"movdqu 	%[x], 	%%xmm0 	\n\t"
        	"movdqa		%%xmm0, %%xmm1	\n\t"	// Creamos dos copias de x
        	"movdqu 	%[m], 	%%xmm6	\n\t"	// Creamos la máscara
        	"psrlw		$4, 	%%xmm1 	\n\t"
        	"pand 		%%xmm6, %%xmm0	\n\t"	// xmm0 - nibbles inferiores
        	"pand		%%xmm6, %%xmm1	\n\t"	// xmm1 - nibbles superiores

        	"movdqu		%[l],	%%xmm2	\n\t"	// ...como pshufb sobrescribe LUT
        	"movdqa		%%xmm2, %%xmm3	\n\t"	// ...queremos 2 copias
        	"pshufb		%%xmm0,	%%xmm2	\n\t"	// xmm2 = vector popcount inferiores
        	"pshufb		%%xmm1,	%%xmm3	\n\t"	// xmm3 = vector popcount superiores

        	"paddb		%%xmm2, %%xmm3	\n\t"	// xmm2 += xmm3 - vector popcount bytes
        	"pxor		%%xmm0, %%xmm0	\n\t"	// xmm0 = 0,0,0,0
        	"psadbw		%%xmm0, %%xmm3	\n\t"	// xmm3 = [pcnt bytes0..7|pcnt bytes8..15]
        	"movhlps	%%xmm3,	%%xmm0	\n\t"	// xmm0 = [	0 		  |pcnt bytes0..7]
        	"paddd		%%xmm3,	%%xmm0	\n\t"	// xmm0 = [	no usado  |pcnt bytes0..15]
        	"movd 		%%xmm0, %[val]\n\t"
        	: [val]"=r" (val)
        	: [x]  "m"	(array[i]),
        	[m]  "m"	(SSE_mascara[0]),
        	[l]  "m"	(SSE_LUTb[0])
        	);
        	result += val;
      }

      return result;
}

// Novena versión del popcount: implementando la instruccion SSE4
unsigned popcount9 (unsigned *array, int len){
    unsigned x;
	int i;
  	unsigned val;
	unsigned result = 0;

    for (i = 0; i < len; i++){
         x = array[i];
        asm(
            "popcnt     %[x],   %[val] 	\n\t"
            : [val]"=r" (val)
            : [x]  "r"	(x)
        );

        result += val;
    }

    return result;
}

//Decima versión del popcount, implementando la instruccion SSE4 con desenrollado
unsigned popcount10 (unsigned *array, int len){
    unsigned x1,x2,x3,x4;
	int i;
  	unsigned val1,val2,val3,val4;
	unsigned result = 0;

    for (i = 0; i < len; i+=4){
         x1 = array[i];
         x2 = array[i+1];
         x3 = array[i+2];
         x4 = array[i+3];
        asm(
            "popcnt     %[x1],   %[val1] 	\n\t"
            "popcnt     %[x2],   %[val2] 	\n\t"
            "popcnt     %[x3],   %[val3] 	\n\t"
            "popcnt     %[x4],   %[val4] 	\n\t"
            : [val1]"=r" (val1),
            [val2]"=r" (val2),
            [val3]"=r" (val3),
            [val4]"=r" (val4)
            : [x1]  "r"	(x1),
            [x2]  "r"	(x2),
            [x3]  "r"	(x3),
            [x4]  "r"	(x4)
        );

        result += val1 + val2 +val3 +val4;
    }
      return result;
}

// Funcion cronometro para calcular los tiempos
void crono(unsigned (*func)(), char* msg){

    struct timeval tv1,tv2;		// gettimeofday() secs-usecs
    long tv_usecs;			    // y sus cuentas

    gettimeofday(&tv1, NULL);
    unsigned resultado = func(lista, SIZE);
    gettimeofday(&tv2, NULL);

    tv_usecs = (tv2.tv_sec - tv1.tv_sec )*1E6 + (tv2.tv_usec - tv1.tv_usec);

	#if TEST==0
        printf(    "%ld" "\n",      tv_usecs); 
    #else     
        printf("resultado = %d\t", resultado);     
        printf("%s:%9ld us\n", msg, tv_usecs); 
    #endif 
}

//Funcion main que cronometra los tiempos de todas las funciones
int main(){

	#if TEST==0 || TEST==4     
    size_t i;     // inicializar array     
    for (i=0; i<SIZE; i++)   
        lista[i]=i; 
    #endif 

	crono(popcount1, "popcount1, lenguaje C - for");
	crono(popcount2, "popcount2, lenguaje C - while");
	crono(popcount3, "popcount3, leng.ASM-body while 4i");
	crono(popcount5, "popcount5, CS:APP2e 3.49-group 8b");
    crono(popcount6, "popcount6, Wikipedia- naive - 32b");
    crono(popcount7, "popcount7, Wikipedia- naive - 128b");
	crono(popcount8, "popcount8, asm SSE3 - pshufb 128b");
    crono(popcount9, "popcount9, asm SSE4 - pshufb 32b");
    crono(popcount10, "popcount10, asm SSE4 - pshufb 128b");

    
    #if TEST != 0     
        printf("calculado = %d\n", RESULT); 
    #endif 

    exit(0);
}