type expr_ctx =
  | IdCtx of string
  | IntCtx of int
  | BoolCtx of bool
  | CallCtx of expr_ctx * (expr_ctx list)

type stmt_ctx =
  | CallStmt of expr_ctx
  | RetStmt of expr_ctx

type type_ctx =
  | NamedTypeCtx of string

type fn_decl_ctx = {
  name: string;
  returns: type_ctx;
  params: (string * type_ctx) list;
  body: stmt_ctx list;
}

type extern_decl_ctx = {
  name: string;
  returns: type_ctx;
  params: (string * type_ctx) list;
}

type top_level_ctx =
  | ExternCtx of extern_decl_ctx
  | FnDeclCtx of fn_decl_ctx

type prog_ctx =
  | Prog of top_level_ctx list
