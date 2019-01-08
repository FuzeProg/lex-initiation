%{
    #include <stdio.h>
    #include <string.h>

    typedef struct Mot Mot;

    struct Mot {
        char* mot;
        int categorie;
        Mot *suivant;
    };

    typedef struct Dictionnaire Dictionnaire;

    struct Dictionnaire {
        Mot *premier;
    };

	//declaration fonctions inserer et rechercher
	//declaration de var
	// sujet verbe adverbe adjectif
%}
%%

[\t] ;

[a-zA-Z]+ 

\n|. ;


%%

    Dictionnaire *initialiser(){
        Dictionnaire *dictionnaire = malloc(sizeof(*dictionnaire));
        Mot *mot = malloc(sizeof(*mot));

        if (dictionnaire == NULL || mot == NULL){
            exit(EXIT_FAILURE);
        }

        mot->mot = NULL;
        mot->categorie = 0;
        mot->suivant = NULL;

        dictionnaire->premier = mot;

        return dictionnaire;
    }

    void insertion(Dictionnaire *dictionnaire){

        int i = 0;

        if(strcmp(yytext[i], "sujet")){

            i++;

            while(yytext[i] != NULL){

                Mot *mot = malloc(sizeof(*mot));

                if(dictionnaire == NULL || mot == NULL)
                    exit(EXIT_FAILURE);

                strcpy(yytext[i], mot->mot);
                mot->categorie = 1;
                mot->suivant = dictionnaire->premier;

                dictionnaire->premier = mot;
            }
        }
	}

	void recherche(char* mot){

	}

	void afficher(Dictionnaire *dictionnaire){
	    if(dictionnaire == NULL){
	        exit(EXIT_FAILURE);
	    }

	    Mot *actuel = dictionnaire->premier;

	    while(actuel != NULL){
	        printf("%s est dans la categorie %d", actuel->mot, actuel->categorie);
	        actuel = actuel->suivant;
	    }

	    printf("FIN");
	}

	int main(void){

	    yylex();

	    Dictionnaire *dictionnaire = initialiser();

        insertion(dictionnaire);

	    return 0;
	}