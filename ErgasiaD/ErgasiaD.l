%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>


int start = 0;
int exitProg = 0;
int ok = 0;
int wrong = 0;

%}

VARIABLE [a-zA-Z0-9]*
TYPE "int"|"float"|"bool"|"char"|"string"
VAR "var"
OK "OK"
EXIT "EXIT"
%%



{VAR}(" ")+\n*(({VARIABLE}(" ")*(",")?)*(" ")*(":")(" ")*{TYPE}(";")(\n)*(" ")*)*  {start = 1;}


^{EXIT}? {return (exitProg = 1);}
^{OK}?   {return (ok = 1);}
\n       ;
.+       {wrong = 1;}



%%
int main(){

while (exitProg != 1){
    printf("\nEnter your variable decleration. \n");
    printf("Type 'EXIT' in empty line to exit.\n");
    printf("Type 'OK' when you finish the decleration. \n");
    yylex();
    while ((start != 1) && (exitProg != 1) && (ok != 1)){
        printf("\nWrong format. Please type again.\n");
        wrong = 0;
        yylex();
    }
    if(exitProg !=1){
        if ((start == 1) && (wrong == 0)){
            printf("\nYour variable decleration is OK. \n");
        }
        if (wrong == 1) {
            printf("\nNot valid decleration.\n");
        }
    }
}
  printf("\nThank you. Bye!\n");
  return 0;
}
