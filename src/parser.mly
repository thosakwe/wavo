%{
  open Ast
%}

%token <int> INT
%token <string> ID
%token LCURLY RCURLY LPAREN RPAREN COMMA COLON
%token EXTERN FN RET
%token EOF

%type <Ast.expr_ctx> expr
%type <Ast.stmt_ctx> stmt
%type <Ast.stmt_ctx list> block
%type <Ast.prog_ctx> prog

%start prog

%%

expr:
  | v=INT { IntCtx v }
  | v=ID  { IdCtx v }
  | LPAREN v=expr RPAREN { v }
;

type_node:
  | v=ID { NamedTypeCtx v }
;

stmt:
  | RET v=expr { RetStmt v } 
;

block:
  | LCURLY v=list(stmt) RCURLY { stmt }
  | v=stmt { [stmt] }
;

param:
  | name=ID COMMA t=type_node { (name, t) }
;

param_list:
  | LPAREN v=separated_list(COMMA, param) RPAREN { v }
;

extern:
  EXTERN name=ID params=param_list COLON returns=type_node
  { { name; returns; params } }
;

fn:
  FN name=ID params=param_list COLON returns=type_node body=block
  { { name; returns; params; body } }
;

top_level:
  | v=extern { ExternCtx v }
  | v=fn { FnDeclCtx v }
;

prog:
  | v=list(top_level) EOF { Prog v }

%%
