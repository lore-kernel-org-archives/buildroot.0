From: Chrissy <c.pfindel@googlemail.com>
Date: Mon, 07 Dec 2009 00:10:29 +0100
Subject: [Buildroot] Problem configuring dbus-glib
Message-ID: <4B1C39E5.4020402@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

while configuring dbus-glib I get the following error:


 >>> dbus-glib 0.80 Configuring
cd /media/f_mp3/MiniFS/buildroot-2009.11/output/build/dbus-glib-0.80/ && 
rm -f config.cache && \
	PATH="/media/f_mp3/MiniFS/buildroot-2009.11/output/host/bin:/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/bin:/media/f_mp3/MiniFS/buildroot-2009.11/output/toolchain/bin:/media/f_mp3/MiniFS/toolchain/bin:/usr/realtime/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
AR="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ar" 
AS="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-as" 
LD="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld" 
NM="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-nm" 
CC="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" 
GCC="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" 
CPP="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-cpp -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" 
CXX="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" 
FC="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gfortran " 
RANLIB="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ranlib" 
STRIP="/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/usr/bin/i686-linux-sstrip" 
OBJCOPY="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-objcopy" 
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" 
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" 
CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" 
LD_FOR_BUILD="/usr/bin/ld" 
CFLAGS_FOR_BUILD="-I/media/f_mp3/MiniFS/buildroot-2009.11/output/host/include 
-I/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/include" 
CXXFLAGS_FOR_BUILD="-I/media/f_mp3/MiniFS/buildroot-2009.11/output/host/include 
-I/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/include" 
LDFLAGS_FOR_BUILD="-L/media/f_mp3/MiniFS/buildroot-2009.11/output/host/lib 
-L/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/lib" 
FCFLAGS_FOR_BUILD="" 
AR_FOR_TARGET="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ar" 
AS_FOR_TARGET="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-as" 
CC_FOR_TARGET="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc" 
LD_FOR_TARGET="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld" 
NM_FOR_TARGET="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-nm" 
DEFAULT_ASSEMBLER="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-as" 
DEFAULT_LINKER="/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld" 
PKG_CONFIG_SYSROOT_DIR="/media/f_mp3/MiniFS/buildroot-2009.11/output/staging" 
PKG_CONFIG="/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/bin/pkg-config" 
PKG_CONFIG_PATH="/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/usr/lib/pkgconfig:" 
STAGING_DIR="/media/f_mp3/MiniFS/buildroot-2009.11/output/staging" \
	ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes 
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes 
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes 
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes 
ac_cv_c_bigendian=no \
	CFLAGS="-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" CXXFLAGS="-Os 
-pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" 
LDFLAGS="--sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/" FCFLAGS=""  \
	ac_cv_have_abstract_sockets=yes ac_cv_func_posix_getpwnam_r=yes 
have_abstract_sockets=yes \
	./configure \
	 
--cache-file="/media/f_mp3/MiniFS/buildroot-2009.11/output/build/tgt-config.cache" 
\
		--target=i686-linux \
		--host=i686-linux \
		--build=i386-pc-linux-gnu \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--disable-gtk-doc \
		 \
		 \
		 \
		 --localstatedir=/var --program-prefix="" --disable-tests 
