objects=src/ast.o src/lexer.o src/main.o src/parser.o

.PHONY: clean src

all: bin/wavo

clean:
	rm -rf bin/wavo
	$(MAKE) -C src clean

bin/wavo: src
	ocamlopt -o ./bin/wavo $(objects)

src:
	$(MAKE) -C src
