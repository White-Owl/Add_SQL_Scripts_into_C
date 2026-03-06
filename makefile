PROJECT     = include_all
SCRIPTS_DIR = scripts
SRC         = main.c
OBJ         = $(patsubst %.c,%.o,$(SRC))

.PHONY: all clean $(SCRIPTS_DIR)

all: $(SCRIPTS_DIR) $(PROJECT)
	./$(PROJECT)

$(SCRIPTS_DIR):
	$(MAKE) -C $@

$(PROJECT): $(OBJ)
	gcc -o $@ $(OBJ) -L$(SCRIPTS_DIR) -lscripts

clean:
	$(MAKE) -C $(SCRIPTS_DIR) clean
	rm -rf $(OBJ) $(PROJECT)