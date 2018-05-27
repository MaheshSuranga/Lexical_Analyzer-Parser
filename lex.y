%{                                                                                   
   #include <stdarg.h> 
   #include "lex_shared.h"                                                        
   #define YYSTYPE char *                                                            
   int yydebug=1;                                                                    
   int indent=0;                                                                     
   char *iden_dum;                                                                   
%}                                                                                   
%token 
IF                                                                         
%token 
ELSE                                                                           
%token 
INT
%token
RETURN                                                                         
%token
VOID                                                                           
%token 
WHILE
%token 
ID                                                                         
%token 
NUM                                                                           
%token 
PLUS
%token 
MINUS
%token
MULTI
%token 
DIV
%token
GE
%token
LE
%token
EQ
%token
NE
%token
END
%token
ASSIGN
%token
GT
%token
LS
%token
BC
%token
BO
%token
PO
%token
PC
%token
COMMA
%token
SQBC
%token
SQBO

                                                                    

//%token
//CMTO
//%token
//CMTC
//"/*"      {printf("CMTO ");return CMTO;}
//"*/"      {printf("CMTC ");return CMTC;}


%% /* Grammar rules and actions follow */                                            

program :  declaration_list;
declaration_list : declaration_list declaration | declaration;
declaration : var_declaration | fun_declaration;
var_declaration: type_specifier ID END | type_specifier ID SQBO NUM SQBC END;
type_specifier: INT | VOID;
fun_declaration: type_specifier ID PO params PC compound_stmt;
params: param_list | VOID;
param_list: param_list COMMA param| param;
param: type_specifier ID | type_specifier ID SQBO SQBC;
compound_stmt: BO local_declarations statement_list BC;
local_declarations: local_declarations var_declaration | %empty;
statement_list: statement_list statement | %empty;
statement: expression_stmt | compound_stmt | selection_stmt | iteration_stmt |return_stmt;
expression_stmt: expression END | END;
selection_stmt: IF PO expression PC statement | IF PO expression PC statement ELSE statement;
iteration_stmt: WHILE PO expression PC statement;
return_stmt: RETURN END | RETURN expression END;
expression: var ASSIGN expression | simple_expression;
var: ID | ID SQBO expression SQBC;
simple_expression: additive_expression relop additive_expression | additive_expression;
relop: GT | LS| GE | LE | EQ | NE;
additive_expression: additive_expression addop term | term;
addop: PLUS | MINUS;
term: term mulop factor | factor;
mulop: MULTI | DIV;
factor: PO expression PC | var| call | NUM;
call: ID PO args PC;
args: arg_list | %empty;
arg_list: arg_list COMMA expression | expression;



                                                                                  
%%                                                                                   
 
main()                                                                              
{                                                                                    
  yyparse();                                                                        
}
