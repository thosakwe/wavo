open Arg

let () =
  let compile_only = ref false in
  let inputs : string list ref = ref [] in
  let specs = [
    ("-c", Set compile_only, "Compile only, do not link.")
  ] in
  let anon s =
    let current = !inputs in
    let new_value = List.append current [s] in
    inputs := new_value
  in
  parse specs anon "usage: wavo [options...] <input_files>";
 
  (* We've parsed the arguments; now read all input files in.*)
  if (List.length !inputs) == 0 then
    begin
      prerr_endline "fatal error: no input file";
      exit 1
    end
  else
    let parse_ast fn =
      let chan = open_in fn in
      let lexbuf = Lexing.from_channel chan in  
      Parser.prog Lexer.token lexbuf
    in
    let asts = List.map parse_ast !inputs in
    print_endline (string_of_int (List.length asts))
