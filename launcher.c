#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char** argv) {
	if (argc != 3) {
		printf("Usage: %s <payload> <program>\n", argv[0]);
		return 1;
	};

	// duplicate input to stdin
	int fd = open(argv[1], O_RDONLY);
	dup2(fd, 0);
	close(fd);

	char *av[2] = { argv[2], NULL };
	execvp(av[0], av);

	return 0;
}

