{
  open Lexing
  open Parser
  exception SyntaxError of string
}

let integer = '-'?['0'-'9']+
let whitespace = [' ' '\r' '\t' '\n']+
let id = ['A'-'Z' 'a'-'z' '_'] ['A'-'Z' 'a'-'z' '0'-'9' '_']*

rule token = parse
  | whitespace { token lexbuf }
  | '{' { LCURLY }
  | '}' { RCURLY }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | ',' { COMMA }
  | ':' { COLON } 
  | "fn"{ FN }
  | "extern" { EXTERN }
  | "ret" { RET }
  | integer as lxm { INT (int_of_string lxm) }
  | id as lxm { ID lxm }
  | _ as c
    { raise (SyntaxError ("Unrecognized char: " ^ (Char.escaped c))) }
  | eof { EOF }
