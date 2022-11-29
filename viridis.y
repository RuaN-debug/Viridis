%{
    #include<stdio.h>
    #include<string.h>
    #include<math.h>
    int yylex();
    int yyerror();

    extern FILE *yyin;
    #define YYERROR_VERBOSE 1
%}

%union{
    char* string;
    float num_float;
    int num_int;
}

%token BOOLEAN FLOAT INT STRING VOID ELEVADO ABRE_PARENTESES FECHA_PARENTESES ERRO COMENTARIO_LINHA FOR WHILE IF ELSE ELIF OUTPUT INPUT RETURN INICIOBLOCO FIMBLOCO ARITMETICOS RELACIONAIS LOGICOS FIMLINHA MAIN ATRIBUICAO PONTO IGUAL DIFERENTE MAIOR MENOR MAIOR_IGUAL MENOR_IGUAL AND OR NOT

%token<num_int> CONST_INT CONST_BOOLEAN_INT
%token<num_float> CONST_FLOAT CONST_BOOLEAN_FLOAT
%token<string> CONST_STRING CONST_BOOLEAN_STRING

%type<num_int> int_expression boolean_expression_int
%type<num_float> float_expression boolean_expression_float
%type<string> string_expression boolean_expression_string

%token VARIAVEL

%left ABRE_PARENTESES FECHA_PARENTESES INICIOBLOCO FIMBLOCO
%left AND OR NOT
%left MAIOR MENOR ATRIBUICAO MAIOR_IGUAL MENOR_IGUAL IGUAL DIFERENTE
%left '+' '-'
%left '*' '/'
%left NEGATIVO
%right ELEVADO

%start program

%%

program:
|   program line
;

line: 
    statement FIMLINHA 
|   FIMLINHA
;

statement:
    print_statement
|   if_statement
|   while_statement
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

head_expression:
    ABRE_PARENTESES expression FECHA_PARENTESES
;

head_statement:
    INICIOBLOCO FIMLINHA statement FIMLINHA FIMBLOCO
;

expression:
    boolean_expression_int
|   boolean_expression_float
|   boolean_expression_string
;

print_statement: 
    OUTPUT ABRE_PARENTESES int_expression FECHA_PARENTESES { printf("%d\n", $3); }
|   OUTPUT ABRE_PARENTESES float_expression FECHA_PARENTESES { printf("%f\n", $3); }
|   OUTPUT ABRE_PARENTESES string_expression FECHA_PARENTESES { printf("%s\n", $3); }
|   OUTPUT ABRE_PARENTESES boolean_expression_int FECHA_PARENTESES { 
        if ($3) {
            printf("true\n");
        } else {
            printf("false\n");
        }
    }
|   OUTPUT ABRE_PARENTESES boolean_expression_float FECHA_PARENTESES { 
        if ($3) {
            printf("true\n");
        } else {
            printf("false\n");
        }
    }
|   OUTPUT ABRE_PARENTESES boolean_expression_string FECHA_PARENTESES { 
        if ($3) {
            printf("true\n");
        } else {
            printf("false\n");
        }
    }
;

int_expression:
    CONST_INT { $$ = $1; }
|   int_expression '+' int_expression { $$ = $1 + $3; }
|   int_expression '-' int_expression { $$ = $1 - $3; } 
|   int_expression '*' int_expression { $$ = $1 * $3; } 
|   int_expression '/' int_expression { 
        if($3){
            $$ = $1 / $3;
        }else{
            $$ = 0;
            printf("Error: Division By Zero\n");
        } 
    }
|   '-' int_expression %prec NEGATIVO { $$ = -$2; }
|   int_expression ELEVADO int_expression { $$ = pow($1, $3); }
|   ABRE_PARENTESES int_expression FECHA_PARENTESES { $$ = $2; }
;

float_expression:
    CONST_FLOAT { $$ = $1; }
|   float_expression '+' float_expression { $$ = $1 + $3; }
|   float_expression '-' float_expression { $$ = $1 - $3; } 
|   float_expression '*' float_expression { $$ = $1 * $3; } 
|   float_expression '/' float_expression { 
        if($3){
            $$ = $1 / $3;
        }else{
            $$ = 0;
            printf("Error: Division By Zero\n");
        } 
    }
