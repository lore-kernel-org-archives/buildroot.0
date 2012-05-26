From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 May 2012 03:21:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5252] New: udev 182 build failed 2012.05
Message-ID: <bug-5252-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5252

           Summary: udev 182 build failed 2012.05
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rdghx at 163.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> udev 182 Configuring
(cd /usr/work/buildroot/buildroot-2012.0524/output/build/udev-182/ && rm -rf
config.cache &&
PATH="/usr/work/buildroot/buildroot-2012.0524/output/host/bin:/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin:/usr/work/buildroot/buildroot-2012.0524/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/FriendlyARM/toolschain/4.5.1/bin"
AR="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ar"
AS="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-as"
LD="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld"
NM="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-nm"
CC="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc"
GCC="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc"
CPP="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-cpp"
CXX="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-g++"
FC="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gfortran"
RANLIB="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ranlib"
STRIP="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-strip"
OBJCOPY="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-objcopy"
OBJDUMP="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/bin/gcc"
GCC_FOR_BUILD="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/bin/gcc"
CXX_FOR_BUILD="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld"
CFLAGS_FOR_BUILD="-O2
-I/usr/work/buildroot/buildroot-2012.0524/output/host/include
-I/usr/work/buildroot/buildroot-2012.0524/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-I/usr/work/buildroot/buildroot-2012.0524/output/host/include
-I/usr/work/buildroot/buildroot-2012.0524/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/usr/work/buildroot/buildroot-2012.0524/output/host/lib
-L/usr/work/buildroot/buildroot-2012.0524/output/host/usr/lib
-Wl,-rpath,/usr/work/buildroot/buildroot-2012.0524/output/host/usr/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-as"
DEFAULT_LINKER="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld"
CFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64" CXXFLAGS=" -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS=""
PKG_CONFIG="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/pkg-config"
PERLLIB="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/lib/perl"
STAGING_DIR="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/arm-unknown-linux-gnueabi/sysroot"
ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes
ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes
gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no LIBS=-lrt ./configure
--target=arm-linux --host=arm-linux --build=i686-pc-linux-gnu --prefix=/usr
--exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc  
--enable-ipv6 --enable-static --enable-shared  --sbindir=/sbin
--with-rootlibdir=/lib --libexecdir=/lib
--with-usb-ids-path=/usr/share/hwdata/usb.ids
--with-pci-ids-path=/usr/share/hwdata/pci.ids
--with-firmware-path=/lib/firmware --disable-introspection
--enable-rule_generator --disable-gudev )
configure: WARNING: unrecognized options: --enable-ipv6
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for arm-linux-strip...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... no
checking for mawk... mawk
checking whether make sets $(MAKE)... yes
checking whether make supports nested variables... yes
checking how to create a pax tar archive... gnutar
checking for style of include used by make... GNU
checking for arm-linux-gcc...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
checking whether the C compiler works... yes
checking for C compiler default output file name... a.out
checking for suffix of executables... 
checking whether we are cross compiling... yes
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
accepts -g... yes
checking for /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
option to accept ISO C89... none needed
checking dependency style of
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc...
gcc3
checking how to run the C preprocessor...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-cpp
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
checking minix/config.h usability... no
checking minix/config.h presence... no
checking for minix/config.h... no
checking whether it is safe to define __EXTENSIONS__... yes
checking for special C compiler options needed for large files... no
checking for _FILE_OFFSET_BITS value needed for large files... no
checking whether make supports nested variables... (cached) yes
checking build system type... i686-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking how to print strings... printf
checking for a sed that does not truncate output... /bin/sed
checking for fgrep... /bin/grep -F
checking for ld used by
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld
checking if the linker
(/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld) is
GNU ld... yes
checking for BSD- or MS-compatible name lister (nm)...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-nm
checking the name lister
(/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-nm)
interface... BSD nm
checking whether ln -s works... yes
checking the maximum length of command line arguments... 805306365
checking whether the shell understands some XSI constructs... yes
checking whether the shell understands "+="... no
checking how to convert i686-pc-linux-gnu file names to arm-unknown-linux-gnu
format... func_convert_file_noop
checking how to convert i686-pc-linux-gnu file names to toolchain format...
func_convert_file_noop
checking for
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld option
to reload object files... -r
checking for arm-linux-objdump...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-objdump
checking how to recognize dependent libraries... pass_all
checking for arm-linux-dlltool... no
checking for dlltool... no
checking how to associate runtime and link libraries... printf %s\n
checking for arm-linux-ar...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ar
checking for archiver @FILE support... @
checking for arm-linux-strip... (cached)
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-strip
checking for arm-linux-ranlib...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ranlib
checking command to parse
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-nm output
from /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
object... ok
checking for sysroot... no
checking for arm-linux-mt... no
checking for mt... mt
configure: WARNING: using cross tools not prefixed with host triplet
checking if mt is a manifest tool... no
checking for dlfcn.h... yes
checking for objdir... .libs
checking if /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
supports -fno-rtti -fno-exceptions... no
checking for /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
option to produce PIC... -fPIC -DPIC
checking if /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc PIC
flag -fPIC -DPIC works... yes
checking if /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
static flag -static works... yes
checking if /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
supports -c -o file.o... yes
checking if /usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
supports -c -o file.o... (cached) yes
checking whether the
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
linker
(/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-ld)
supports shared libraries... yes
checking whether -lc should be explicitly linked in... no
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking whether stripping libraries is possible... yes
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
checking for gawk... (cached) mawk
checking for a sed that does not truncate output... (cached) /bin/sed
checking pkg-config is at least version 0.9.0... yes
checking for gtkdoc-check... no
checking for gtkdoc-rebase... no
checking for gtkdoc-mkpdf... no
checking whether to build gtk-doc documentation... no
checking for xsltproc...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/xsltproc
checking for library containing clock_gettime... none required
checking for BLKID... yes
checking for KMOD... yes
checking for USB database location... /usr/share/hwdata/usb.ids
checking for PCI database location... /usr/share/hwdata/pci.ids
checking for gperf...
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/gperf
checking linux/input.h usability... yes
checking linux/input.h presence... yes
checking for linux/input.h... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/docs/Makefile
config.status: creating src/docs/version.xml
config.status: creating src/gudev/docs/Makefile
config.status: creating src/gudev/docs/version.xml
config.status: creating config.h
config.status: executing depfiles commands
config.status: executing libtool commands
configure: WARNING: unrecognized options: --enable-ipv6

        udev 182
        ========

        prefix:                  /usr
        rootprefix:              /usr
        sysconfdir:              /etc
        bindir:                  ${exec_prefix}/bin
        libdir:                  ${exec_prefix}/lib
        rootlibdir:              /lib
        libexecdir:              /lib
        datarootdir:             ${prefix}/share
        mandir:                  ${datarootdir}/man
        includedir:              ${prefix}/include
        include_prefix:         
