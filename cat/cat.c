/*
 * $ gcc -o cat cat.c && ./cat file.txt
 */

#include <errno.h>
#include <stdio.h>
#include <string.h>

#define CHUNK 4096

void cat_file(char *name)
{
	FILE *f = fopen(name, "r");
	if (f == NULL) {
		printf("%s: %s\n", name, strerror(errno));
		return;
	}

	char buf[CHUNK];
	while (fgets(buf, CHUNK, f) != NULL) {
		printf(buf);
	}

	fclose(f);
}

int main(int argc, char *argv[])
{
	int i;
	for (i = 1; i<argc; i++) {
		cat_file(argv[i]);
	}
	return 0;
}
