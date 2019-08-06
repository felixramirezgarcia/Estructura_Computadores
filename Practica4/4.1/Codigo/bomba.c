//Felix Ramirez Garcia
// gcc -Og bomba.c -o bomba -no-pie -fno-guess-branch-probability

#include <stdio.h>	// para printf(), fgets(), scanf()
#include <stdlib.h>	// para exit()
#include <string.h>	// para strncmp()
#include <sys/time.h>	// para gettimeofday(), struct timeval

#define SIZE 100
#define TLIM 60

void boom(void){
	printf(	"\n"
"*******************************\n"
"*********** BOOM!!! ***********\n"
"*******************************\n"                        
"              \\|/             \n"            
"            `--+--'            \n"            
"              /|\\             \n"            
"             ' | '             \n"            
"               |               \n"            
"               |               \n"            
"           ,--'#`--.           \n"            
"           |#######|           \n"            
"        _.-'#######`-._        \n"            
"     ,-'###############`-.     \n"            
"   ,'#####################`,   \n"            
"  /#########################|  \n"            
" |###########################| \n"            
"|#############################|\n"            
"|#############################|\n"            
"|#############################|\n"            
"|#############################|\n"            
" |###########################| \n"            
"  |#########################/  \n"            
"   `.#####################,'   \n"            
"     `._###############_,'     \n"            
"        `--..#####..--'        \n"
"\n"		
		);
	exit(-1);
}

void defused(void){
	printf(	"\n"
		"·························\n"
		"··· bomba desactivada ···\n"
		"·························\n"
		"\n");
	exit(0);
}

int password_chars(char *c){	//imposible
  int result = 0; // sepolibim
  char aux;

  // swap de encriptado
  if (c[1] == 'e') {
    aux  = c[7];
    c[7] = c[4];
    c[4] = aux;
  }else
   result++;

  // swap de encriptado
  if (c[3] == 'o') {
   	aux  = c[8];
    c[8] = c[1];
    c[1] = aux;
  }else
   result++;

  // swap de encriptado
  if (c[7] == 'l') {
   	aux  = c[4];
    c[4] = c[0];
    c[0] = aux;
  }else
   result++;

  if (c[0] != 'i' || c[1] != 'm' || c[2] != 'p' || c[3] != 'o' || c[4] != 's' || 
  	  c[5] != 'i' || c[6] != 'b' || c[7] != 'l' || c[8] != 'e' ){
		result++;
  }

  return result;
}

int password_number(int num){ //111
  if (num == 111){
	return 0;
  }
  else
	return 1;
}


int main(){
	char pw[SIZE];
	int  pc, n;

	struct timeval tv1,tv2;	// gettimeofday() secs-usecs

	//Tomar tiempo-----------------------------
	gettimeofday(&tv1,NULL);

	do	
		printf("\nIntroduce la contraseña: ");
	while (	fgets(pw, SIZE, stdin) == NULL );

	if(password_chars(pw))
	    boom();

	//Tomar tiempo y comprobar------------------
	gettimeofday(&tv2,NULL);
	if ( tv2.tv_sec - tv1.tv_sec > TLIM )
		boom();
	//------------------------------------------

	do{
		printf("\nIntroduce el pin: ");
	 	if ((n=scanf("%i",&pc))==0)
			scanf("%*s")    ==1;         
	}
	while (	n!=1 );

	if(password_number(pc))
	    boom();

	//Tomar tiempo y comprobar------------------
	gettimeofday(&tv1,NULL);
	if( tv1.tv_sec - tv2.tv_sec > TLIM )
	    boom();
	//------------------------------------------

	defused();
}
