.PHONY: clean

all: lexer.o main.o parser.o

clean:
	rm -rf lexer.ml parser.ml parser.mli *.cmi *.cmx *.o *.cmo *.out

ast.cmi: ast.ml
	ocamlopt $<

main.o: main.ml lexer.o parser.o
	ocamlopt main.ml lexer.cmx parser.cmx

parser.ml parser.mli: parser.mly ast.cmi
	menhir --infer $<

parser.cmi: parser.mli
	ocamlopt $<

lexer.ml: lexer.mll parser.cmi ast.ml
	ocamllex lexer.mll

%.o: %.ml
	ocamlopt $<
