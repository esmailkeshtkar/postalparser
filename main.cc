/*
 * Description:
 * 	main c++ program that drives a lexical analyzer and parser
 * 	depending on how the program's name is called (scanner/parser)
 *	determines programs functions and output
 *	if called by ./scanner then it outputs lexical scanning information
 * 	if called by ./parser then it outputs parsing information
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <iostream>

using namespace std; 
extern int yylex(void);
extern char *yytext;

int main(int argc, char *argv[])
{

  int token;
  if(strcmp(argv[0], "./scanner") == 0)
    {
      printf("Operating in scan mode\n\n");
      token = yylex();
      while(token != 0)
	{
	  printf("yylex returned ");
	  switch(token)
	    {
	    case NAMETOKEN:
	      printf("NAMETOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case IDENTIFIERTOKEN:
	      printf("IDENTIFIERTOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case NAME_INITIAL_TOKEN:
	      printf("NAME_INITIAL_TOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case ROMANTOKEN:
	      printf("ROMANTOKEN");
	      cout << "(" << token << ")" << endl;
	      break;
	    case SRTOKEN:
	      printf("SRTOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case JRTOKEN:
	      printf("JRTOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case EOLTOKEN:
	      printf("EOLTOKEN");
	      cout << "(" << token << ")" << endl;
	      break;
	    case INTTOKEN:
	      printf("INTTOKEN");
	      cout << "(" << yytext << ")" << endl;
	      break;
	    case COMMATOKEN:
	      printf("COMMATOKEN");
	      cout << "(" << token << ")" << endl;
	      break;
	    case DASHTOKEN:
	      printf("DASHTOKEN");
	      cout << "(" << token << ")" << endl;
	      break;
	    case HASHTOKEN:
	      printf("HASHTOKEN");
	      cout << "(" << token << ")" << endl;
	      break;
	    }
	  token = yylex();
	}
    }

  if(strcmp(argv[0], "./parser") == 0)
    {
      cout << "Operation in parse mode" << endl;
      cout << endl;
      switch (yyparse())
	{
	case 0:
	  printf("\nParse Successful!\n");
	  break;
	case 1:
	  printf("Parse Failed!\n");
	  break;
	case 2:
	  printf("Out of Memory\n");
	  break;
	default:
	  printf("Unknown result from yyparse() \n)");
	  break;
        }
      printf("Finished with the parser.\n");
      
    }

  return 0;
}
