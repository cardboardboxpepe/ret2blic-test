CXXFLAGS= -fno-stack-protector -z execstack -ggdb 

all:
	gcc $(CXXFLAGS) ret2libc.c -o sys
	gcc -ggdb launcher.c -o launcher