|   '-' float_expression %prec NEGATIVO { $$ = -$2; }
|   float_expression ELEVADO float_expression { $$ = pow($1, $3); }
|   ABRE_PARENTESES float_expression FECHA_PARENTESES { $$ = $2; }
;

string_expression:
    CONST_STRING { $$ = $1; }
;

boolean_expression_int:
    CONST_BOOLEAN_INT { $$ = $1; }
|   int_expression
|   boolean_expression_int MAIOR boolean_expression_int { $$ = $1 > $3; }
|   boolean_expression_int MENOR boolean_expression_int { $$ = $1 < $3; }
|   boolean_expression_int MAIOR_IGUAL boolean_expression_int { $$ = $1 >= $3; }
|   boolean_expression_int MENOR_IGUAL boolean_expression_int { $$ = $1 <= $3; }
|   boolean_expression_int IGUAL boolean_expression_int { $$ = $1 == $3; }
|   boolean_expression_int DIFERENTE boolean_expression_int { $$ = $1 != $3; }
|   boolean_expression_int AND boolean_expression_int { $$ = $1 && $3; }
|   boolean_expression_int OR boolean_expression_int { $$ = $1 || $3; }
|   NOT boolean_expression_int { $$ = !$2; }
|   ABRE_PARENTESES boolean_expression_int FECHA_PARENTESES { $$ = $2; }
;

boolean_expression_float:
    CONST_BOOLEAN_FLOAT { $$ = $1; }
|   float_expression
|   boolean_expression_float MAIOR boolean_expression_float { $$ = $1 > $3; }
|   boolean_expression_float MENOR boolean_expression_float { $$ = $1 < $3; }
|   boolean_expression_float MAIOR_IGUAL boolean_expression_float { $$ = $1 >= $3; }
|   boolean_expression_float MENOR_IGUAL boolean_expression_float { $$ = $1 <= $3; }
|   boolean_expression_float IGUAL boolean_expression_float { $$ = $1 == $3; }
|   boolean_expression_float DIFERENTE boolean_expression_float { $$ = $1 != $3; }
|   boolean_expression_float AND boolean_expression_float { $$ = $1 && $3; }
|   boolean_expression_float OR boolean_expression_float { $$ = $1 || $3; }
|   NOT boolean_expression_float { $$ = !$2; }
|   ABRE_PARENTESES boolean_expression_float FECHA_PARENTESES { $$ = $2; }
;

boolean_expression_string:
    CONST_BOOLEAN_STRING { $$ = $1; }
|   string_expression
|   boolean_expression_string MAIOR boolean_expression_string { $$ = (strcmp($1, $3) > 0) ? "true" : "false"; }
|   boolean_expression_string MENOR boolean_expression_string { $$ = strcmp($1, $3) < 0 ? "true" : "false"; }
|   boolean_expression_string MAIOR_IGUAL boolean_expression_string { $$ = strcmp($1, $3) >= 0 ? "true" : "false"; }
|   boolean_expression_string MENOR_IGUAL boolean_expression_string { $$ = strcmp($1, $3) <= 0 ? "true" : "false"; }
|   boolean_expression_string IGUAL boolean_expression_string { $$ = strcmp($1, $3) == 0 ? "true" : "false"; }
|   boolean_expression_string DIFERENTE boolean_expression_string { $$ = strcmp($1, $3) != 0 ? "true" : "false"; }
|   ABRE_PARENTESES boolean_expression_string FECHA_PARENTESES { $$ = $2; }
;

%%

int yyerror(const char *s){
    extern int yylineno;
    extern char *yytext;

    fprintf(stderr, "Error: %s at line %d, token %s\n", s, yylineno, yytext);
	return 1;
}

int main(int argc, char** argv){
    if (argc > 1){
        FILE *file;
        file = fopen(argv[1], "r");

        if (!file)
            fprintf(stderr, "Could not open file %s\n", argv[1]);
        
        yyin = file;
    }
    yyparse();
    return 0;
}