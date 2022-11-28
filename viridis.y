%{
    #include<stdio.h>
    #include<math.h>
    int yylex();
    int yyerror();
    #define YYERROR_VERBOSE 1
%}

%union{
    char char_val;
    char* string;
    float num_float;
    int num_int;
}

%token BOOLEAN FLOAT INT STRING VOID CHAR ELEVADO ABRE_PARENTESES FECHA_PARENTESES ERRO COMENTARIO_LINHA FOR WHILE IF ELSE ELIF OUTPUT INPUT RETURN INICIOBLOCO FIMBLOCO ARITMETICOS RELACIONAIS LOGICOS FIMLINHA MAIN ATRIBUICAO

%token<num_int> CONST_INT
%token<num_float> CONST_FLOAT
%token<string> CONST_STRING
%token<num_int> CONST_BOOLEAN
%token<char_val> CONST_CHAR

%token<string> VARIAVEL

%left ATRIBUICAO
%left AND OR NOT
%left '+' '-'
%left '*' '/'
%left NEGATIVO
%right ELEVADO

%start program

%%

program:
    declarations statements
;

declarations:
    declarations declaration
|   declaration
;

declaration:
    type names
;

type:
    INT
|   FLOAT
|   BOOLEAN
|   STRING
|   VOID
|   CHAR
;

names:
    VARIAVEL
|   VARIAVEL ATRIBUICAO constant;
;

constant:
    CONST_INT
|   CONST_FLOAT
|   CONST_STRING
|   CONST_BOOLEAN
|   CONST_CHAR

statements:
    statements statement
|   statement
;

statement:
    FIMLINHA
|   if_statement
|   while_statement
|   for_statement
|   print_statement
|   assignment_statement
;

if_statement:
    IF head_expression head_statement elif_statement else_statement
|   IF head_expression head_statement else_statement
;

elif_statement:
    elif_statement ELIF head_expression head_statement elif_statement
|   ELIF head_expression head_statement
;

else_statement:
|   ELSE head_statement
;

while_statement:
    WHILE head_expression head_statement
;

for_statement:
    FOR ABRE_PARENTESES assignment_statement ';' expression ';' assignment_statement FECHA_PARENTESES head_statement
;

print_statement:
    OUTPUT ABRE_PARENTESES "\"" expression  "\"" FECHA_PARENTESES
;

head_expression:
    ABRE_PARENTESES expression FECHA_PARENTESES
;

head_statement:
    INICIOBLOCO statement FIMBLOCO
;

assignment_statement:
    VARIAVEL ATRIBUICAO expression

expression:
    expression '+' expression
|   expression '-' expression
|   expression '*' expression
|   expression '/' expression
|   expression ELEVADO expression
|   '-' expression %prec NEGATIVO
|   ABRE_PARENTESES expression FECHA_PARENTESES
|   VARIAVEL
|   constant
;

%%

int yyerror(char *s){
    fprintf(stderr, "Parse Error: %s\n", s);
	return 1;
}

int main(){
    return yyparse();
}