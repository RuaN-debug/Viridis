/* Includes e Funções */
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "bison.tab.h"
%}

/* Expressẽos Regulares */
float             [-+]?[0-9]+("."[0-9]+)
variavel          [a-zA-Z][a-zA-Z0-9]*
string            \"[^"]*\"
comentario        \/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+\/
comentario_linha  \/\/.*\n
aritmeticos       ("+"|"-"|"*"|"/"|"%")
relacionais       ("<"|"<="|">"|">="|"=="|"!=")
logicos           ("and"|"&&"|"e")|("or"|"||"|"ou")|("not"|"!"|"~"|"nao")
int               [0-9]+

/* Tokens */
%%

"^" {
    return ELEVADO;
}

"=" {
    return ATRIBUICAO;
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

"void" {
    return VOID;
}

"boolean" {
    // yylval.num = atoi(yytext);
    return BOOLEAN;
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

{int} {
    yylval.num_int = atoi(yytext);
    return INT;
}

{float} {
    yylval.num_float = atof(yytext);
    return FLOAT;
}

{variavel} {
    // strncpy(yyval.pont->nome, yytext, 256);
    return VARIAVEL;
}

{string} {
    sscanf(yytext, "%s", yylval.name);
    return STRING;
}

{comentario_linha} {
    return COMENTARIO_LINHA;
}

{comentario} {
    return COMENTARIO;
}



%%

int yywrap(){};