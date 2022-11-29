/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_VIRIDIS_TAB_H_INCLUDED
# define YY_YY_VIRIDIS_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    BOOLEAN = 258,
    FLOAT = 259,
    INT = 260,
    STRING = 261,
    VOID = 262,
    ELEVADO = 263,
    ABRE_PARENTESES = 264,
    FECHA_PARENTESES = 265,
    ERRO = 266,
    COMENTARIO_LINHA = 267,
    FOR = 268,
    WHILE = 269,
    IF = 270,
    ELSE = 271,
    ELIF = 272,
    OUTPUT = 273,
    INPUT = 274,
    RETURN = 275,
    INICIOBLOCO = 276,
    FIMBLOCO = 277,
    ARITMETICOS = 278,
    RELACIONAIS = 279,
    LOGICOS = 280,
    FIMLINHA = 281,
    MAIN = 282,
    ATRIBUICAO = 283,
    PONTO = 284,
    IGUAL = 285,
    DIFERENTE = 286,
    MAIOR = 287,
    MENOR = 288,
    MAIOR_IGUAL = 289,
    MENOR_IGUAL = 290,
    AND = 291,
    OR = 292,
    NOT = 293,
    CONST_INT = 294,
    CONST_BOOLEAN_INT = 295,
    CONST_FLOAT = 296,
    CONST_BOOLEAN_FLOAT = 297,
    CONST_STRING = 298,
    CONST_BOOLEAN_STRING = 299,
    VARIAVEL = 300,
    NEGATIVO = 301
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "viridis.y"

    char* string;
    float num_float;
    int num_int;

#line 110 "viridis.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_VIRIDIS_TAB_H_INCLUDED  */
