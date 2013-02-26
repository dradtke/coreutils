#include <stdio.h>

int main(int argc, char *argv[])
{
	argc--;
	int i;
	for (i = 1; i <= argc; i++) {
		fputs(argv[i], stdout);
		if (i < argc) {
			putchar(' ');
		}
	}
	putchar('\n');
	return 0;
}
