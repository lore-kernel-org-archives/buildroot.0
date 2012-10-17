From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Oct 2012 04:40:29 +0000 (UTC)
Subject: [Buildroot] [Bug 3631] Error while compiling with Xorg
In-Reply-To: <bug-3631-163@https.bugs.busybox.net/>
References: <bug-3631-163@https.bugs.busybox.net/>
Message-ID: <20121017044029.6EC499989D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3631

Jith Kumar <jithvk@hotmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |

--- Comment #3 from Jith Kumar <jithvk@hotmail.com> 2012-10-17 04:40:28 UTC ---
I tried this same options on 2012.08 and this bug is still there. 

------------------------------------8<----------------------------
jith@nfcdev:buildroot-2012.08$ make
>>> xdriver_xf86-video-fbdev 0.4.2 Configuring
(cd
/home/jith/Work/Qemu/buildroot-2012.08/output/build/xdriver_xf86-video-fbdev-0.4.2/
&& rm -rf config.cache &&
PATH="/home/jith/Work/Qemu/buildroot-2012.08/output/host/bin:/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin:/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/sbin/:/usr/lib/qt-3.3/bin:/usr/lib/ccache:/home/jith/bin:/usr/local/bin:/usr/bin:/bin:/opt/android/android-sdk/platform-tools/:/opt/arm-linaro-4.6/bin/:/opt/mips-linux-4.4-codesourcery/bin:/usr/local/sbin:/usr/sbin:/opt/android/android-sdk/platform-tools/:/opt/arm-linaro-4.6/bin/:/opt/mips-linux-4.4-codesourcery/bin:/home/jith/.local/bin:/home/jith/bin:/opt/android/android-sdk/platform-tools/:/opt/arm-linaro-4.6/bin/:/opt/mips-linux-4.4-codesourcery/bin"
AR="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar"
AS="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
LD="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"
NM="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm"
CC="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
GCC="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc"
CPP="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp"
CXX="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++"
FC="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gfortran"
RANLIB="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib"
STRIP="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip"
OBJCOPY="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objcopy"
OBJDUMP="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/lib/ccache/gcc" GCC_FOR_BUILD="/usr/lib/ccache/gcc"
CXX_FOR_BUILD="/usr/lib/ccache/g++" FC_FOR_BUILD="/usr/bin/ld"
LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2
-I/home/jith/Work/Qemu/buildroot-2012.08/output/host/include
-I/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/home/jith/Work/Qemu/buildroot-2012.08/output/host/include
-I/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/home/jith/Work/Qemu/buildroot-2012.08/output/host/lib
-L/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/lib
-Wl,-rpath,/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-as"
DEFAULT_LINKER="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld"
CFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/pkg-config"
PERLLIB="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/lib/perl"
STAGING_DIR="/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure
--target=arm-unknown-linux-uclibcgnueabi --host=arm-unknown-linux-uclibcgnueabi
--build=i686-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc
--program-prefix="" --disable-gtk-doc   --enable-ipv6 --enable-static
--enable-shared   )
configure: WARNING: unrecognized options: --disable-gtk-doc, --enable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-unknown-linux-uclibcgnueabi-strip...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking whether to enable maintainer-specific portions of Makefiles... no
checking for style of include used by make... GNU
checking for arm-unknown-linux-uclibcgnueabi-gcc...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
accepts -g... yes
checking for
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
option to accept ISO C89... none needed
checking dependency style of
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc...
gcc3
checking how to run the C preprocessor...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-cpp
checking for grep that handles long lines and -e... /usr/bin/grep
checking for egrep... /usr/bin/grep -E
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
checking for
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
option to accept ISO C99... -std=gnu99
checking pkg-config is at least version 0.9.0... yes
checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-uclibcgnueabi
Package xorg-macros was not found in the pkg-config search path.
Perhaps you should add the directory containing `xorg-macros.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xorg-macros' found
checking for a sed that does not truncate output... /usr/bin/sed
checking for fgrep... /usr/bin/grep -F
checking for ld used by
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
checking if the linker
(/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
is GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
checking the name lister
(/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm)
interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 1572864
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... yes
checking for
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
option to reload object files... -r
checking for arm-unknown-linux-uclibcgnueabi-objdump...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-unknown-linux-uclibcgnueabi-ar...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ar
checking for arm-unknown-linux-uclibcgnueabi-strip... (cached)
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-strip
checking for arm-unknown-linux-uclibcgnueabi-ranlib...
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ranlib
checking command to parse
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-nm
output from
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 object... ok
checking for dlfcn.h... yes
checking for objdir... .libs
checking if
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 supports -fno-rtti -fno-exceptions... no
checking for
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 option to produce PIC... -fPIC -DPIC
checking if
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 PIC flag -fPIC -DPIC works... yes
checking if
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 static flag -static works... yes
checking if
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 supports -c -o file.o... yes
checking if
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 supports -c -o file.o... (cached) yes
checking whether the
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-std=gnu99 linker
(/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for arm-unknown-linux-uclibcgnueabi-gcc... (cached)
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
checking whether we are using the GNU C compiler... (cached) yes
checking whether
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
accepts -g... (cached) yes
checking for
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
option to accept ISO C89... (cached) none needed
checking dependency style of
/home/jith/Work/Qemu/buildroot-2012.08/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc...
(cached) gcc3
checking if RANDR is defined... no
checking if RENDER is defined... no
checking if XV is defined... no
checking for XORG... PKG_CONFIG_PATH =  configure: error: Package requirements
(xorg-server >= 1.0.99.901 xproto fontsproto ) were not met:

No package 'xorg-server' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables XORG_CFLAGS
and XORG_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
