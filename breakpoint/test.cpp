#include <iostream>
#include <unistd.h>

int i = 0;
void print()
{
	i++;
	std::cout << "global: " << i << std::endl;
}
int main()
{
	int i = 0;
	while(true)
	{	
		i = i + 2;
		std::cout << "local: " << i << std::endl;
		print();
		sleep(1);
	}
	return 0;
}


config UCLIBC_HAS_BACKTRACE
    bool "Add support for application self-debugging"
    depends on HAVE_SHARED
    help
      Answer Y here to compile support for application self-debugging, by adding
      a new shared object "libubacktrace.so" that provides the following new
      functions:
      backtrace, backtrace_symbols, backtrace_symbols_fd

      The backtrace functionality is currently supported on SH platform, and it
      based on dwarf2 informations to properly work, so any application that
      want to use backtrace needs to be built with -fexceptions flag.

      The symbol names may be unavailable without the use of special linker
      options. For systems using the GNU linker, it is necessary to use the
      -rdynamic linker option too. Note that names of "static" functions are not
      exposed, and won't be available in the backtrace.
