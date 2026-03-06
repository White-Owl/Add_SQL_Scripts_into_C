PROJECT=scripts
LIB=lib$(PROJECT).a
HEADER=$(PROJECT).h
SCRIPTS=$(wildcard *.sql)
OBJECTS=$(patsubst %.sql,%.o,${SCRIPTS})

all: $(LIB) $(HEADER)

${LIB}: ${OBJECTS}
	ar rcs $@ $^

%.o: %.sql
	sed -e 's/--.*$$//' -e '/^$$/d' $< | xxd -i -n $< | gcc -c -x c -o $@ -

$(HEADER): $(SCRIPTS)
	ls -1 $(SCRIPTS) | sed -e 's/^/extern char /' -e 's/$$/[];/' -e 's/[.]/_/g' > $@
	ls -1 $(SCRIPTS) | sed -e 's/^/extern unsigned int /' -e 's/$$/_len;/' -e 's/[.]/_/g' >> $@
	

clean:
	rm -rf ${OBJECTS} ${LIB} $(HEADER)