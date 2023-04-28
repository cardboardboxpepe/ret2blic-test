# sources
LLSRC	:= launcher.c
VULN	:= ret2libc.c
EXPLOIT := exp4

# objects
OBJDIR 	:= objs
OBJECTS1:= $(patsubst %.c,$(OBJDIR)/%.o,$(filter %.c, $(LLSRC)))
OBJECTS2:= $(patsubst %.c,$(OBJDIR)/%.o,$(filter %.c, $(VULN)))

# programs
PROG1	:= $(patsubst %.c,%.bin,$(filter %.c, $(LLSRC)))
PROG2	:= $(patsubst %.c,%.bin,$(filter %.c, $(VULN)))
PROGS	:= $(PROG1) $(PROG2) $(EXPLOIT)

# flags
CXXFLAGS=-fno-stack-protector -z execstack -ggdb -g

.PHONY: all clean

# making each prog
all: $(PROGS) 

# making the object dir
$(OBJDIR):
	mkdir -p $@

## generating the exploit
$(EXPLOIT): tools.py
	python tools.py

## compiling into objects

$(OBJDIR)/%.o: %.c | $(OBJDIR)
	gcc -c $< -o $@ $(CXXFLAGS)

## compiling into programs

$(PROG1): $(OBJECTS1) | $(OBJDIR)
	gcc $^ -o $@

$(PROG2): $(OBJECTS2) | $(OBJDIR)
	gcc $^ -o $@

clean:
	@rm -rvf $(OBJDIR) *.bin

