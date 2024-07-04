/*
* Description
*
* 	A lexical analyzer using flex that analyzes
* 	address information from an input file when combined
*	with main.cc and parse.y
*	Uses regexes to tokenize input from an input file. 
*/

%option noyywrap
%option nounput
%option noinput

%{
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[\n]			{ return EOLTOKEN; }
[ \t\r]+	       	{ /*eat up whitespace */}
[I|V|X|C]{1,3}		{ yylval.str = strdup(yytext); return ROMANTOKEN; }
[A-Z][A-Z|a-z]+		{ yylval.str = strdup(yytext); return NAMETOKEN; }
[0-9]+			{ yylval.value = atoi(yytext); return INTTOKEN; }
[A-Z]\.{0,1}		{ yylval.str = strdup(yytext); return NAME_INITIAL_TOKEN;}
[(A-Z)|(0-9)]+       	{ yylval.str = strdup(yytext); return IDENTIFIERTOKEN; }
"Sr."			{ yylval.str = strdup(yytext); return SRTOKEN; }
"Jr."			{ yylval.str = strdup(yytext); return JRTOKEN; }
","			{ yylval.str = strdup(yytext); return COMMATOKEN; }
"-" 			{ yylval.str = strdup(yytext); return DASHTOKEN; }
"#"			{ yylval.str = strdup(yytext); return HASHTOKEN; }

%%