/opt/FriendlyARM/toolschain/4.5.1/lib/gcc/arm-none-linux-gnueabi/4.5.1/../../../../arm-none-linux-gnueabi/include
        systemdsystemunitdir:    
        firmware path:           \"/lib/firmware/\"
        usb.ids:                 /usr/share/hwdata/usb.ids
        pci.ids:                 /usr/share/hwdata/pci.ids

        compiler:               
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/ccache
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/arm-linux-gcc
        cflags:                   -pipe -Os  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
        ldflags:                 
        xsltproc:               
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/xsltproc
        gperf:                  
/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin/gperf

        logging:                 yes
        debug:                   no
        selinux:                 no

        man pages                yes
        gudev:                   no
        gintrospection:          no
        keymap:                  yes
        mtd_probe:               yes
        rule_generator:          yes
        floppy:                  no

>>> udev 182 Building
PATH="/usr/work/buildroot/buildroot-2012.0524/output/host/bin:/usr/work/buildroot/buildroot-2012.0524/output/host/usr/bin:/usr/work/buildroot/buildroot-2012.0524/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/FriendlyARM/toolschain/4.5.1/bin"
PERLLIB="/usr/work/buildroot/buildroot-2012.0524/output/host/usr/lib/perl" 
/usr/bin/make -j2  -C
/usr/work/buildroot/buildroot-2012.0524/output/build/udev-182/
make[1]: Entering directory
`/usr/work/buildroot/buildroot-2012.0524/output/build/udev-182'
  GEN    src/keymap/keys.txt
  GEN    src/keymap/keys-from-name.gperf
  GEN    src/keymap/keys-to-name.h
  GEN    src/keymap/keys-from-name.h
/usr/bin/make --no-print-directory all-recursive
Making all in .
  GEN    src/keymap/keyboard-force-release.sh
  GEN    src/libudev.pc
  GEN    src/keymap/keyboard-force-release.sh
  GEN    src/udev.pc
  CC     src/libudev.lo
  CC     src/libudev-list.lo
  CC     src/libudev-util.lo
  CC     src/libudev-device.lo
  CC     src/libudev-enumerate.lo
  CC     src/libudev-monitor.lo
src/libudev-monitor.c: In function 'udev_monitor_receive_device':
src/libudev-monitor.c:654:44: warning: comparison between signed and unsigned
integer expressions
  CC     src/libudev-queue.lo
  CC     src/libudev-util-private.lo
  CC     src/libudev-device-private.lo
  CC     src/libudev-queue-private.lo
  CC     src/udevadm-udev-event.o
  CC     src/udevadm-udev-watch.o
  CC     src/udevadm-udev-node.o
  CC     src/udevadm-udev-rules.o
  CC     src/udevadm-udev-ctrl.o
  CC     src/udevadm-udev-builtin.o
  CC     src/udevadm-udev-builtin-blkid.o
  CC     src/udevadm-udev-builtin-firmware.o
  CC     src/udevadm-udev-builtin-hwdb.o
src/udev-builtin-blkid.c:84:42: error: expected ')' before 'pr'
src/udev-builtin-blkid.c: In function 'builtin_blkid':
src/udev-builtin-blkid.c:122:9: error: 'blkid_probe' undeclared (first use in
this function)
src/udev-builtin-blkid.c:122:9: note: each undeclared identifier is reported
only once for each function it appears in
src/udev-builtin-blkid.c:122:21: error: expected ';' before 'pr'
src/udev-builtin-blkid.c:153:9: error: 'pr' undeclared (first use in this
function)
src/udev-builtin-blkid.c:160:17: error: 'BLKID_SUBLKS_LABEL' undeclared (first
use in this function)
src/udev-builtin-blkid.c:160:38: error: 'BLKID_SUBLKS_UUID' undeclared (first
use in this function)
src/udev-builtin-blkid.c:161:17: error: 'BLKID_SUBLKS_TYPE' undeclared (first
use in this function)
src/udev-builtin-blkid.c:161:37: error: 'BLKID_SUBLKS_SECTYPE' undeclared
(first use in this function)
src/udev-builtin-blkid.c:162:17: error: 'BLKID_SUBLKS_USAGE' undeclared (first
use in this function)
src/udev-builtin-blkid.c:162:38: error: 'BLKID_SUBLKS_VERSION' undeclared
(first use in this function)
src/udev-builtin-blkid.c:165:58: error: 'BLKID_FLTR_NOTIN' undeclared (first
use in this function)
src/udev-builtin-blkid.c:165:76: error: 'BLKID_USAGE_RAID' undeclared (first
use in this function)
make[3]: *** [src/udevadm-udev-builtin-blkid.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/usr/work/buildroot/buildroot-2012.0524/output/build/udev-182'
make: ***
[/usr/work/buildroot/buildroot-2012.0524/output/build/udev-182/.stamp_built]
Error 2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
