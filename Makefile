all: viridis

viridis.tab.c viridis.tab.h: viridis.y
	bison -t -v -d viridis.y

lex.yy.c: viridis.l viridis.tab.h
	flex viridis.l

viridis: lex.yy.c viridis.tab.c viridis.tab.h
	gcc -o viridis viridis.tab.c lex.yy.c

clean:
	rm viridis viridis.tab.c lex.yy.c viridis.tab.h viridis.output
