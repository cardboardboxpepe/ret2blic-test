CXXFLAGS= -fno-stack-protector -z execstack -ggdb 

all:
	gcc $(CXXFLAGS) ret2libc.c -o sys.bin
	gcc -ggdb launcher.c -o launcher.bin

clean:
	rm *.bin

