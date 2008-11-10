From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 08:47:22 -0800
Subject: [Buildroot] [buildroot 0006074]: libsexy requires libxml or cannot
	found them
Message-ID: <cdfcad56d67c00a694df72391c5383be@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6074 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6074
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 08:47 PST
Last Modified:              11-10-2008 08:47 PST
====================================================================== 
Summary:                    libsexy requires libxml or cannot found them
Description: 
>>> libsexy 0.1.11 Extracting
>>> libsexy 0.1.11 Patching libtool

Applying buildroot-libtool.patch using plaintext: 
patching file ltmain.sh
>>> libsexy 0.1.11 Patching package/libsexy/libsexy
>>> libsexy 0.1.11 Configuring
cd /home/roberto/gles/buildroot/build_i586/libsexy-0.1.11/ && rm -f
config.cache && \
	PATH="/home/roberto/gles/buildroot/toolchain_build_i586/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/bin:/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin:/home/roberto/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
AR="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
LD="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/"
NM="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
CC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
GCC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CPP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-cpp
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
CXX="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64"
FC="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gfortran
"
RANLIB="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib"
STRIP="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-sstrip"
OBJCOPY="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-objcopy"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="" CXXFLAGS_FOR_BUILD=""
LDFLAGS_FOR_BUILD="" FCFLAGS_FOR_BUILD=""
AR_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar"
AS_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
CC_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc"
LD_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
NM_FOR_TARGET="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm"
DEFAULT_ASSEMBLER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-as"
DEFAULT_LINKER="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld"
PKG_CONFIG_SYSROOT_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir"
PKG_CONFIG="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/pkg-config"
PKG_CONFIG_PATH="/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib/pkgconfig:"
STAGING_DIR="/home/roberto/gles/buildroot/build_i586/staging_dir" \
	ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_c_bigendian=no \
	 \
		./configure \
		--target=i586-linux \
		--host=i586-linux \
		--build=i386-pc-linux-gnu \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		 
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking for i586-linux-strip...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-sstrip
checking for i586-linux-gcc...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables... 
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 accepts -g... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... gcc3
checking how to run the C preprocessor...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-cpp
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64
checking whether make sets $(MAKE)... (cached) yes
checking whether ln -s works... yes
checking for a BSD-compatible install... /usr/bin/install -c
checking for an ANSI C-conforming const... yes
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
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
checking for size_t... yes
checking build system type... i386-pc-linux-gnu
checking host system type... i586-pc-linux-gnu
checking for a sed that does not truncate output...
/home/roberto/gles/buildroot/toolchain_build_i586/bin/sed
checking for ld used by
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/
checking if the linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) is GNU
ld... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ option to
reload object files... -r
checking for BSD-compatible nm...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm
checking how to recognise dependent libraries... pass_all
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking whether we are using the GNU C++ compiler... yes
checking whether
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 accepts -g... yes
checking dependency style of
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... gcc3
checking how to run the C++ preprocessor...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -E
checking for i586-linux-g77... no
checking for i586-linux-f77... no
checking for i586-linux-xlf... no
checking for i586-linux-frt... no
checking for i586-linux-pgf77... no
checking for i586-linux-cf77... no
checking for i586-linux-fort77... no
checking for i586-linux-fl32... no
checking for i586-linux-af77... no
checking for i586-linux-f90... no
checking for i586-linux-xlf90... no
checking for i586-linux-pgf90... no
checking for i586-linux-pghpf... no
checking for i586-linux-epcf90... no
checking for i586-linux-gfortran... no
checking for i586-linux-g95... no
checking for i586-linux-f95... no
checking for i586-linux-fort... no
checking for i586-linux-xlf95... no
checking for i586-linux-ifort... no
checking for i586-linux-ifc... no
checking for i586-linux-efc... no
checking for i586-linux-pgf95... no
checking for i586-linux-lf95... no
checking for i586-linux-ftn... no
checking for g77... no
checking for f77... no
checking for xlf... no
checking for frt... no
checking for pgf77... no
checking for cf77... no
checking for fort77... no
checking for fl32... no
checking for af77... no
checking for f90... no
checking for xlf90... no
checking for pgf90... no
checking for pghpf... no
checking for epcf90... no
checking for gfortran... no
checking for g95... no
checking for f95... no
checking for fort... no
checking for xlf95... no
checking for ifort... no
checking for ifc... no
checking for efc... no
checking for pgf95... no
checking for lf95... no
checking for ftn... no
checking whether we are using the GNU Fortran 77 compiler... no
checking whether  accepts -g... no
checking the maximum length of command line arguments... 32768
checking command to parse
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-nm
output from
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 object... ok
checking for objdir... .libs
checking for i586-linux-ar...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ar
checking for i586-linux-ranlib...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ranlib
checking for i586-linux-strip... (cached)
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-sstrip
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 supports -fno-rtti -fno-exceptions... no
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to produce PIC... -fPIC
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 PIC flag -fPIC works... yes
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 static flag -static works... yes
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 supports -c -o file.o... yes
checking whether the
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) supports
shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64...
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/
checking if the linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) is GNU
ld... yes
checking whether the
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) supports
shared libraries... yes
checking for
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 option to produce PIC... -fPIC
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 PIC flag -fPIC works... yes
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 static flag -static works... no
checking if
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 supports -c -o file.o... yes
checking whether the
/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-g++
-Os  -I/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include
-I/home/roberto/gles/buildroot/build_i586/staging_dir/include
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/ -isysroot
/home/roberto/gles/buildroot/build_i586/staging_dir -mtune=i586
-march=i586 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 linker
(/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-ld
-L/home/roberto/gles/buildroot/build_i586/staging_dir/lib
-L/home/roberto/gles/buildroot/build_i586/staging_dir/usr/lib
--sysroot=/home/roberto/gles/buildroot/build_i586/staging_dir/) supports
shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
appending configuration tag "F77" to libtool
checking pkg-config is at least version 0.9.0... yes
checking for PACKAGE... configure: error: Package requirements (pango >=
1.4.0, glib-2.0 >= 2.4.0, gtk+-2.0 >= 2.4.0, libxml-2.0) were not met:

No package 'libxml-2.0' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables PACKAGE_CFLAGS
and PACKAGE_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

make: ***
[/home/roberto/gles/buildroot/build_i586/libsexy-0.1.11/.stamp_configured]
Error 1
roberto at rafbook:~/gles/buildroot$ find . -name libxml\*

roberto at rafbook:~/gles/buildroot$ find . -name \*libxml\*
./build_i586/libxml2-2.6.32

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 08:47  robang74       New Issue                                    
11-10-08 08:47  robang74       Status                   new => assigned     
11-10-08 08:47  robang74       Assigned To               => buildroot       
======================================================================
