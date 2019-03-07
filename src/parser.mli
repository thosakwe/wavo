
(* The type of tokens. *)

type token = 
  | RPAREN
  | RET
  | RCURLY
  | LPAREN
  | LCURLY
  | INT of (int)
  | ID of (string)
  | FN
  | EXTERN
  | EOF
  | COMMA
  | COLON

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog_ctx)
