/*
 * $ gcc -o ls ls.c && ./ls
 */

#include <dirent.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>

void list_files(char *name) {
	DIR *dir = opendir(name);
	if (dir == NULL) {
		fprintf(stderr, "%s: %s\n", name, strerror(errno));
		return;
	}

	struct dirent *entry;
	while (1) {
		entry = readdir(dir);
		if (entry == NULL) {
			break;
		}

		char *file = entry->d_name;
		if (!strcmp(file, ".") || !strcmp(file, "..")) {
			continue;
		}

		printf("%s\n", entry->d_name);
	}

	if (closedir(dir)) {
		fprintf(stderr, "%s: %s\n", name, strerror(errno));
		return;
	}
}

int main(int argc, char *argv[])
{
	if (argc == 1) {
		list_files(".");
	} else {
		int i;
		for (i = 1; i<argc; i++) {
			printf("[%s]\n", argv[i]);
			list_files(argv[i]);
			if (i < (argc - 1)) {
				printf("\n");
			}
		}
	}
	return 0;
}
