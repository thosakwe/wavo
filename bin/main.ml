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
  print_endline ("Count: " ^ (string_of_int (List.length !inputs)))
  
