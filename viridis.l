/* Includes e Funções */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "viridis.tab.h"

    char* buildString(const char* token, int token_length);
    void yyerror();
%}

/* Expressẽos Regulares */
const_int               [0-9]+
const_float             [0-9]+("."[0-9]+)
const_string            \"[^\"]*\"
const_boolean           "true"|"false"
variavel                [a-zA-Z][a-zA-Z0-9]*
comentario_linha        \/\/.*\n
aritmeticos             ("+"|"-"|"*"|"/"|"%")
logicos                 ("and"|"&&"|"e")|("or"|"||"|"ou")|("not"|"!"|"~"|"nao")

/* Tokens */
%%

"boolean" {
    return BOOLEAN;
}

"float" {
    return FLOAT;
}

"int" {
    return INT;
}

"string" {
    return STRING;
}

"void" {
    return VOID;
}

"^" {
    return ELEVADO;
}

"=" {
    return ATRIBUICAO;
}

"==" {
    return IGUAL;
}

"!=" {
    return DIFERENTE;
}

"<" {
    return MENOR;
}

"<=" {
    return MENOR_IGUAL;
}

">" {
    return MAIOR;
}

">=" {
    return MAIOR_IGUAL;
}

"(" {
    return ABRE_PARENTESES;
}

")" {
    return FECHA_PARENTESES;
}

"for" {
    return FOR;
}

"if" {
    return IF;
}

"elif" {
    return ELIF;
}

"else" {
    return ELSE;
}

"while" {
    return WHILE;
}

"verde" {
    return INPUT;
}

"maduro" {
    return OUTPUT;
}

"return" {
    return RETURN;
}

"{" {
    return INICIOBLOCO;
}

"}" {
    return FIMBLOCO;
}

"main" {
    return MAIN;
}

\n {
    return FIMLINHA;
}

{aritmeticos} {
    return *yytext;
}

{logicos} {
    return LOGICOS;
}

{const_int} {
    yylval.num_int = atoi(yytext);
    return CONST_INT;
}

{const_float} {
    yylval.num_float = atof(yytext);
    return CONST_FLOAT;
}

{const_string} {
    yylval.string = buildString(yytext + 1, yyleng - 2);
    return CONST_STRING;
}

{const_boolean} {
    if(__builtin_types_compatible_p(typeof(yytext), float)) {
        if (strcmp(yytext, "true") == 0) {
            yylval.num_float = 1.0;
        } else {
            yylval.num_float = 0.0;
        }
        return CONST_BOOLEAN_FLOAT;
    }else if(__builtin_types_compatible_p(typeof(yytext), int)) {
        if (strcmp(yytext, "true") == 0) {
            yylval.num_int = 1;
        } else {
            yylval.num_int = 0;
        }
        return CONST_BOOLEAN_INT;
    }else if(__builtin_types_compatible_p(typeof(yytext), char*)) {
        if (strcmp(yytext, "true") == 0) {
            yylval.string = "true";
        } else {
            yylval.string = "false";
        }
        return CONST_BOOLEAN_STRING;
    }
}

{variavel} {
    return *yytext;
}

{comentario_linha} {
    return COMENTARIO_LINHA;
}

[ \t\n]                         ;

. {
    yyerror("Unrecognized Character!");
}

%%

char* buildString(const char* token, int token_length) {
    char* string = malloc((token_length + 1) * sizeof(char));

    if (!string) { 
        printf("Error: Memory Alocation Failed!");
    }

    memcpy(string, token, token_length);
    string[token_length] = 0;
    return string;
}

int yywrap(){};