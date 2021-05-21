#include <stdio.h>
#include <string.h>

#define COMMENT_SYMBOL "!"

int main(int argc, char const *argv[]){
  const char * comment_sym = COMMENT_SYMBOL;
  if(argc>1) comment_sym = argv[1];
  char line[1000];
  while(scanf("%1000[^\n]\n",line)==1){
  	if (!(strstr(line, comment_sym)))
	  printf("%s\n", line);
  }
  return 0;
}