type expr =
  | IntCtx of int
  | BoolCtx of bool
  | CallCtx of expr * (expr list)

type stmt_ctx =
  | ExprStmt of expr
  | RetStmt of expr

type type_ctx =
  | NamedTypeCtx of string

type fn_decl = {
  name: string;
  returns: type_ctx;
  params: (string * type_ctx) list;
  body: stmt_ctx list;
}

type top_level =
  | ExternCtx
  | FnDeclCtx

type prog =
  | Prog of top_level list
