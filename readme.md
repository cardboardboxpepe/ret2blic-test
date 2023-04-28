# Ret2libc Showcase

1. Disable ASLR with `disable_aslr`
2. Generate the exploit file with `python tools.py`
3. Build the program with `make`
4. Run the program in a couple of ways:

```sh
$ (cat exp4; cat) | ./sys.bin
```

Or

```sh
$ ./launcher ./exp4 ./sys.bin
```

