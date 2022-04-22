/*

To run the file:

1. lex prog.l
2. yacc -d prog.y
3. gcc lex.yy.c y.tab.c -ll
4. ./a.out

*/


%{

#include<stdio.h>
#include "y.tab.h"

%}

%%

[0-9]+	{yylval=atoi(yytext);return INTEGER;}

[-+\n]	{return *yytext;}

[\t ]	

.	{yyerror("invalid character");}

%%

int yywrap(void){
	return 1;
}
