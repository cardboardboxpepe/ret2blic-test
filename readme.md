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

## About

Basically, we're trying to overwrite the `rip` address to point to
functions to libc, namely the `system(const char*)` function.

We need:

- the address of `system()`
- the address of the command we want to execute (in this case `/bin/sh`)
- (optional) an address for `system()` to return to
- (optional) an address to align the stack so the program doesn't segfault

All of these addresses are in `tools.py` however the address to align
the stack could change due to ASLR or other factors.

This is why there's a script to disable this `disable_aslr`.

Here's how you find the addresses of the functions using `gdb`,
within `gdb` execute the following commands:

1. `b main` to break at the `main` function
2. `r` to run the program
3. `p system` to print the address of system
4. `p exit` to print the address of exit
5. `find "/bin/sh"` to print the address where the string `/bin/sh` is stored (should be within libc)

