From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Oct 2011 08:22:03 +0000 (UTC)
Subject: [Buildroot] [Bug 4429] New: buildroot 2011.08 does not build on
	Ubuntu 11.10
Message-ID: <bug-4429-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4429

           Summary: buildroot 2011.08 does not build on Ubuntu 11.10
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: busybox at reliableembeddedsystems.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


/usr/bin/make -j2  HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
make[1]: Entering directory `/home/student/beagle/buildroot-2011.08'
mkdir -p
/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/lxdialog
/usr/bin/make CC="/usr/bin/gcc" HOSTCC="/usr/bin/gcc"
obj=/home/student/beagle/buildroot-2011.08/output/build/buildroot-config -C
package/config -f Makefile.br conf
make[2]: Entering directory
`/home/student/beagle/buildroot-2011.08/package/config'
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE 
-I/home/student/beagle/buildroot-2011.08/output/build/buildroot-config  
/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/conf.o
/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/zconf.tab.o
  -o /home/student/beagle/buildroot-2011.08/output/build/buildroot-config/conf
make[2]: Leaving directory
`/home/student/beagle/buildroot-2011.08/package/config'
KCONFIG_AUTOCONFIG=/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/autoconf.h
KCONFIG_TRISTATE=/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/tristate.config
BUILDROOT_CONFIG=/home/student/beagle/buildroot-2011.08/.config
/home/student/beagle/buildroot-2011.08/output/build/buildroot-config/conf
--silentoldconfig Config.in
#
# make dependencies written to .auto.deps
# ATTENTION buildroot devels!
# See top of this file before playing with this auto-preprequisites!
#
make[1]: Leaving directory `/home/student/beagle/buildroot-2011.08'
>>> host-gmp 5.0.1 Extracting
bzcat /home/student/beagle/buildroot-2011.08/dl/gmp-5.0.1.tar.bz2 | tar
--strip-components=1 -C
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1  -xf -
>>> host-gmp 5.0.1 Patching package/gmp
for file in config.guess config.sub; do for i in $(find
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1 -name
$file); do cp package/gnuconfig/$file $i; done; done
>>> host-gmp 5.0.1 Patching libtool

Applying buildroot-libtool-v2.2.patch using plaintext: 
patching file ltmain.sh
>>> host-gmp 5.0.1 Configuring
(cd /home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/ && rm
-rf config.cache;
PATH=/home/student/beagle/buildroot-2011.08/output/host/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/sbin:/usr/sbin:/home/student/beagle/crosstool-ng/development/xtools/bin:/home/student/beagle/crosstool-ng/development/xtools/arm-unknown-linux-gnueabi/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
CFLAGS="-O2 -I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include"
CXXFLAGS="-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include"
LDFLAGS="-L/home/student/beagle/buildroot-2011.08/output/host/lib
-L/home/student/beagle/buildroot-2011.08/output/host/usr/lib
-Wl,-rpath,/home/student/beagle/buildroot-2011.08/output/host/usr/lib"
PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG="/home/student/beagle/buildroot-2011.08/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/pkgconfig:/home/student/beagle/buildroot-2011.08/output/host/usr/share/pkgconfig"
PERLLIB="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/perl"
LD_LIBRARY_PATH="/home/student/beagle/buildroot-2011.08/output/host/usr/lib:"
CFLAGS="-O2 -I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include"
LDFLAGS="-L/home/student/beagle/buildroot-2011.08/output/host/lib
-L/home/student/beagle/buildroot-2011.08/output/host/usr/lib
-Wl,-rpath,/home/student/beagle/buildroot-2011.08/output/host/usr/lib" 
./configure --prefix="/home/student/beagle/buildroot-2011.08/output/host/usr"
--sysconfdir="/home/student/beagle/buildroot-2011.08/output/host/etc"
--enable-shared --disable-static  )
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking ABI=32
checking compiler /usr/bin/gcc -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include ... yes
checking compiler /usr/bin/gcc -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include has
sizeof(long)==4... yes
checking for gcc... /usr/bin/gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... no
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ISO C89... none needed
checking for /usr/bin/gcc option to accept ISO C99... -std=gnu99
checking for /usr/bin/gcc -std=gnu99 option to accept ISO Standard C...
(cached) -std=gnu99
checking how to run the C preprocessor... /usr/bin/cpp
checking build system compiler /usr/bin/gcc -std=gnu99... yes
checking for build system preprocessor... /usr/bin/gcc -std=gnu99 -E
checking for build system executable suffix... 
checking whether build system compiler is ANSI... yes
checking for build system compiler math library... -lm
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
using ABI="32"
      CC="/usr/bin/gcc -std=gnu99"
      CFLAGS="-O2 -I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include"
      CPPFLAGS=""
      MPN_PATH=" x86/p6 x86 generic"