--disable-xml-docs 
--with-introspect-xml=/media/f_mp3/MiniFS/buildroot-2009.11/output/build/dbus-1.2.16-host/introspect.xml 
--with-dbus-binding-tool=/media/f_mp3/MiniFS/buildroot-2009.11/output/host/usr/bin/dbus-binding-tool 
--disable-bash-completion --disable-doxygen-docs --enable-asserts=yes
configure: WARNING: unrecognized options: --disable-xml-docs, 
--with-dbus-binding-tool
configure: loading cache 
/media/f_mp3/MiniFS/buildroot-2009.11/output/build/tgt-config.cache
checking build system type... (cached) i386-pc-linux-gnu
checking host system type... (cached) i686-pc-linux-gnu
checking target system type... (cached) i686-pc-linux-gnu
checking for a BSD-compatible install... (cached) /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... (cached) /bin/mkdir -p
checking for gawk... (cached) mawk
checking whether make sets $(MAKE)... (cached) yes
checking for i686-linux-strip... (cached) 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/usr/bin/i686-linux-sstrip
checking whether to enable maintainer-specific portions of Makefiles... no
checking for i686-linux-gcc... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...
checking for suffix of object files... (cached) o
checking whether we are using the GNU C compiler... (cached) yes
checking whether /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os 
-pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ accepts -g... 
(cached) yes
checking for /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
option to accept ISO C89... (cached) none needed
checking for style of include used by make... GNU
checking dependency style of 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/... 
(cached) gcc3
checking whether we are using the GNU C++ compiler... (cached) yes
checking whether /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os 
-pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ accepts -g... 
(cached) yes
checking dependency style of 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/... 
(cached) gcc3
checking for library containing strerror... (cached) none required
checking how to run the C preprocessor... 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-cpp -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/
checking for grep that handles long lines and -e... (cached) /bin/grep
checking for egrep... (cached) /bin/grep -E
checking for ANSI C header files... (cached) yes
checking whether gcc understands -Wfloat-equal... yes
checking for a sed that does not truncate output... (cached) 
/media/f_mp3/MiniFS/buildroot-2009.11/output/toolchain/bin/sed
checking for ld used by /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc 
-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld
checking if the linker (/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld) 
is GNU ld... (cached) yes
checking for /media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld option to 
reload object files... (cached) -r
checking for BSD-compatible nm... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-nm
checking whether ln -s works... yes
checking how to recognize dependent libraries... (cached) pass_all
checking for sys/types.h... (cached) yes
checking for sys/stat.h... (cached) yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for memory.h... (cached) yes
checking for strings.h... (cached) yes
checking for inttypes.h... (cached) yes
checking for stdint.h... (cached) yes
checking for unistd.h... (cached) yes
checking for dlfcn.h... (cached) yes
checking how to run the C++ preprocessor... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ -E
checking for i686-linux-g77... (cached) no
checking whether we are using the GNU Fortran 77 compiler... (cached) no
checking whether no accepts -g... (cached) no
checking the maximum length of command line arguments... (cached) 805306365
checking command to parse 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-nm output from 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe -Os 
--sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
object... (cached) ok
checking for objdir... (cached) .libs
checking for i686-linux-ar... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ar
checking for i686-linux-ranlib... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ranlib
checking for i686-linux-strip... (cached) 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/usr/bin/i686-linux-sstrip
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
supports -fno-rtti -fno-exceptions... (cached) no
checking for /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
option to produce PIC... -fPIC
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ PIC 
flag -fPIC works... (cached) yes
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
static flag -static works... (cached) yes
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
supports -c -o file.o... (cached) yes
checking whether the /media/f_mp3/MiniFS/toolchain/bin/i686-linux-gcc 
-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ linker 
(/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld) supports shared 
libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... no
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
configure: creating libtool
appending configuration tag "CXX" to libtool
checking for ld used by /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ 
-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/... (cached) 
/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld
checking if the linker (/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld) 
is GNU ld... (cached) yes
checking whether the /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ 
-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ linker 
(/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld) supports shared 
libraries... yes
checking for /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
option to produce PIC... -fPIC
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ PIC 
flag -fPIC works... (cached) yes
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
static flag -static works... (cached) yes
checking if /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ -Os -pipe 
-Os  --sysroot /media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ 
supports -c -o file.o... (cached) yes
checking whether the /media/f_mp3/MiniFS/toolchain/bin/i686-linux-g++ 
-Os -pipe -Os  --sysroot 
/media/f_mp3/MiniFS/buildroot-2009.11/output/staging/ linker 
(/media/f_mp3/MiniFS/toolchain/bin/i686-linux-ld) supports shared 
libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
(cached) (cached) checking how to hardcode library paths into 
programs... immediate
appending configuration tag "F77" to libtool
checking size of char... (cached) 1
checking size of short... (cached) 2
checking size of long... (cached) 4
checking size of int... (cached) 4
checking size of void *... (cached) 4
checking size of long long... (cached) 8
checking size of __int64... (cached) 0
checking 64-bit integer type... long long
checking 32-bit integer type... int
checking 16-bit integer type... short
checking whether byte ordering is bigendian... (cached) no
checking for an implementation of va_copy()... (cached) yes
checking for an implementation of __va_copy()... (cached) yes
checking whether va_lists can be copied by value... (cached) yes
checking whether to use inline assembler routines for atomic integers... 
i486
checking for library containing gethostbyname... none required
checking for library containing socket... (cached) none required
checking for vsnprintf... (cached) yes
checking for vasprintf... (cached) yes
checking for nanosleep... (cached) yes
checking for usleep... (cached) yes
checking for poll... (cached) yes
checking for setenv... (cached) yes
checking for unsetenv... (cached) yes
checking for socketpair... (cached) yes
checking for getgrouplist... (cached) yes
checking for execinfo.h... (cached) no
checking for posix getpwnam_r... (cached) yes
checking whether socklen_t is defined... yes
checking for sys/uio.h... (cached) yes
checking for writev... (cached) yes
checking for ISO C99 varargs macros in C... yes
checking for GNUC varargs macros... yes
checking for struct cmsgcred... no
checking for getpeerucred... (cached) no
checking for getpeereid... (cached) no
checking abstract socket namespace... (cached) yes
checking for locale.h... (cached) yes
checking for LC_MESSAGES... (cached) yes
checking for libintl.h... (cached) yes
checking for ngettext in libc... (cached) no
checking for bindtextdomain in -lintl... (cached) yes
checking for ngettext in -lintl... (cached) yes
checking for dgettext in -lintl... (cached) yes
checking for bind_textdomain_codeset... yes
checking for msgfmt... (cached) /usr/bin/msgfmt
checking for dcgettext... (cached) yes
checking if msgfmt accepts -c... yes
checking for gmsgfmt... (cached) /usr/bin/msgfmt
checking for xgettext... (cached) /usr/bin/xgettext
./configure: line 26909: ./po/POTFILES.in: No such file or directory
checking for XML_ParserCreate_MM in -lexpat... (cached) no
configure: error: expat library not found, check config.log for failed 
attempts
make: *** 
[/media/f_mp3/MiniFS/buildroot-2009.11/output/build/dbus-glib-0.80/.stamp_configured] 
Fehler 1

I'm using the stable buildroot-2009.11.
The XML_ParserCreate_MM can be found in the staging/usr/lib/libexpat.so.
So does anybody know how to solve this?

THanks
Chrissy
