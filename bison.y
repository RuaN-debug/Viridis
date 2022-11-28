%{
    #include<stdio.h>
    #include<math.h>
    int yylex();
    int yyerror();
%}

%union{
    char name[30];
    float num_float;
    int num_int;
}

%token ERRO FLOAT VARIAVEL STRING COMENTARIO_LINHA COMENTARIO FOR WHILE IF ELSE ELIF OUTPUT INPUT RETURN INICIOBLOCO FIMBLOCO ATRIBUICAO ARITMETICOS RELACIONAIS LOGICOS BOOLEAN VOID FIMLINHA MAIN ELEVADO

%type<num_int> exp
%token<num_int> INT
%type<name> VARIAVEL

%left '<' '>' '=' "!=" "<=" ">="
%left '+' '-'
%left '*' '/'
%precedence NEGATIVO
%right '^'

%%

input: 
|   line input
;

line: 
    exp FIMLINHA { printf("%d\n", $1); } 
|   FIMLINHA
;

exp:
    INT { $$ = $1; }
|   exp '+' exp { $$ = $1 + $3; }
|   exp '-' exp { $$ = $1 - $3; } 
|   exp '*' exp { $$ = $1 * $3; } 
|   exp '/' exp { 
        if($3){
            $$ = $1 / $3;
        }else{
            $$ = 0;
            printf("Error: Division By Zero\n");
        } 
    }
|   '-' exp %prec NEGATIVO { $$ = -$2; }
|   exp '^' exp { $$ = pow($1, $3); }
|   '(' exp ')' { $$ = $2; }
;

%%

int yyerror(char *s){
    fprintf(stderr, "Parse Error: %s\n", s);
	return 1;
}

int main(){
    yyparse();
    return 0;
}