checking for function prototypes... yes
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for string.h... (cached) yes
checking whether assembler supports --noexecstack option... yes
checking for ar... /usr/bin/ar
checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm
checking the name lister (/usr/bin/nm) interface... BSD nm
checking for a sed that does not truncate output... /bin/sed -i -e
checking for fgrep... /bin/grep -F
checking for ld used by /usr/bin/gcc -std=gnu99... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking whether ln -s works... yes
checking the maximum length of command line arguments... 805306365
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for /usr/bin/ld option to reload object files... -r
checking for objdump... objdump
checking how to recognize dependent libraries... pass_all
checking for ar... (cached) /usr/bin/ar
checking for strip... strip
checking for ranlib... ranlib
checking command to parse /usr/bin/nm output from /usr/bin/gcc -std=gnu99
object... /bin/sed: no input files
ok
checking for dlfcn.h... yes
checking whether we are using the GNU C++ compiler... yes
checking whether /usr/bin/g++ accepts -g... yes
checking how to run the C++ preprocessor... /usr/bin/g++ -E
checking for g77... no
checking for xlf... no
checking for f77... no
checking for frt... no
checking for pgf77... no
checking for cf77... no
checking for fort77... no
checking for fl32... no
checking for af77... no
checking for xlf90... no
checking for f90... no
checking for pgf90... no
checking for pghpf... no
checking for epcf90... no
checking for gfortran... no
checking for g95... no
checking for xlf95... no
checking for f95... no
checking for fort... no
checking for ifort... no
checking for ifc... no
checking for efc... no
checking for pgf95... no
checking for lf95... no
checking for ftn... no
checking whether we are using the GNU Fortran 77 compiler... no
checking whether  accepts -g... no
checking for objdir... .libs
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: no input files
/bin/sed: no input files
checking if /usr/bin/gcc -std=gnu99 supports -fno-rtti -fno-exceptions...
/bin/sed: -e expression #1, char 1: unknown command: `-'
no
checking for /usr/bin/gcc -std=gnu99 option to produce PIC... -fPIC -DPIC
checking if /usr/bin/gcc -std=gnu99 PIC flag -fPIC -DPIC works... /bin/sed: -e
expression #1, char 1: unknown command: `-'
no
checking if /usr/bin/gcc -std=gnu99 static flag -static works... yes
checking if /usr/bin/gcc -std=gnu99 supports -c -o file.o... /bin/sed: -e
expression #1, char 1: unknown command: `-'
no
checking if /usr/bin/gcc -std=gnu99 supports -c -o file.o... (cached) no
checking if we can lock with hard links... yes
checking whether the /usr/bin/gcc -std=gnu99 linker (/usr/bin/ld) supports
shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... /bin/sed: -e expression #1, char 1:
unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... no
/bin/sed: no input files
/bin/sed: no input files
/bin/sed: -e expression #1, char 1: unknown command: `-'
checking for ld used by /usr/bin/g++... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking whether the /usr/bin/g++ linker (/usr/bin/ld) supports shared
libraries... yes
/bin/sed: -e expression #1, char 1: unknown command: `-'
checking for /usr/bin/g++ option to produce PIC... -fPIC -DPIC
checking if /usr/bin/g++ PIC flag -fPIC -DPIC works... /bin/sed: -e expression
#1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
yes
checking if /usr/bin/g++ static flag -static works... yes
checking if /usr/bin/g++ supports -c -o file.o... /bin/sed: -e expression #1,
char 1: unknown command: `-'
no
checking if /usr/bin/g++ supports -c -o file.o... (cached) no
checking if we can lock with hard links... yes
checking whether the /usr/bin/g++ linker (/usr/bin/ld) supports shared
libraries... yes
checking dynamic linker characteristics... /bin/sed: -e expression #1, char 1:
unknown command: `-'
GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking invent.h usability... no
checking invent.h presence... no
checking for invent.h... no
checking langinfo.h usability... yes
checking langinfo.h presence... yes
checking for langinfo.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking nl_types.h usability... yes
checking nl_types.h presence... yes
checking for nl_types.h... yes
checking sys/attributes.h usability... no
checking sys/attributes.h presence... no
checking for sys/attributes.h... no
checking sys/iograph.h usability... no
checking sys/iograph.h presence... no
checking for sys/iograph.h... no
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking sys/param.h usability... yes
checking sys/param.h presence... yes
checking for sys/param.h... yes
checking sys/processor.h usability... no
checking sys/processor.h presence... no
checking for sys/processor.h... no
checking sys/pstat.h usability... no
checking sys/pstat.h presence... no
checking for sys/pstat.h... no
checking sys/sysinfo.h usability... yes
checking sys/sysinfo.h presence... yes
checking for sys/sysinfo.h... yes
checking sys/syssgi.h usability... no
checking sys/syssgi.h presence... no
checking for sys/syssgi.h... no
checking sys/systemcfg.h usability... no
checking sys/systemcfg.h presence... no
checking for sys/systemcfg.h... no
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/times.h usability... yes
checking sys/times.h presence... yes
checking for sys/times.h... yes
checking for sys/resource.h... yes
checking for sys/sysctl.h... yes
checking for machine/hal_sysinfo.h... no
checking whether fgetc is declared... yes
checking whether fscanf is declared... yes
checking whether optarg is declared... yes
checking whether ungetc is declared... yes
checking whether vfprintf is declared... yes
checking whether sys_errlist is declared... yes
checking whether sys_nerr is declared... yes
checking return type of signal handlers... void
checking for intmax_t... yes
checking for long double... yes
checking for long long... yes
checking for ptrdiff_t... yes
checking for quad_t... yes
checking for uint_least32_t... yes
checking for intptr_t... yes
checking for preprocessor stringizing operator... yes
checking for working volatile... yes
checking for C/C++ restrict keyword... __restrict
checking whether <stdarg.h> exists and works... yes
checking whether gcc __attribute__ ((const)) works... yes
checking whether gcc __attribute__ ((malloc)) works... yes
checking whether gcc __attribute__ ((mode (XX))) works... yes
checking whether gcc __attribute__ ((noreturn)) works... yes
checking for inline... inline
checking for cos in -lm... yes
checking for working alloca.h... yes
checking for alloca (via gmp-impl.h)... yes
checking how to allocate temporary memory... alloca
checking whether byte ordering is bigendian... no
checking format of `double' floating point... IEEE little endian
checking for alarm... yes
checking for attr_get... no
checking for clock... yes
checking for clock_gettime... no
checking for cputime... no
checking for getpagesize... yes
checking for getrusage... yes
checking for gettimeofday... yes
checking for getsysinfo... no
checking for localeconv... yes
checking for memset... yes
checking for mmap... yes
checking for mprotect... yes
checking for nl_langinfo... yes
checking for obstack_vprintf... yes
checking for popen... yes
checking for processor_info... no
checking for pstat_getprocessor... no
checking for raise... yes
checking for read_real_time... no
checking for sigaction... yes
checking for sigaltstack... yes
checking for sigstack... yes
checking for syssgi... no
checking for strchr... yes
checking for strerror... yes
checking for strnlen... yes
checking for strtol... yes
checking for strtoul... yes
checking for sysconf... yes
checking for sysctl... yes
checking for sysctlbyname... no
checking for times... yes
checking for vsnprintf... yes
checking whether vsnprintf works... yes
checking whether sscanf needs writable input... no
checking for struct pst_processor.psp_iticksperclktick... no
checking for suitable m4... m4
checking if m4wrap produces spurious output... no
checking how to switch to text section... .text
checking how to switch to data section... .data
checking for assembler label suffix... :
checking for assembler global directive... .globl
checking for assembler global directive attribute... 
checking if globals are prefixed by underscore... no
checking how to switch to read-only data section...     .section    .rodata
checking for assembler .type directive... .type    $1,@$2
checking for assembler .size directive... .size    $1,$2
checking for assembler local label prefix... .L
checking for assembler byte directive... .byte
checking how to define a 32-bit word... .long
checking if .align assembly directive is logarithmic... no
checking if the .align directive accepts an 0x90 fill in .text... yes
checking for assembler COFF type directives... no
checking if _GLOBAL_OFFSET_TABLE_ is prefixed by underscore... no
checking if the assembler takes cl with shldl... yes
checking size of void *... 4
checking size of unsigned short... 2
checking size of unsigned... 4
checking size of unsigned long... 4
checking size of mp_limb_t... 4
checking for stack_t... yes
checking for tputs in -lncurses... yes
checking for readline in -lreadline... no
checking readline detected... no
checking for bison... bison -y
checking for flex... flex
checking lex output file root... lex.yy
checking lex library... -lfl
checking whether yytext is a pointer... yes
checking for ranlib... (cached) ranlib
creating config.m4
configure: creating ./config.status
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
/bin/sed: -e expression #1, char 1: unknown command: `-'
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
./config.status: line 789: X/usr/bin/gcc: No such file or directory
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
X: user not authorized to run the X server, aborting.
config.status: creating demos/pexpr-config.h
config.status: creating demos/calc/calc-config.h
config.status: creating Makefile
config.status: creating mpbsd/Makefile
config.status: creating mpf/Makefile
config.status: creating mpn/Makefile
config.status: creating mpq/Makefile
config.status: creating mpz/Makefile
config.status: creating printf/Makefile
config.status: creating scanf/Makefile
config.status: creating cxx/Makefile
config.status: creating tests/Makefile
config.status: creating tests/devel/Makefile
config.status: creating tests/mpbsd/Makefile
config.status: creating tests/mpf/Makefile
config.status: creating tests/mpn/Makefile
config.status: creating tests/mpq/Makefile
config.status: creating tests/mpz/Makefile
config.status: creating tests/rand/Makefile
config.status: creating tests/misc/Makefile
config.status: creating tests/cxx/Makefile
config.status: creating doc/Makefile
config.status: creating tune/Makefile
config.status: creating demos/Makefile
config.status: creating demos/calc/Makefile
config.status: creating demos/expr/Makefile
config.status: creating gmp.h
config.status: creating mp.h
config.status: creating config.h
config.status: linking mpn/generic/add.c to mpn/add.c
config.status: linking mpn/generic/add_1.c to mpn/add_1.c
config.status: linking mpn/x86/p6/aors_n.asm to mpn/add_n.asm
config.status: linking mpn/generic/sub.c to mpn/sub.c
config.status: linking mpn/generic/sub_1.c to mpn/sub_1.c
config.status: linking mpn/x86/p6/aors_n.asm to mpn/sub_n.asm
config.status: linking mpn/generic/neg.c to mpn/neg.c
config.status: linking mpn/generic/com.c to mpn/com.c
config.status: linking mpn/x86/mul_1.asm to mpn/mul_1.asm
config.status: linking mpn/x86/p6/aorsmul_1.asm to mpn/addmul_1.asm
config.status: linking mpn/x86/p6/aorsmul_1.asm to mpn/submul_1.asm
config.status: linking mpn/x86/lshift.asm to mpn/lshift.asm
config.status: linking mpn/x86/rshift.asm to mpn/rshift.asm
config.status: linking mpn/x86/p6/dive_1.asm to mpn/dive_1.asm
config.status: linking mpn/generic/diveby3.c to mpn/diveby3.c
config.status: linking mpn/generic/divis.c to mpn/divis.c
config.status: linking mpn/generic/divrem.c to mpn/divrem.c
config.status: linking mpn/x86/divrem_1.asm to mpn/divrem_1.asm
config.status: linking mpn/x86/divrem_2.asm to mpn/divrem_2.asm
config.status: linking mpn/generic/fib2_ui.c to mpn/fib2_ui.c
config.status: linking mpn/generic/mod_1.c to mpn/mod_1.c
config.status: linking mpn/x86/p6/mod_34lsub1.asm to mpn/mod_34lsub1.asm
config.status: linking mpn/x86/p6/mode1o.asm to mpn/mode1o.asm
config.status: linking mpn/generic/pre_divrem_1.c to mpn/pre_divrem_1.c
config.status: linking mpn/generic/pre_mod_1.c to mpn/pre_mod_1.c
config.status: linking mpn/generic/dump.c to mpn/dump.c
config.status: linking mpn/generic/mod_1_1.c to mpn/mod_1_1.c
config.status: linking mpn/generic/mod_1_2.c to mpn/mod_1_2.c
config.status: linking mpn/generic/mod_1_3.c to mpn/mod_1_3.c
config.status: linking mpn/generic/mod_1_4.c to mpn/mod_1_4.c
config.status: linking mpn/generic/lshiftc.c to mpn/lshiftc.c
config.status: linking mpn/generic/mul.c to mpn/mul.c
config.status: linking mpn/generic/mul_fft.c to mpn/mul_fft.c
config.status: linking mpn/generic/mul_n.c to mpn/mul_n.c
config.status: linking mpn/generic/sqr.c to mpn/sqr.c
config.status: linking mpn/x86/p6/mul_basecase.asm to mpn/mul_basecase.asm
config.status: linking mpn/x86/p6/sqr_basecase.asm to mpn/sqr_basecase.asm
config.status: linking mpn/generic/nussbaumer_mul.c to mpn/nussbaumer_mul.c
config.status: linking mpn/generic/random.c to mpn/random.c
config.status: linking mpn/generic/random2.c to mpn/random2.c
config.status: linking mpn/generic/pow_1.c to mpn/pow_1.c
config.status: linking mpn/generic/rootrem.c to mpn/rootrem.c
config.status: linking mpn/generic/sqrtrem.c to mpn/sqrtrem.c
config.status: linking mpn/generic/get_str.c to mpn/get_str.c
config.status: linking mpn/generic/set_str.c to mpn/set_str.c
config.status: linking mpn/generic/scan0.c to mpn/scan0.c
config.status: linking mpn/generic/scan1.c to mpn/scan1.c
config.status: linking mpn/generic/popham.c to mpn/popcount.c
config.status: linking mpn/generic/popham.c to mpn/hamdist.c
config.status: linking mpn/generic/cmp.c to mpn/cmp.c
config.status: linking mpn/generic/perfsqr.c to mpn/perfsqr.c
config.status: linking mpn/generic/perfpow.c to mpn/perfpow.c
config.status: linking mpn/generic/gcd_1.c to mpn/gcd_1.c
config.status: linking mpn/generic/gcd.c to mpn/gcd.c
config.status: linking mpn/generic/gcdext_1.c to mpn/gcdext_1.c
config.status: linking mpn/generic/gcdext.c to mpn/gcdext.c
config.status: linking mpn/generic/gcd_lehmer.c to mpn/gcd_lehmer.c
config.status: linking mpn/generic/gcd_subdiv_step.c to mpn/gcd_subdiv_step.c
config.status: linking mpn/generic/gcdext_lehmer.c to mpn/gcdext_lehmer.c
config.status: linking mpn/generic/gcdext_subdiv_step.c to
mpn/gcdext_subdiv_step.c
config.status: linking mpn/generic/div_q.c to mpn/div_q.c
config.status: linking mpn/generic/tdiv_qr.c to mpn/tdiv_qr.c
config.status: linking mpn/generic/jacbase.c to mpn/jacbase.c
config.status: linking mpn/generic/get_d.c to mpn/get_d.c
config.status: linking mpn/generic/matrix22_mul.c to mpn/matrix22_mul.c
config.status: linking mpn/generic/hgcd2.c to mpn/hgcd2.c
config.status: linking mpn/generic/hgcd.c to mpn/hgcd.c
config.status: linking mpn/generic/mullo_n.c to mpn/mullo_n.c
config.status: linking mpn/generic/mullo_basecase.c to mpn/mullo_basecase.c
config.status: linking mpn/generic/toom22_mul.c to mpn/toom22_mul.c
config.status: linking mpn/generic/toom32_mul.c to mpn/toom32_mul.c
config.status: linking mpn/generic/toom42_mul.c to mpn/toom42_mul.c
config.status: linking mpn/generic/toom52_mul.c to mpn/toom52_mul.c
config.status: linking mpn/generic/toom62_mul.c to mpn/toom62_mul.c
config.status: linking mpn/generic/toom33_mul.c to mpn/toom33_mul.c
config.status: linking mpn/generic/toom43_mul.c to mpn/toom43_mul.c
config.status: linking mpn/generic/toom53_mul.c to mpn/toom53_mul.c
config.status: linking mpn/generic/toom63_mul.c to mpn/toom63_mul.c
config.status: linking mpn/generic/toom44_mul.c to mpn/toom44_mul.c
config.status: linking mpn/generic/toom6h_mul.c to mpn/toom6h_mul.c
config.status: linking mpn/generic/toom6_sqr.c to mpn/toom6_sqr.c
config.status: linking mpn/generic/toom8h_mul.c to mpn/toom8h_mul.c
config.status: linking mpn/generic/toom8_sqr.c to mpn/toom8_sqr.c
config.status: linking mpn/generic/toom_couple_handling.c to
mpn/toom_couple_handling.c
config.status: linking mpn/generic/toom2_sqr.c to mpn/toom2_sqr.c
config.status: linking mpn/generic/toom3_sqr.c to mpn/toom3_sqr.c
config.status: linking mpn/generic/toom4_sqr.c to mpn/toom4_sqr.c
config.status: linking mpn/generic/toom_eval_dgr3_pm1.c to
mpn/toom_eval_dgr3_pm1.c
config.status: linking mpn/generic/toom_eval_dgr3_pm2.c to
mpn/toom_eval_dgr3_pm2.c
config.status: linking mpn/generic/toom_eval_pm1.c to mpn/toom_eval_pm1.c
config.status: linking mpn/generic/toom_eval_pm2.c to mpn/toom_eval_pm2.c
config.status: linking mpn/generic/toom_eval_pm2exp.c to mpn/toom_eval_pm2exp.c
config.status: linking mpn/generic/toom_eval_pm2rexp.c to
mpn/toom_eval_pm2rexp.c
config.status: linking mpn/generic/toom_interpolate_5pts.c to
mpn/toom_interpolate_5pts.c
config.status: linking mpn/generic/toom_interpolate_6pts.c to
mpn/toom_interpolate_6pts.c
config.status: linking mpn/generic/toom_interpolate_7pts.c to
mpn/toom_interpolate_7pts.c
config.status: linking mpn/generic/toom_interpolate_8pts.c to
mpn/toom_interpolate_8pts.c
config.status: linking mpn/generic/toom_interpolate_12pts.c to
mpn/toom_interpolate_12pts.c
config.status: linking mpn/generic/toom_interpolate_16pts.c to
mpn/toom_interpolate_16pts.c
config.status: linking mpn/generic/invertappr.c to mpn/invertappr.c
config.status: linking mpn/generic/invert.c to mpn/invert.c
config.status: linking mpn/generic/binvert.c to mpn/binvert.c
config.status: linking mpn/generic/mulmod_bnm1.c to mpn/mulmod_bnm1.c
config.status: linking mpn/generic/sqrmod_bnm1.c to mpn/sqrmod_bnm1.c
config.status: linking mpn/generic/sbpi1_div_q.c to mpn/sbpi1_div_q.c
config.status: linking mpn/generic/sbpi1_div_qr.c to mpn/sbpi1_div_qr.c
config.status: linking mpn/generic/sbpi1_divappr_q.c to mpn/sbpi1_divappr_q.c
config.status: linking mpn/generic/dcpi1_div_q.c to mpn/dcpi1_div_q.c
config.status: linking mpn/generic/dcpi1_div_qr.c to mpn/dcpi1_div_qr.c
config.status: linking mpn/generic/dcpi1_divappr_q.c to mpn/dcpi1_divappr_q.c
config.status: linking mpn/generic/mu_div_qr.c to mpn/mu_div_qr.c
config.status: linking mpn/generic/mu_divappr_q.c to mpn/mu_divappr_q.c
config.status: linking mpn/generic/mu_div_q.c to mpn/mu_div_q.c
config.status: linking mpn/generic/bdiv_q_1.c to mpn/bdiv_q_1.c
config.status: linking mpn/generic/sbpi1_bdiv_q.c to mpn/sbpi1_bdiv_q.c
config.status: linking mpn/generic/sbpi1_bdiv_qr.c to mpn/sbpi1_bdiv_qr.c
config.status: linking mpn/generic/dcpi1_bdiv_q.c to mpn/dcpi1_bdiv_q.c
config.status: linking mpn/generic/dcpi1_bdiv_qr.c to mpn/dcpi1_bdiv_qr.c
config.status: linking mpn/generic/mu_bdiv_q.c to mpn/mu_bdiv_q.c
config.status: linking mpn/generic/mu_bdiv_qr.c to mpn/mu_bdiv_qr.c
config.status: linking mpn/generic/bdiv_q.c to mpn/bdiv_q.c
config.status: linking mpn/generic/bdiv_qr.c to mpn/bdiv_qr.c
config.status: linking mpn/generic/divexact.c to mpn/divexact.c
config.status: linking mpn/x86/bdiv_dbm1c.asm to mpn/bdiv_dbm1c.asm
config.status: linking mpn/generic/redc_1.c to mpn/redc_1.c
config.status: linking mpn/generic/redc_2.c to mpn/redc_2.c
config.status: linking mpn/generic/redc_n.c to mpn/redc_n.c
config.status: linking mpn/generic/powm.c to mpn/powm.c
config.status: linking mpn/generic/powlo.c to mpn/powlo.c
config.status: linking mpn/generic/powm_sec.c to mpn/powm_sec.c
config.status: linking mpn/generic/subcnd_n.c to mpn/subcnd_n.c
config.status: linking mpn/generic/redc_1_sec.c to mpn/redc_1_sec.c
config.status: linking mpn/generic/trialdiv.c to mpn/trialdiv.c
config.status: linking mpn/generic/remove.c to mpn/remove.c
config.status: linking mpn/generic/logops_n.c to mpn/and_n.c
config.status: linking mpn/generic/logops_n.c to mpn/andn_n.c
config.status: linking mpn/generic/logops_n.c to mpn/nand_n.c
config.status: linking mpn/generic/logops_n.c to mpn/ior_n.c
config.status: linking mpn/generic/logops_n.c to mpn/iorn_n.c
config.status: linking mpn/generic/logops_n.c to mpn/nior_n.c
config.status: linking mpn/generic/logops_n.c to mpn/xor_n.c
config.status: linking mpn/generic/logops_n.c to mpn/xnor_n.c
config.status: linking mpn/x86/copyi.asm to mpn/copyi.asm
config.status: linking mpn/x86/p6/copyd.asm to mpn/copyd.asm
config.status: linking mpn/generic/zero.c to mpn/zero.c
config.status: linking mpn/x86/umul.asm to mpn/umul.asm
config.status: linking mpn/x86/udiv.asm to mpn/udiv.asm
config.status: linking mpn/x86/invert_limb.asm to mpn/invert_limb.asm
config.status: linking mpn/x86/p6/gmp-mparam.h to gmp-mparam.h
config.status: executing libtool commands
libtool: you must specify a MODE
libtool: Try `libtool --help' for more information.
>>> host-gmp 5.0.1 Building
PATH=/home/student/beagle/buildroot-2011.08/output/host/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/sbin:/usr/sbin:/home/student/beagle/crosstool-ng/development/xtools/bin:/home/student/beagle/crosstool-ng/development/xtools/arm-unknown-linux-gnueabi/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin
LD_LIBRARY_PATH="/home/student/beagle/buildroot-2011.08/output/host/usr/lib:"
PKG_CONFIG=""
PKG_CONFIG_LIBDIR="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/pkgconfig"
PERLLIB="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/
make[1]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
/usr/bin/gcc -std=gnu99 `test -f 'gen-fac_ui.c' || echo './'`gen-fac_ui.c -o
gen-fac_ui
/usr/bin/gcc -std=gnu99 `test -f 'gen-fib.c' || echo './'`gen-fib.c -o gen-fib
/usr/bin/gcc -std=gnu99 `test -f 'gen-bases.c' || echo './'`gen-bases.c -o
gen-bases -lm
/usr/bin/gcc -std=gnu99 `test -f 'gen-trialdivtab.c' || echo
'./'`gen-trialdivtab.c -o gen-trialdivtab -lm
/usr/bin/gcc -std=gnu99 `test -f 'gen-psqr.c' || echo './'`gen-psqr.c -o
gen-psqr -lm
./gen-fac_ui 32 0 >mpz/fac_ui.h || (rm -f mpz/fac_ui.h; exit 1)
./gen-fib header 32 0 >fib_table.h || (rm -f fib_table.h; exit 1)
./gen-fib table 32 0 >mpn/fib_table.c || (rm -f mpn/fib_table.c; exit 1)
./gen-bases header 32 0 >mp_bases.h || (rm -f mp_bases.h; exit 1)
./gen-bases table 32 0 >mpn/mp_bases.c || (rm -f mpn/mp_bases.c; exit 1)
./gen-trialdivtab 32 8000 >trialdivtab.h || (rm -f trialdivtab.h; exit 1)
./gen-psqr 32 0 >mpn/perfsqr.h || (rm -f mpn/perfsqr.h; exit 1)
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
Making all in tests
make[3]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in .
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in devel
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/devel'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/devel'
Making all in mpn
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpn'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpn'
Making all in mpz
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpz'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpz'
Making all in mpq
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpq'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpq'
Making all in mpf
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpf'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpf'
Making all in rand
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/rand'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/rand'
Making all in misc
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/misc'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/misc'
Making all in cxx
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/cxx'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/cxx'
Making all in mpbsd
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpbsd'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpbsd'
make[3]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in mpn
make[3]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/mpn'
/bin/sh ../libtool --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo fib_table |
sed 's/_$//'`    -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include -c -o
fib_table.lo fib_table.c
/bin/sh ../libtool --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo mp_bases |
sed 's/_$//'`    -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include -c -o
mp_bases.lo mp_bases.c
../libtool: line 519: CDPATH: command not found
../libtool: line 519: CDPATH: command not found
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/libtool:
line 519: CDPATH: command not found
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/libtool:
line 519: CDPATH: command not found
libtool: Version mismatch error.  This is libtool 2.2.6b, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.6b
libtool: and run autoconf again.
make[3]: *** [fib_table.lo] Error 63
make[3]: *** Waiting for unfinished jobs....
libtool: Version mismatch error.  This is libtool 2.2.6b, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.6b
libtool: and run autoconf again.
make[3]: *** [mp_bases.lo] Error 63
make[3]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/mpn'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
make: ***
[/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/.stamp_built]
Error 2
>>> host-gmp 5.0.1 Building
PATH=/home/student/beagle/buildroot-2011.08/output/host/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/sbin:/usr/sbin:/home/student/beagle/crosstool-ng/development/xtools/bin:/home/student/beagle/crosstool-ng/development/xtools/arm-unknown-linux-gnueabi/bin:/home/student/beagle/buildroot-2011.08/output/host/usr/bin
LD_LIBRARY_PATH="/home/student/beagle/buildroot-2011.08/output/host/usr/lib:"
PKG_CONFIG=""
PKG_CONFIG_LIBDIR="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/pkgconfig"
PERLLIB="/home/student/beagle/buildroot-2011.08/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/
make[1]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
/usr/bin/make  all-recursive
make[2]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
Making all in tests
make[3]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in .
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
make[4]: Nothing to be done for `all-am'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in devel
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/devel'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/devel'
Making all in mpn
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpn'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpn'
Making all in mpz
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpz'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpz'
Making all in mpq
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpq'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpq'
Making all in mpf
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpf'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpf'
Making all in rand
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/rand'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/rand'
Making all in misc
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/misc'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/misc'
Making all in cxx
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/cxx'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/cxx'
Making all in mpbsd
make[4]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpbsd'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests/mpbsd'
make[3]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/tests'
Making all in mpn
make[3]: Entering directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/mpn'
/bin/sh ../libtool --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo fib_table |
sed 's/_$//'`    -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include -c -o
fib_table.lo fib_table.c
/bin/sh ../libtool --tag=CC   --mode=compile /usr/bin/gcc -std=gnu99
-DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo mp_bases |
sed 's/_$//'`    -O2
-I/home/student/beagle/buildroot-2011.08/output/host/include
-I/home/student/beagle/buildroot-2011.08/output/host/usr/include -c -o
mp_bases.lo mp_bases.c
../libtool: line 519: CDPATH: command not found
../libtool: line 519: CDPATH: command not found
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/libtool:
line 519: CDPATH: command not found
/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/libtool:
line 519: CDPATH: command not found
libtool: Version mismatch error.  This is libtool 2.2.6b, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.6b
libtool: and run autoconf again.
libtool: Version mismatch error.  This is libtool 2.2.6b, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.6b
libtool: and run autoconf again.
make[3]: *** [fib_table.lo] Error 63
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [mp_bases.lo] Error 63
make[3]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/mpn'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1'
make: ***
[/home/student/beagle/buildroot-2011.08/output/build/host-gmp-5.0.1/.stamp_built]
Error 2
student at ThinkPad-X60s-2:~/projects/lf411/LF411_for_trainer/11$

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
