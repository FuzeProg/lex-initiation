%{
    #include <string.h>
    #include <stdio.h>

    #define MAX 30

    int T[MAX];
%}
%%
[a-zA-Z]+ {T[strlen(yytext)]++;}
\n|. ;
%%
    void reset(){
        int i=0;
        for(i=0; i<MAX; i++){
            T[i] = 0;
        }
    }

    void afficher(){
        int i=0;
        for(i=0; i<MAX; i++){
            if(T[i]>0){
                printf("Il y a %d mots de %d lettres.\n", T[i], i);
            }
        }
    }

    int main(void){
        reset();
        yylex();
        afficher();
        return 0;
    }