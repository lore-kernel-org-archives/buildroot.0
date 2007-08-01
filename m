From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Wed, 1 Aug 2007 23:05:15 +0200 (CEST)
Subject: [Buildroot] Configuring in i486-linux-uclibc/libstdc++-v3 fails
Message-ID: <0708012301540.8944@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(after update to trunk) Am I missing something? Any ideas?

make[3]: Leaving directory `/data/cii/buildroot/buildroot/build_i486/gcc-4.2.1-target/gcc'
Checking multilib configuration for libstdc++-v3...
Configuring in i486-linux-uclibc/libstdc++-v3
configure: loading cache ./config.cache
checking build system type... (cached) i386-pc-linux-gnu
checking host system type... (cached) i486-pc-linux-uclibc
checking target system type... (cached) i486-pc-linux-uclibc
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... (cached) gawk
checking whether /usr/bin/make sets $(MAKE)... (cached) yes
checking for i486-linux-uclibc-strip... (cached) i486-linux-uclibc-strip
checking how to run the C preprocessor... (cached) i486-linux-uclibc-cc  -E
checking for egrep... (cached) grep -E
checking for i486-linux-uclibc-gcc... (cached) i486-linux-uclibc-cc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...
checking for suffix of object files... (cached) o
checking whether we are using the GNU C compiler... (cached) yes
checking whether i486-linux-uclibc-cc  accepts -g... (cached) yes
checking for i486-linux-uclibc-cc  option to accept ANSI C... (cached) none needed
checking for i486-linux-uclibc-g++... (cached)  i486-linux-uclibc-c++
checking whether we are using the GNU C++ compiler... (cached) no
checking whether  i486-linux-uclibc-c++  accepts -g... (cached) no
checking whether ln -s works... yes
checking for i486-linux-uclibc-as... (cached) i486-linux-uclibc-as
checking for i486-linux-uclibc-ar... (cached) i486-linux-uclibc-ar
checking for i486-linux-uclibc-ranlib... (cached) i486-linux-uclibc-ranlib
checking whether to enable maintainer-specific portions of Makefiles... no
configure: CPU config directory is cpu/i486
configure: OS config directory is os/uclibc
checking for ld used by GCC... (cached) i486-linux-uclibc-ld
checking if the linker (i486-linux-uclibc-ld) is GNU ld... (cached) yes
checking for i486-linux-uclibc-ld option to reload object files... (cached) -r
checking for BSD-compatible nm... (cached) i486-linux-uclibc-nm
checking how to recognise dependant libraries... (cached) pass_all
checking the maximum length of command line arguments... (cached) 49153
checking for i486-linux-uclibc-ranlib... (cached) i486-linux-uclibc-ranlib
checking for i486-linux-uclibc-strip... (cached) i486-linux-uclibc-strip
updating cache ./config.cache
loading cache ./config.cache within ltconfig
checking whether -lc should be explicitly linked in... (cached) no
checking for objdir... .libs
checking for i486-linux-uclibc-cc option to produce PIC...  -fPIC -DPIC
checking if i486-linux-uclibc-cc PIC flag  -fPIC -DPIC works... (cached) yes
checking if i486-linux-uclibc-cc static flag -static works... (cached) yes
finding the maximum length of command line arguments... (cached) 49153
checking if i486-linux-uclibc-cc supports -c -o file.o... (cached) yes
checking if i486-linux-uclibc-cc supports -fno-rtti -fno-exceptions ... no
checking whether the linker (i486-linux-uclibc-ld) supports shared libraries... yes
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking command to parse i486-linux-uclibc-nm output... ok
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
creating libtool
updating cache ./config.cache
configure: loading cache ./config.cache
checking how to run the C++ preprocessor... /lib/cpp
loading cache ./config.cache within ltconfig
checking host system type... i486-pc-linux-uclibc
checking build system type... i386-pc-linux-gnu
ltcf-cxx.sh: error: problem compiling test program
checking for objdir... .libs
checking for i486-linux-uclibc-c++ option to produce PIC...  -DPIC
checking if i486-linux-uclibc-c++ PIC flag  -DPIC works... no
checking if i486-linux-uclibc-c++ static flag  works... no
finding the maximum length of command line arguments... (cached) 49153
checking if i486-linux-uclibc-c++ supports -c -o file.o... (cached) yes
checking whether the linker (i486-linux-uclibc-ld) supports shared libraries...
checking how to hardcode library paths into programs... unsupported
checking whether stripping libraries is possible... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking command to parse i486-linux-uclibc-nm output... failed
checking if libtool supports shared libraries... no
checking whether to build shared libraries... no
checking whether to build static libraries... yes
appending configuration tag "CXX" to libtool
checking for exception model to use... configure: error: unable to detect exception model
make[2]: *** [configure-target-libstdc++-v3] Error 1
make[2]: Leaving directory `/data/cii/buildroot/buildroot/build_i486/gcc-4.2.1-target'


Cheers,

-- 
Cristian
