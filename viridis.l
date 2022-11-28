/* Includes e Funções */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "viridis.tab.h"

    void yyerror();
%}

/* Expressẽos Regulares */
const_int               [0-9]+
const_float             [-+]?[0-9]+("."[0-9]+)
const_string            \"[^"]*\"
const_boolean           "true"|"false"
const_char              \'[^\']*\'
variavel                [a-zA-Z][a-zA-Z0-9]*
comentario_linha        \/\/.*\n
aritmeticos             ("+"|"-"|"*"|"/"|"%")
relacionais             ("<"|"<="|">"|">="|"=="|"!=")
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

"char" {
    return CHAR;
}

"^" {
    return ELEVADO;
}

"=" {
    return ATRIBUICAO;
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

{relacionais} {
    return RELACIONAIS;
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

{const_char} {
    yylval.char_val = yytext[0];
    return CONST_CHAR;
}

{const_string} {
    // yylval.string = malloc(yyleng * sizeof(char));
    // strcpy(yylval.string, yytext);
    sscanf(yytext, "%s", yylval.string);
    return CONST_STRING;
}

{const_boolean} {
    if (strcmp(yytext, "true") == 0) {
        yylval.num_int = 1;
    } else {
        yylval.num_int = 0;
    }
    return CONST_BOOLEAN;
}

{variavel} {
    sscanf(yytext, "%s", yylval.string);
    return VARIAVEL;
}

{comentario_linha} {
    return COMENTARIO_LINHA;
}

[ \t\n]                         ;

. {
    yyerror("Unrecognized Character!");
}

%%

int yywrap(){};