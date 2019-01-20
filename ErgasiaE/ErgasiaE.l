%{
#include <string.h>
#include <stdio.h>
#include<stdlib.h>

int finish = 0;
int count = 0;
int shape = 0;
int check = 0;
int wrong = 0;
int a = 0 ;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int temp = 0;
int found = 0;
char answer[100] = {""};
char valid [] = {"a""A""b""B""c""C""d""D""e""E"};
%}


%%


.                wrong = 1;

"exit"           return (finish = 1);
\n                      {if (wrong ==1){
                              printf("\nNot valid shape and sides please try again \n");
                              printf("\nPlease give your shape and sides. \n");
                              printf("YOU CAN TYPE 'end' IN A EMPTY LINE ANYTIME TO EXIT. \n\n");
                                  }
                                  wrong = 0;
                                    return (finish = 0);
}
("dinetai")(" ")*("trigono"|"tetragono"|"gonia")(" ")*(([a-eA-E][a-eA-E].*)|([a-eA-E][a-eA-E][a-eA-E].*)|([a-eA-E][a-eA-E][a-eA-E][a-eA-E].*)) {
                                                              while (check !=2){
                                                              if(wrong ==0){
                                                                if(check !=1){
                                                                  for (int i =0; i<=strlen(yytext); i++ ){
                                                                    answer[i] = yytext[i];
                                                                   }
                                                                 }
                                                                 for (int i =0; i<=strlen(yytext); i++ ){
                                                                   if(check ==1){
                                                                     if(i<=6){
                                                                       printf("%c",answer[i]);
                                                                      }
                                                                     if (i==7){
                                                                       if(check ==1){
                                                                         printf(" : Verb \n");
                                                                       }
                                                                      }
                                                                  }

                                                               if(i>7){
                                                                while(strncmp (&answer[i]," ",1) == 0){
                                                                i++;
                                                                }

                                                                while(strncmp (&answer[i]," ",1) != 0){
                                                                  if (count ==1){
                                                                    if (strncmp (&answer[i],"o",1) == 0){
                                                                      shape =2;
                                                                      }
                                                                    if (strncmp (&answer[i],"r",1) == 0){
                                                                      shape = 3;
                                                                      }
                                                                    if (strncmp (&answer[i],"e",1) == 0){
                                                                      shape = 4;
                                                                    }
                                                                }
                                                                if(check ==1){
                                                                  printf("%c",answer[i]);
                                                                }
                                                                i++;
                                                                count ++;
                                                                }
                                                                if(check ==1){
                                                                  printf(" : Geometrical entity \n");
                                                                }
                                                                count = 0;
                                                                while(strncmp (&answer[i]," ",1) == 0){
                                                                  i++;
                                                                }
                                                                temp = i+(shape-1);
                                                                found = 0;

                                                                for (int c = i; c<temp; c++){
                                                                  if((strncmp (&answer[temp],"a",1) == 0)||(strncmp (&answer[temp],"A",1) == 0))
                                                                    {
                                                                      if(a ==0){
                                                                       a =1;
                                                                       }
                                                                       if (a==1){
                                                                       check =2;
                                                                       wrong =1;
                                                                       }
                                                                    }
                                                                  if((strncmp (&answer[temp],"b",1) == 0)||(strncmp (&answer[temp],"B",1) == 0))
                                                                    {
                                                                    if(b ==0){
                                                                       b = 1;
                                                                       }
                                                                   if (b==1){
                                                                   check =2;
                                                                   wrong =1;
                                                                   }
                                                                    }
                                                                  if((strncmp (&answer[temp],"c",1) == 0)||(strncmp (&answer[temp],"C",1) == 0))
                                                                    {
                                                                    if (c==0){
                                                                      c = 1;
                                                                      }
                                                                    if (c==1){
                                                                    check =2;
                                                                    wrong =1;
                                                                    }
                                                                    }
                                                                  if((strncmp (&answer[temp],"d",1) == 0)||(strncmp (&answer[temp],"D",1) == 0))
                                                                      {
                                                                      if (d ==0){
                                                                        d = 1;
                                                                        }
                                                                      if (d==1){
                                                                      check =2;
                                                                      wrong =1;
                                                                      }
                                                                      }
                                                                  if((strncmp (&answer[temp],"e",1) == 0)||(strncmp (&answer[temp],"E",1) == 0))
                                                                        {
                                                                        if(e==0){
                                                                          e = 1;
                                                                          }
                                                                        if (e==1){
                                                                        check =2;
                                                                        wrong =1;
                                                                        }
                                                                        }
                                                                }
                                                                if((check!=2) &&(wrong!=1)){
                                                                while ((strncmp (&answer[i]," ",1) != 0) && (answer[i] != (char) 0)){

                                                                if(check ==1){
                                                                printf("%c",answer[i]);
                                                                }
                                                                i++;
                                                                count++;
                                                                }

                                                                for (int k = 0; k<strlen(valid); k++){
                                                                if ((strncmp (&answer[temp],&valid[k],1) == 0)) {
                                                                found = 1;

                                                                }
                                                                }
                                                                if(found ==0){
                                                                wrong = 1;
                                                                check = 2;
                                                                }
                                                                if(found ==1){
                                                                if(count < shape) {
                                                                 check =2;
                                                                 printf("Sides and geometrical entity type don't match \n \n");
                                                                 printf("\nPlease give your shape and sides. \n");
                                                                 printf("YOU CAN TYPE 'end' IN A EMPTY LINE ANYTIME TO EXIT. \n\n");
                                                                 return 0;
                                                                }
                                                                if (count > shape){
                                                                  check = 2;
                                                                  wrong = 1;

                                                                }
                                                                if(check ==1){
                                                                printf(" : Name of geometrical entity \n \n");
                                                                printf("\nPlease give your shape and sides. \n");
                                                                printf("YOU CAN TYPE 'end' IN A EMPTY LINE ANYTIME TO EXIT. \n\n");
                                                                return 0;
                                                                }
                                                                if (count == shape){
                                                                  check = 1;
                                                                }
                                                                }
                                                                }
                                                                }
                                                                }

                                                              }
                                                              }


}




%%
int main(){
printf("\nPlease give your shape and sides. \n");
printf("YOU CAN TYPE 'end' IN A EMPTY LINE ANYTIME TO EXIT. \n\n");
    while(finish == 0){

    for (int i =0; i<100; i++ ){
    answer[i] = (char) 0;
    }
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    temp = 0;
    found = 0;
    wrong = 0;
    check = 0;
    count = 0;
    shape = 0;
    yylex();
    }

    return 0;
}
