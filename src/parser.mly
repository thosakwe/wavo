%{
  open Ast
%}

%token <int> INT
%token <string> ID
%token LCURLY RCURLY LPAREN RPAREN COMMA COLON
%token EXTERN FN RET
%token EOF

%type <Ast.expr> expr

%start expr

%%

expr:
  | v=INT { IntCtx v }

%%
