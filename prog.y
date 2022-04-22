%{

#include<stdlib.h>
#include<stdio.h>
int yylex(void);
void yyerror(char *);
int lines = 1;
int count = 0;
%}

%token INTEGER

%%

program: program expr '\n'  {lines++;if($2==9){printf("%d at line no. %d\n",$2,lines);count++;}}
       |
       ;
expr: INTEGER		{ $$ = $1; }
    | expr '+' expr	{ $$ = $1 + $3;}
    | expr '-' expr	{ $$ = $1 - $3;}
    ;

%%

void yyerror(char *s){

	fprintf(stderr, "%s\n", s);

}

int main(void){

extern FILE *yyin, *yyout;

yyin = fopen("input.txt","r");

yyparse();

printf("\n total count is : %d\n",count);

return 0;

}
