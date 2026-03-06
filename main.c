#include <stdio.h>

#include "scripts/scripts.h"

char *list[] = {
	first_sql,
	fourth_sql,
	second_sql,
};
	
int main(int argc, char **argv) {
	for(int idx=0; idx<sizeof(list)/sizeof(list[0]); idx++) {
		puts(list[idx]);
	}
	return 0;
}
