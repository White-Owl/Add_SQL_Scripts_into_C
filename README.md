# Add_SQL_Scripts_into_C
An example of how we can add a bunch of SQL scripts into a C application

# Concept
All SQL scripts are going through three stages:
 - Strip from comments (using `sed`)
 - Convert into c-style code (using `xxd -i`)
 - Compiled into an object file (using `gcc -c -x c`)

Resulting `.o` files are gathered into static library `libscripts.a`

In parrallel with compiling the files, the `scripts.h` is created to add `extern` definitions for all created variables.

So now, with `libscripts.a` and `scripts.h` we can use content of the orginal `.sql` files inside the C code.

Assuming we have `first.sql` as one of the scripts, the header file will now have two declarations
```
extern char first_sql[];
extern unsigned int first_sql_len;
```
Which can now be used everywhere we have a need for them.
