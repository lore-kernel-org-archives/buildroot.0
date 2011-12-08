From: Alireza Nematollahi <alirezan1@gmail.com>
Date: Wed, 7 Dec 2011 21:15:27 -0800
Subject: [Buildroot] Error building for ARM Cortex A8 - "For cortex-a8 real
	value is cortexa8"
Message-ID: <CAOh8SabFka2WK=WK0Uu2KRFw1kfkfBsXKMxWTFXLRwEdC3bnKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I am trying to build "buildroot" on CentOS 6 64 bit for my ARM Cortex A8
target. I have gcc/g++ 4.2. In the settings for buildroot the only one I
change is the target type, arm and arm cortex a8. I left everything else
untouched to build a default copy.

Everytime I build I get the same error message:
"/usr/bin/make -j2 -C
/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial
all-gcc
make[1]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial'
Configuring in ./gcc
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty'
make[3]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty/testsuite'
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/intl'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/intl'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty'
make[3]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite'
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libdecnumber'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libdecnumber'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/fixincludes'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/fixincludes'
make[2]: Entering directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libcpp'
test -f config.h || (rm -f stamp-h1 && /usr/bin/make stamp-h1)
make[2]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libcpp'
configure: loading cache ./config.cache
checking build system type... i686-pc-linux-gnu
checking host system type... i686-pc-linux-gnu
checking target system type... arm-unknown-linux-uclibcgnueabi
checking LIBRARY_PATH variable... ok
checking GCC_EXEC_PREFIX variable... ok
checking whether to place generated files in the source directory... no
checking whether a default linker was specified... no
checking whether a default assembler was specified... no
checking for i686-pc-linux-gnu-gcc... /usr/bin/gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether /usr/bin/gcc accepts -g... yes
checking for /usr/bin/gcc option to accept ANSI C... none needed
checking whether /usr/bin/gcc and cc understand -c and -o together... yes
checking how to run the C preprocessor... /usr/bin/gcc -E
checking for inline... inline
checking for egrep... grep -E
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
checking for void *... yes
checking size of void *... 4
checking for short... yes
checking size of short... 2
checking for int... yes
checking size of int... 4
checking for long... yes
checking size of long... 4
checking for long long... yes
checking for long long... (cached) yes
checking size of long long... 8
checking for __int64... no
checking whether /usr/bin/gcc supports -W... yes
checking whether /usr/bin/gcc supports -Wall... yes
checking whether /usr/bin/gcc supports -Wwrite-strings... yes
checking whether /usr/bin/gcc supports -Wstrict-prototypes... yes
checking whether /usr/bin/gcc supports -Wmissing-prototypes... yes
checking whether /usr/bin/gcc supports -Wc++-compat... yes
checking whether /usr/bin/gcc supports -Wold-style-definition... yes
checking whether /usr/bin/gcc supports -Wmissing-format-attribute... yes
checking whether /usr/bin/gcc supports -pedantic -Wno-long-long
-Wno-variadic-macros      -Wno-overlength-strings... yes
checking valgrind.h usability... no
checking valgrind.h presence... no
checking for valgrind.h... no
configure: WARNING: fixed-point is not supported for this target
checking whether make sets $(MAKE)... yes
checking for gawk... gawk
checking whether ln -s works... yes
checking whether ln works... yes
checking for i686-pc-linux-gnu-ranlib... ranlib
checking for a BSD compatible install... /usr/bin/install -c
checking for cmp's capabilities... gnucompare
checking for mktemp... yes
checking for makeinfo... makeinfo
checking for modern makeinfo... yes
checking for recent Pod::Man... yes
checking for flex... flex
checking for bison... bison
checking for nm... /usr/bin/nm
checking for ar... /usr/bin/ar
checking for GNU C library... yes
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking whether string.h and strings.h may both be included... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for limits.h... yes
checking for stddef.h... yes
checking for string.h... (cached) yes
checking for strings.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for time.h... yes
checking for iconv.h... yes
checking for fcntl.h... yes
checking for unistd.h... (cached) yes
checking for sys/file.h... yes
checking for sys/time.h... yes
checking for sys/mman.h... yes
checking for sys/resource.h... yes
checking for sys/param.h... yes
checking for sys/times.h... yes
checking for sys/stat.h... (cached) yes
checking for direct.h... no
checking for malloc.h... yes
checking for langinfo.h... yes
checking for ldfcn.h... no
checking for locale.h... yes
checking for wchar.h... yes
checking for thread.h... no
checking for pthread.h... yes
checking for CHAR_BIT... yes
checking whether byte ordering is bigendian... no
checking for collect2 libraries... none required
checking for library containing exc_resume... no
checking for library containing ldexp... none required
checking for inttypes.h... yes
checking for times... yes
checking for clock... yes
checking for kill... yes
checking for getrlimit... yes
checking for setrlimit... yes
checking for atoll... yes
checking for atoq... no
checking for sysconf... yes
checking for strsignal... yes
checking for getrusage... yes
checking for nl_langinfo... yes
checking for scandir... yes
checking for alphasort... yes
checking for gettimeofday... yes
checking for mbstowcs... yes
checking for wcswidth... yes
checking for mmap... yes
checking for mincore... yes
checking for setlocale... yes
checking for clearerr_unlocked... yes
checking for feof_unlocked... yes
checking for ferror_unlocked... yes
checking for fflush_unlocked... yes
checking for fgetc_unlocked... yes
checking for fgets_unlocked... yes
checking for fileno_unlocked... yes
checking for fprintf_unlocked... no
checking for fputc_unlocked... yes
checking for fputs_unlocked... yes
checking for fread_unlocked... yes
checking for fwrite_unlocked... yes
checking for getchar_unlocked... yes
checking for getc_unlocked... yes
checking for putchar_unlocked... yes
checking for putc_unlocked... yes
checking whether mbstowcs works... yes
checking for ssize_t... yes
checking for uid_t in sys/types.h... yes
checking type of array argument to getgroups... gid_t
checking for sys/mman.h... (cached) yes
checking for mmap... (cached) yes
checking whether read-only mmap of a plain file works... yes
checking whether mmap from /dev/zero works... yes
checking for MAP_ANON(YMOUS)... yes
checking whether mmap with MAP_ANON(YMOUS) works... yes
checking for pid_t... yes
checking for unistd.h... (cached) yes
checking for vfork.h... no
checking for fork... yes
checking for vfork... yes
checking for working fork... yes
checking for working vfork... (cached) yes
checking for ld used by GCC... /usr/bin/ld
checking if the linker (/usr/bin/ld) is GNU ld... yes
checking for shared library run path origin... done
checking for iconv... yes
checking for iconv declaration...
         extern size_t iconv (iconv_t cd, char * *inbuf, size_t
*inbytesleft, char * *outbuf, size_t *outbytesleft);
checking for LC_MESSAGES... yes
checking for nl_langinfo and CODESET... yes
checking whether getenv is declared... yes
checking whether atol is declared... yes
checking whether asprintf is declared... yes
checking whether sbrk is declared... yes
checking whether abort is declared... yes
checking whether atof is declared... yes
checking whether getcwd is declared... yes
checking whether getwd is declared... yes
checking whether strsignal is declared... yes
checking whether strstr is declared... yes
checking whether strverscmp is declared... yes
checking whether errno is declared... yes
checking whether snprintf is declared... yes
checking whether vsnprintf is declared... yes
checking whether vasprintf is declared... yes
checking whether malloc is declared... yes
checking whether realloc is declared... yes
checking whether calloc is declared... yes
checking whether free is declared... yes
checking whether basename is declared... yes
checking whether getopt is declared... no
checking whether clock is declared... yes
checking whether getpagesize is declared... yes
checking whether clearerr_unlocked is declared... yes
checking whether feof_unlocked is declared... yes
checking whether ferror_unlocked is declared... yes
checking whether fflush_unlocked is declared... yes
checking whether fgetc_unlocked is declared... yes
checking whether fgets_unlocked is declared... yes
checking whether fileno_unlocked is declared... yes
checking whether fprintf_unlocked is declared... no
checking whether fputc_unlocked is declared... yes
checking whether fputs_unlocked is declared... yes
checking whether fread_unlocked is declared... yes
checking whether fwrite_unlocked is declared... yes
checking whether getchar_unlocked is declared... yes
checking whether getc_unlocked is declared... yes
checking whether putchar_unlocked is declared... yes
checking whether putc_unlocked is declared... yes
checking whether getrlimit is declared... yes
checking whether setrlimit is declared... yes
checking whether getrusage is declared... yes
checking whether ldgetname is declared... no
checking whether times is declared... yes
checking whether sigaltstack is declared... yes
checking for struct tms... yes
checking for clock_t... yes
checking for .preinit_array/.init_array/.fini_array support... yes
checking if mkdir takes one argument... no
For  real value is
For cortex-a8 real value is cortexa8
Unknown arch used in --with-arch=armv7-a
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial'
make: ***
[/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/.compiled]
Error 2"

I don't know what I am doing wrong or what is wrong with my set up. Can
anybody help me with this please? I am fairly new to this.

Thanks very much
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111207/7dd6d90f/attachment-0001.html>
