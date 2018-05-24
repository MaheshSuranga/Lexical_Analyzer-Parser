%{                                                                                          
#include "lex.tab.h"                                                                     
extern int line_number;   
//void yyerror(char *);  
void yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}                                                                
%}                                                                                          
%option noyywrap                                                                            


letter [a-zA-Z]
ID {letter}|{letter}*
digit [0-9]
NUM {digit}|{digit}*
COMMENT "/*"({letter}|{digit})*"*/"

 
%%                                                                                          
[ \t\r]+          /* eat up whitespace */  
"if"  {printf("IF "); return IF;}
"else" {printf("ELSE "); return ELSE;}
"int" {printf("INT "); return INT;}
"return" {printf("RETURN "); return RETURN;}
"void" {printf("VOID "); return VOID;}
"while" {printf("KEYWORD "); return WHILE;}

{COMMENT}  {printf("*****************************COMMENT ");}
{ID} {printf("ID "); return ID;}
{NUM} {printf("NUMBER "); return NUM;}

"+" {printf("PLUS "); return PLUS;}
"-" {printf("MINUS "); return MINUS;}
"*" {printf("MULTI "); return MULTI;}
"/" {printf("DIV "); return DIV;}

">="     {printf("GE "); return GE;}       
"<="       {printf("LE "); return LE;}     
"=="      {printf("EQ ");return EQ;}      
"!="      {printf("NE ");return NE;}      
";"        {printf("END "); return END;}
","        {printf("COMMA "); return COMMA;}
"="      {printf("ASSIGN ");return ASSIGN;}  
">"      {printf("GREAT ");return GT;}  
"<"      {printf("ASSIGN ");return LS;}      
"}"      {printf("BC ");return BC;}
"{"      {printf("BO ");return BO;}
"]"      {printf("BC ");return SQBC;}
"["      {printf("BO ");return SQBO;}
")"      {printf("PC ");return PC;}
"("      {printf("PO ");return PO;}


[\n] { line_number++; }                                                                     
%%
