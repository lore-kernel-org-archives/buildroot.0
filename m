From: cem akpolat <akpolatcem@gmail.com>
Date: Tue, 20 May 2014 09:16:17 +0200
Subject: [Buildroot]  how to assign cpp and c++ in buildroot?
References: <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
Message-ID: <17A54FA5-BFEA-48B8-A324-CD24857B5038@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net


> 
> Dear Thomas,
> 
> The build root version: build root-2014.02
> 
> MAKE OUTPUT:
> =====================================
> 
> [7m>>> expat 2.1.0 Configuring[27m
> (cd /home/cem/buildroot/buildroot-2014.02/output/build/expat-2.1.0/ && rm -rf config.cache && PATH="/home/cem/buildroot/buildroot-2014.02/output/host/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin:/home/cem/buildroot/buildroot-2014.02/output/host/usr/sbin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" AR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar" AS="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as" LD="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld" NM="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm" CC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" GCC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc" CPP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ " CXX="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++" FC="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gfortran" RANLIB="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ranlib" READELF="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-readelf" STRIP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-strip" OBJCOPY="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objcopy" OBJDUMP="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include" CFLAGS_FOR_BUILD="-O2 -I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/cem/buildroot/buildroot-2014.02/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/cem/buildroot/buildroot-2014.02/output/host/lib -L/home/cem/buildroot/buildroot-2014.02/output/host/usr/lib -Wl,-rpath,/home/cem/buildroot/buildroot-2014.02/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-as" DEFAULT_LINKER="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os " LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/pkg-config" STAGING_DIR="/home/cem/buildroot/buildroot-2014.02/output/host/usr/i586-buildroot-linux-uclibc/sysroot" ac_cv_lbl_unaligned_fail=no ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes lt_cv_sys_lib_search_path_spec="" ac_cv_c_bigendian=no  ./configure --target=i586-buildroot-linux-uclibc --host=i586-buildroot-linux-uclibc --build=x86_64-unknown-linux-gnu --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc --program-prefix="" --disable-gtk-doc --disable-doc --disable-docs --disable-documentation --with-xmlto=no --with-fop=no --disable-nls  --enable-ipv6 --enable-static --enable-shared   )
> checking build system type... x86_64-unknown-linux-gnu
> checking host system type... i586-buildroot-linux-uclibc
> checking how to print strings... printf
> checking for i586-buildroot-linux-uclibc-gcc... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc
> checking whether the C compiler works... yes
> checking for C compiler default output file name... a.out
> checking for suffix of executables... 
> checking whether we are cross compiling... yes
> checking for suffix of object files... o
> checking whether we are using the GNU C compiler... yes
> checking whether /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc accepts -g... yes
> checking for /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C89... none needed
> checking for a sed that does not truncate output... /bin/sed
> checking for grep that handles long lines and -e... /bin/grep
> checking for egrep... /bin/grep -E
> checking for fgrep... /bin/grep -F
> checking for ld used by /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld
> checking if the linker (/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld) is GNU ld... yes
> checking for BSD- or MS-compatible name lister (nm)... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm
> checking the name lister (/home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm) interface... BSD nm
> checking whether ln -s works... yes
> checking the maximum length of command line arguments... 3458764513820540925
> checking whether the shell understands some XSI constructs... yes
> checking whether the shell understands "+="... no
> checking how to convert x86_64-unknown-linux-gnu file names to i586-buildroot-linux-uclibc format... func_convert_file_noop
> checking how to convert x86_64-unknown-linux-gnu file names to toolchain format... func_convert_file_noop
> checking for /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ld option to reload object files... -r
> checking for i586-buildroot-linux-uclibc-objdump... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-objdump
> checking how to recognize dependent libraries... pass_all
> checking for i586-buildroot-linux-uclibc-dlltool... dlltool
> checking how to associate runtime and link libraries... printf %s\n
> checking for i586-buildroot-linux-uclibc-ar... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ar
> checking for archiver @FILE support... @
> checking for i586-buildroot-linux-uclibc-strip... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-strip
> checking for i586-buildroot-linux-uclibc-ranlib... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-ranlib
> checking for gawk... gawk
> checking command to parse /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-nm output from /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-gcc object... ok
> checking for sysroot... no
> checking for i586-buildroot-linux-uclibc-mt... no
> checking for mt... mt
> checking if mt is a manifest tool... no
> checking how to run the C preprocessor... /home/cem/buildroot/buildroot-2014.02/output/host/usr/bin/i586-buildroot-linux-uclibc-g++ 
> 
> 
> =====================================
> 	
> 
> 
> CONFIG FILE:
> =====================================
> 
> #
> # Automatically generated file; DO NOT EDIT.
> # Buildroot 2014.02 Configuration
> #
> BR2_HAVE_DOT_CONFIG=y
> BR2_HOSTARCH_NEEDS_IA32_COMPILER=y
> 
> #
> # Target options
> #
> # BR2_arcle is not set
> # BR2_arceb is not set
> # BR2_arm is not set
> # BR2_armeb is not set
> # BR2_aarch64 is not set
> # BR2_avr32 is not set
> # BR2_bfin is not set
> BR2_i386=y
> # BR2_microblazeel is not set
> # BR2_microblazebe is not set
> # BR2_mips is not set
> # BR2_mipsel is not set
> # BR2_mips64 is not set
> # BR2_mips64el is not set
> # BR2_nios2 is not set
> # BR2_powerpc is not set
> # BR2_sh is not set
> # BR2_sh64 is not set
> # BR2_sparc is not set
> # BR2_x86_64 is not set
> # BR2_xtensa is not set
> BR2_ARCH="i586"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="i586"
> BR2_GCC_TARGET_ARCH="i586"
> # BR2_x86_generic is not set
> # BR2_x86_i386 is not set
> # BR2_x86_i486 is not set
> BR2_x86_i586=y
> # BR2_x86_i686 is not set
> # BR2_x86_pentiumpro is not set
> # BR2_x86_pentium_mmx is not set
> # BR2_x86_pentium_m is not set
> # BR2_x86_pentium2 is not set
> # BR2_x86_pentium3 is not set
> # BR2_x86_pentium4 is not set
> # BR2_x86_prescott is not set
> # BR2_x86_nocona is not set
> # BR2_x86_core2 is not set
> # BR2_x86_atom is not set
> # BR2_x86_k6 is not set
> # BR2_x86_k6_2 is not set
> # BR2_x86_athlon is not set
> # BR2_x86_athlon_4 is not set
> # BR2_x86_opteron is not set
> # BR2_x86_opteron_sse3 is not set
> # BR2_x86_barcelona is not set
> # BR2_x86_jaguar is not set
> # BR2_x86_geode is not set
> # BR2_x86_c3 is not set
> # BR2_x86_c32 is not set
> # BR2_x86_winchip_c6 is not set
> # BR2_x86_winchip2 is not set
> 
> #
> # Build options
> #
> 
> #
> # Commands
> #
> BR2_WGET="wget --passive-ftp -nd -t 3"
> BR2_SVN="svn"
> BR2_BZR="bzr"
> BR2_GIT="git"
> BR2_CVS="cvs"
> BR2_LOCALFILES="cp"
> BR2_SCP="scp"
> BR2_SSH="ssh"
> BR2_HG="hg"
> BR2_ZCAT="gzip -d -c"
> BR2_BZCAT="bzcat"
> BR2_XZCAT="xzcat"
> BR2_TAR_OPTIONS=""
> BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
> BR2_DL_DIR="$(TOPDIR)/dl"
> BR2_HOST_DIR="$(BASE_DIR)/host"
> 
> #
> # Mirrors and Download locations
> #
> BR2_PRIMARY_SITE=""
> BR2_BACKUP_SITE="http://sources.buildroot.net"
> BR2_KERNEL_MIRROR="http://www.kernel.org/pub"
> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
> BR2_LUAROCKS_MIRROR="http://luarocks.org/repositories/rocks"
> BR2_JLEVEL=0
> # BR2_CCACHE is not set
> # BR2_DEPRECATED is not set
> # BR2_ENABLE_DEBUG is not set
> BR2_STRIP_strip=y
> # BR2_STRIP_sstrip is not set
> # BR2_STRIP_none is not set
> BR2_STRIP_EXCLUDE_FILES=""
> BR2_STRIP_EXCLUDE_DIRS=""
> # BR2_OPTIMIZE_0 is not set
> # BR2_OPTIMIZE_1 is not set
> # BR2_OPTIMIZE_2 is not set
> # BR2_OPTIMIZE_3 is not set
> BR2_OPTIMIZE_S=y
> 
> #
> # enabling Stack Smashing Protection requires support in the toolchain
> #
> # BR2_PREFER_STATIC_LIB is not set
> BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
> BR2_GLOBAL_PATCH_DIR=""
> 
> #
> # Toolchain
> #
> BR2_TOOLCHAIN_USES_UCLIBC=y
> BR2_TOOLCHAIN_BUILDROOT=y
> # BR2_TOOLCHAIN_EXTERNAL is not set
> 
> #
> # Kernel Header Options
> #
> # BR2_KERNEL_HEADERS_3_0 is not set
> # BR2_KERNEL_HEADERS_3_2 is not set
> # BR2_KERNEL_HEADERS_3_4 is not set
> # BR2_KERNEL_HEADERS_3_10 is not set
> # BR2_KERNEL_HEADERS_3_11 is not set
> # BR2_KERNEL_HEADERS_3_12 is not set
> BR2_KERNEL_HEADERS_3_13=y
> # BR2_KERNEL_HEADERS_VERSION is not set
> # BR2_KERNEL_HEADERS_SNAP is not set
> BR2_DEFAULT_KERNEL_HEADERS="3.13.5"
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> # BR2_TOOLCHAIN_BUILDROOT_EGLIBC is not set
> # BR2_TOOLCHAIN_BUILDROOT_GLIBC is not set
> BR2_TOOLCHAIN_BUILDROOT_LIBC="uclibc"
> 
> #
> # uClibc Options
> #
> # BR2_UCLIBC_VERSION_0_9_32 is not set
> BR2_UCLIBC_VERSION_0_9_33=y
> # BR2_UCLIBC_VERSION_SNAPSHOT is not set
> BR2_UCLIBC_VERSION_STRING="0.9.33.2"
> BR2_UCLIBC_CONFIG="package/uclibc/uClibc-0.9.33.config"
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> # BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> # BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
> # BR2_PTHREADS_NONE is not set
> # BR2_PTHREADS is not set
> # BR2_PTHREADS_OLD is not set
> BR2_PTHREADS_NATIVE=y
> # BR2_PTHREAD_DEBUG is not set
> # BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
> BR2_UCLIBC_INSTALL_UTILS=y
> # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
> BR2_UCLIBC_TARGET_ARCH="i386"
> BR2_UCLIBC_X86_TYPE="586"
> 
> #
> # Binutils Options
> #
> # BR2_BINUTILS_VERSION_2_20_1 is not set
> # BR2_BINUTILS_VERSION_2_21 is not set
> # BR2_BINUTILS_VERSION_2_21_1 is not set
> BR2_BINUTILS_VERSION_2_22=y
> # BR2_BINUTILS_VERSION_2_23_1 is not set
> # BR2_BINUTILS_VERSION_2_23_2 is not set
> # BR2_BINUTILS_VERSION_2_24 is not set
> BR2_BINUTILS_VERSION="2.22"
> BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
> 
> #
> # GCC Options
> #
> BR2_GCC_NEEDS_MPC=y
> # BR2_GCC_VERSION_4_3_X is not set
> # BR2_GCC_VERSION_4_4_X is not set
> # BR2_GCC_VERSION_4_5_X is not set
> # BR2_GCC_VERSION_4_6_X is not set
> BR2_GCC_VERSION_4_7_X=y
> # BR2_GCC_VERSION_4_8_X is not set
> # BR2_GCC_VERSION_SNAP is not set
> BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
> BR2_GCC_VERSION="4.7.3"
> BR2_EXTRA_GCC_CONFIG_OPTIONS=""
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_GCC_ENABLE_TLS=y
> # BR2_GCC_ENABLE_OPENMP is not set
> # BR2_GCC_ENABLE_LIBMUDFLAP is not set
> # BR2_PACKAGE_HOST_GDB is not set
> BR2_LARGEFILE=y
> BR2_INET_IPV6=y
> BR2_USE_WCHAR=y
> BR2_INSTALL_LIBSTDCPP=y
> BR2_TOOLCHAIN_HAS_THREADS=y
> BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
> # BR2_ENABLE_LOCALE_PURGE is not set
> BR2_GENERATE_LOCALE=""
> BR2_NEEDS_GETTEXT=y
> BR2_USE_MMU=y
> BR2_TARGET_OPTIMIZATION="-pipe"
> BR2_TARGET_LDFLAGS=""
> # BR2_ECLIPSE_REGISTER is not set
> 
> #
> # System configuration
> #
> BR2_TARGET_GENERIC_HOSTNAME="buildroot"
> BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
> # BR2_TARGET_GENERIC_PASSWD_DES is not set
> BR2_TARGET_GENERIC_PASSWD_MD5=y
> # BR2_TARGET_GENERIC_PASSWD_SHA256 is not set
> # BR2_TARGET_GENERIC_PASSWD_SHA512 is not set
> BR2_TARGET_GENERIC_PASSWD_METHOD="md5"
> BR2_INIT_BUSYBOX=y
> # BR2_INIT_SYSV is not set
> 
> #
> # systemd needs udev /dev management and a toolchain w/ largefile, wchar, IPv6, threads
> #
> # BR2_INIT_NONE is not set
> # BR2_ROOTFS_DEVICE_CREATION_STATIC is not set
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
> BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt"
> BR2_ROOTFS_SKELETON_DEFAULT=y
> # BR2_ROOTFS_SKELETON_CUSTOM is not set
> BR2_TARGET_GENERIC_ROOT_PASSWD=""
> BR2_TARGET_GENERIC_GETTY=y
> 
> #
> # getty options
> #
> BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
> BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
> BR2_TARGET_GENERIC_GETTY_TERM="vt100"
> BR2_TARGET_GENERIC_GETTY_OPTIONS=""
> BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
> BR2_ROOTFS_OVERLAY=""
> BR2_ROOTFS_POST_BUILD_SCRIPT=""
> BR2_ROOTFS_POST_IMAGE_SCRIPT=""
> 
> #
> # Kernel
> #
> # BR2_LINUX_KERNEL is not set
> 
> #
> # Target packages
> #
> BR2_PACKAGE_BUSYBOX=y
> # BR2_BUSYBOX_VERSION_1_20_X is not set
> # BR2_BUSYBOX_VERSION_1_21_X is not set
> BR2_BUSYBOX_VERSION_1_22_X=y
> # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
> BR2_BUSYBOX_VERSION="1.22.1"
> BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.22.x.config"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> # BR2_PACKAGE_BUSYBOX_WATCHDOG is not set
> 
> #
> # Audio and video applications
> #
> # BR2_PACKAGE_ALSA_UTILS is not set
> # BR2_PACKAGE_AUMIX is not set
> # BR2_PACKAGE_BELLAGIO is not set
> # BR2_PACKAGE_FAAD2 is not set
> # BR2_PACKAGE_FFMPEG is not set
> # BR2_PACKAGE_FLAC is not set
> # BR2_PACKAGE_GSTREAMER is not set
> # BR2_PACKAGE_GSTREAMER1 is not set
> # BR2_PACKAGE_LAME is not set
> # BR2_PACKAGE_LIBVPX is not set
> # BR2_PACKAGE_MADPLAY is not set
> # BR2_PACKAGE_MPD is not set
> # BR2_PACKAGE_MPG123 is not set
> # BR2_PACKAGE_MPLAYER is not set
> # BR2_PACKAGE_MUSEPACK is not set
> # BR2_PACKAGE_OPUS_TOOLS is not set
> # BR2_PACKAGE_PULSEAUDIO is not set
> # BR2_PACKAGE_TSTOOLS is not set
> 
> #
> # vlc needs a uclibc snapshot or (e)glibc toolchain w/ C++, largefile, wchar, threads
> #
> # BR2_PACKAGE_VORBIS_TOOLS is not set
> # BR2_PACKAGE_WAVPACK is not set
> # BR2_PACKAGE_YAVTA is not set
> 
> #
> # Compressors and decompressors
> #
> BR2_PACKAGE_BZIP2=y
> BR2_PACKAGE_GZIP=y
> # BR2_PACKAGE_INFOZIP is not set
> # BR2_PACKAGE_LZOP is not set
> # BR2_PACKAGE_XZ is not set
> 
> #
> # Debugging, profiling and benchmark
> #
> # BR2_PACKAGE_BONNIE is not set
> # BR2_PACKAGE_CACHE_CALIBRATOR is not set
> # BR2_PACKAGE_DHRYSTONE is not set
> # BR2_PACKAGE_DMALLOC is not set
> # BR2_PACKAGE_DROPWATCH is not set
> # BR2_PACKAGE_DSTAT is not set
> # BR2_PACKAGE_DUMA is not set
> # BR2_PACKAGE_FIO is not set
> 
> #
> # gdb/gdbserver needs a toolchain w/ threads, threads debug
> #
> # BR2_PACKAGE_IOZONE is not set
> # BR2_PACKAGE_KEXEC is not set
> 
> #
> # ktap needs a Linux kernel to be built
> #
> # BR2_PACKAGE_LATENCYTOP is not set
> # BR2_PACKAGE_LMBENCH is not set
> # BR2_PACKAGE_LSOF is not set
> 
> #
> # ltp-testsuite needs a toolchain w/ IPv6, RPC, largefile, threads
> #
> # BR2_PACKAGE_LTRACE is not set
> 
> #
> # lttng-modules needs a Linux kernel to be built
> #
> # BR2_PACKAGE_LTTNG_TOOLS is not set
> # BR2_PACKAGE_MEMSTAT is not set
> # BR2_PACKAGE_NETPERF is not set
> # BR2_PACKAGE_OPROFILE is not set
> # BR2_PACKAGE_PAX_UTILS is not set
> 
> #
> # perf needs a toolchain w/ largefile and a Linux kernel to be built
> #
> # BR2_PACKAGE_PV is not set
> # BR2_PACKAGE_RAMSMP is not set
> # BR2_PACKAGE_RAMSPEED is not set
> # BR2_PACKAGE_RT_TESTS is not set
> # BR2_PACKAGE_STRACE is not set
> # BR2_PACKAGE_STRESS is not set
> # BR2_PACKAGE_SYSPROF is not set
> # BR2_PACKAGE_TINYMEMBENCH is not set
> # BR2_PACKAGE_TRACE_CMD is not set
> # BR2_PACKAGE_VALGRIND is not set
> # BR2_PACKAGE_WHETSTONE is not set
> 
> #
> # Development tools
> #
> # BR2_PACKAGE_BINUTILS is not set
> # BR2_PACKAGE_BSDIFF is not set
> # BR2_PACKAGE_BUSTLE is not set
> # BR2_PACKAGE_CVS is not set
> # BR2_PACKAGE_DIFFUTILS is not set
> # BR2_PACKAGE_FINDUTILS is not set
> # BR2_PACKAGE_FLEX is not set
> # BR2_PACKAGE_GAWK is not set
> BR2_PACKAGE_GETTEXT=y
> # BR2_PACKAGE_GETTEXT_TOOLS is not set
> # BR2_PACKAGE_GIT is not set
> # BR2_PACKAGE_GPERF is not set
> # BR2_PACKAGE_GREP is not set
> # BR2_PACKAGE_JQ is not set
> # BR2_PACKAGE_LIBTOOL is not set
> # BR2_PACKAGE_MAKE is not set
> # BR2_PACKAGE_PATCH is not set
> # BR2_PACKAGE_PKGCONF is not set
> # BR2_PACKAGE_SED is not set
> # BR2_PACKAGE_SSTRIP is not set
> # BR2_PACKAGE_SUBVERSION is not set
> # BR2_PACKAGE_TAR is not set
> # BR2_PACKAGE_TREE is not set
> # BR2_PACKAGE_YASM is not set
> 
> #
> # Filesystem and flash utilities
> #
> # BR2_PACKAGE_CIFS_UTILS is not set
> # BR2_PACKAGE_CRAMFS is not set
> # BR2_PACKAGE_CURLFTPFS is not set
> # BR2_PACKAGE_DOSFSTOOLS is not set
> # BR2_PACKAGE_E2FSPROGS is not set
> # BR2_PACKAGE_ECRYPTFS_UTILS is not set
> # BR2_PACKAGE_EXFAT is not set
> # BR2_PACKAGE_EXFAT_UTILS is not set
> # BR2_PACKAGE_F2FS_TOOLS is not set
> # BR2_PACKAGE_FLASHBENCH is not set
> # BR2_PACKAGE_GENEXT2FS is not set
> # BR2_PACKAGE_GENROMFS is not set
> # BR2_PACKAGE_MAKEDEVS is not set
> # BR2_PACKAGE_MMC_UTILS is not set
> # BR2_PACKAGE_MTD is not set
> # BR2_PACKAGE_NFS_UTILS is not set
> # BR2_PACKAGE_NTFS_3G is not set
> # BR2_PACKAGE_SQUASHFS is not set
> # BR2_PACKAGE_SSHFS is not set
> # BR2_PACKAGE_UNIONFS is not set
> # BR2_PACKAGE_XFSPROGS is not set
> 
> #
> # Games
> #
> # BR2_PACKAGE_GNUCHESS is not set
> # BR2_PACKAGE_LBREAKOUT2 is not set
> # BR2_PACKAGE_LTRIS is not set
> # BR2_PACKAGE_PRBOOM is not set
> 
> #
> # Graphic libraries and applications (graphic/text)
> #
> 
> #
> # Graphic applications
> #
> # BR2_PACKAGE_FSWEBCAM is not set
> # BR2_PACKAGE_GNUPLOT is not set
> # BR2_PACKAGE_JHEAD is not set
> # BR2_PACKAGE_RRDTOOL is not set
> 
> #
> # Graphic libraries
> #
> # BR2_PACKAGE_CEGUI06 is not set
> # BR2_PACKAGE_DIRECTFB is not set
> # BR2_PACKAGE_FBDUMP is not set
> # BR2_PACKAGE_FBGRAB is not set
> # BR2_PACKAGE_FBSET is not set
> # BR2_PACKAGE_FB_TEST_APP is not set
> 
> #
> # fbterm needs a toolchain w/ C++, wchar, locale
> #
> # BR2_PACKAGE_FBV is not set
> # BR2_PACKAGE_IMAGEMAGICK is not set
> 
> #
> # linux-fusion needs a Linux kernel to be built
> #
> # BR2_PACKAGE_OCRAD is not set
> # BR2_PACKAGE_PSPLASH is not set
> # BR2_PACKAGE_SDL is not set
> 
> #
> # Other GUIs
> #
> # BR2_PACKAGE_EFL is not set
> # BR2_PACKAGE_QT is not set
> BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
> # BR2_PACKAGE_QT5 is not set
> 
> #
> # weston needs udev and a toolchain w/ threads
> #
> # BR2_PACKAGE_XORG7 is not set
> 
> #
> # X applications
> #
> 
> #
> # midori needs libgtk2 and a toolchain w/ C++, wchar, threads
> #
> 
> #
> # X libraries and helper libraries
> #
> # BR2_PACKAGE_LIBERATION is not set
> # BR2_PACKAGE_XKEYBOARD_CONFIG is not set
> 
> #
> # X window managers
> #
> 
> #
> # Hardware handling
> #
> 
> #
> # Firmware
> #
> # BR2_PACKAGE_B43_FIRMWARE is not set
> # BR2_PACKAGE_LINUX_FIRMWARE is not set
> # BR2_PACKAGE_UX500_FIRMWARE is not set
> # BR2_PACKAGE_ZD1211_FIRMWARE is not set
> # BR2_PACKAGE_ACPID is not set
> # BR2_PACKAGE_AVRDUDE is not set
> # BR2_PACKAGE_CDRKIT is not set
> # BR2_PACKAGE_CRYPTSETUP is not set
> # BR2_PACKAGE_CWIID is not set
> BR2_PACKAGE_DBUS=y
> BR2_DBUS_EXPAT=y
> # BR2_DBUS_LIBXML2 is not set
> BR2_PACKAGE_DBUS_CPP=y
> # BR2_PACKAGE_DBUS_GLIB is not set
> # BR2_PACKAGE_DEVMEM2 is not set
> # BR2_PACKAGE_DMIDECODE is not set
> # BR2_PACKAGE_DMRAID is not set
> # BR2_PACKAGE_DVB_APPS is not set
> # BR2_PACKAGE_DVBSNOOP is not set
> # BR2_PACKAGE_EEPROG is not set
> # BR2_PACKAGE_EVEMU is not set
> # BR2_PACKAGE_EVTEST is not set
> # BR2_PACKAGE_FAN_CTRL is not set
> # BR2_PACKAGE_FCONFIG is not set
> # BR2_PACKAGE_FIS is not set
> # BR2_PACKAGE_FLASHROM is not set
> # BR2_PACKAGE_FMTOOLS is not set
> # BR2_PACKAGE_FXLOAD is not set
> # BR2_PACKAGE_GADGETFS_TEST is not set
> # BR2_PACKAGE_GPM is not set
> # BR2_PACKAGE_GPSD is not set
> # BR2_PACKAGE_GPTFDISK is not set
> # BR2_PACKAGE_GVFS is not set
> # BR2_PACKAGE_HDPARM is not set
> # BR2_PACKAGE_HWDATA is not set
> # BR2_PACKAGE_I2C_TOOLS is not set
> # BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
> # BR2_PACKAGE_INPUT_TOOLS is not set
> # BR2_PACKAGE_INTEL_MICROCODE is not set
> # BR2_PACKAGE_IOSTAT is not set
> # BR2_PACKAGE_IRDA_UTILS is not set
> # BR2_PACKAGE_IUCODE_TOOL is not set
> # BR2_PACKAGE_KBD is not set
> # BR2_PACKAGE_LCDPROC is not set
> # BR2_PACKAGE_LM_SENSORS is not set
> # BR2_PACKAGE_LSHW is not set
> # BR2_PACKAGE_LSUIO is not set
> # BR2_PACKAGE_LVM2 is not set
> # BR2_PACKAGE_MDADM is not set
> # BR2_PACKAGE_MEDIA_CTL is not set
> # BR2_PACKAGE_MEMTESTER is not set
> # BR2_PACKAGE_MINICOM is not set
> # BR2_PACKAGE_NANOCOM is not set
> # BR2_PACKAGE_NEARD is not set
> # BR2_PACKAGE_OFONO is not set
> # BR2_PACKAGE_OLA is not set
> # BR2_PACKAGE_OPEN2300 is not set
> # BR2_PACKAGE_OPENOCD is not set
> # BR2_PACKAGE_OPENPOWERLINK is not set
> # BR2_PACKAGE_PARTED is not set
> # BR2_PACKAGE_PCIUTILS is not set
> # BR2_PACKAGE_PICOCOM is not set
> # BR2_PACKAGE_READ_EDID is not set
> # BR2_PACKAGE_RNG_TOOLS is not set
> # BR2_PACKAGE_SANE_BACKENDS is not set
> # BR2_PACKAGE_SDPARM is not set
> # BR2_PACKAGE_SETSERIAL is not set
> # BR2_PACKAGE_SG3_UTILS is not set
> # BR2_PACKAGE_SMARTMONTOOLS is not set
> # BR2_PACKAGE_SMSTOOLS3 is not set
> # BR2_PACKAGE_SNOWBALL_HDMISERVICE is not set
> # BR2_PACKAGE_SREDIRD is not set
> # BR2_PACKAGE_STATSERIAL is not set
> # BR2_PACKAGE_SYSSTAT is not set
> # BR2_PACKAGE_TI_UIM is not set
> # BR2_PACKAGE_TI_UTILS is not set
> # BR2_PACKAGE_UBOOT_TOOLS is not set
> 
> #
> # udev needs udev /dev management and a toolchain w/ largefile, wchar, dynamic library
> #
> 
> #
> # udisks needs udev /dev management and a toolchain w/ wchar, threads, dynamic library
> #
> BR2_PACKAGE_USB_MODESWITCH=y
> # BR2_PACKAGE_USB_MODESWITCH_DATA is not set
> 
> #
> # usbmount requires udev to be enabled
> #
> BR2_PACKAGE_USBUTILS=y
> # BR2_PACKAGE_USBUTILS_ZLIB is not set
> # BR2_PACKAGE_W_SCAN is not set
> # BR2_PACKAGE_WIPE is not set
> 
> #
> # Interpreter languages and scripting
> #
> # BR2_PACKAGE_ENSCRIPT is not set
> # BR2_PACKAGE_ERLANG is not set
> # BR2_PACKAGE_HASERL is not set
> # BR2_PACKAGE_JAMVM is not set
> # BR2_PACKAGE_JIMTCL is not set
> BR2_PACKAGE_LUA=y
> BR2_PACKAGE_PROVIDES_LUA_INTERPRETER="lua"
> BR2_PACKAGE_LUA_5_1=y
> # BR2_PACKAGE_LUA_5_2 is not set
> BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION="5.1"
> BR2_PACKAGE_LUA_INTERPRETER_EDITING_NONE=y
> # BR2_PACKAGE_LUA_INTERPRETER_READLINE is not set
> # BR2_PACKAGE_LUA_INTERPRETER_LINENOISE is not set
> BR2_PACKAGE_HAS_LUA_INTERPRETER=y
> # BR2_PACKAGE_LUAJIT is not set
> 
> #
> # Lua libraries/modules
> #
> # BR2_PACKAGE_CGILUA is not set
> # BR2_PACKAGE_COPAS is not set
> # BR2_PACKAGE_COXPCALL is not set
> # BR2_PACKAGE_LBASE64 is not set
> 
> #
> # ljsyscall needs LuaJIT
> #
> # BR2_PACKAGE_LUA_CJSON is not set
> # BR2_PACKAGE_LUA_EV is not set
> # BR2_PACKAGE_LUA_MSGPACK_NATIVE is not set
> # BR2_PACKAGE_LUASQL_SQLITE3 is not set
> # BR2_PACKAGE_LUABITOP is not set
> # BR2_PACKAGE_LUACRYPTO is not set
> # BR2_PACKAGE_LUAEXPAT is not set
> # BR2_PACKAGE_LUAEXPATUTILS is not set
> # BR2_PACKAGE_LUAFILESYSTEM is not set
> # BR2_PACKAGE_LUAPOSIX is not set
> # BR2_PACKAGE_LUASEC is not set
> # BR2_PACKAGE_LUASOCKET is not set
> # BR2_PACKAGE_ORBIT is not set
> # BR2_PACKAGE_RINGS is not set
> # BR2_PACKAGE_WSAPI is not set
> # BR2_PACKAGE_XAVANTE is not set
> # BR2_PACKAGE_NODEJS is not set
> # BR2_PACKAGE_PERL is not set
> BR2_PACKAGE_PHP=y
> 
> #
> # Extensions
> #
> # BR2_PACKAGE_PHP_EXT_CALENDAR is not set
> # BR2_PACKAGE_PHP_EXT_FILEINFO is not set
> # BR2_PACKAGE_PHP_EXT_READLINE is not set
> BR2_PACKAGE_PHP_EXT_SESSION=y
> 
> #
> # Compression extensions
> #
> # BR2_PACKAGE_PHP_EXT_BZIP2 is not set
> # BR2_PACKAGE_PHP_EXT_ZIP is not set
> BR2_PACKAGE_PHP_EXT_ZLIB=y
> 
> #
> # Cryptography extensions
> #
> # BR2_PACKAGE_PHP_EXT_HASH is not set
> # BR2_PACKAGE_PHP_EXT_OPENSSL is not set
> 
> #
> # Database extensions
> #
> # BR2_PACKAGE_PHP_EXT_DBA is not set
> # BR2_PACKAGE_PHP_EXT_MYSQL is not set
> # BR2_PACKAGE_PHP_EXT_MYSQLI is not set
> # BR2_PACKAGE_PHP_EXT_PDO is not set
> 
> #
> # Human language and character encoding support
> #
> # BR2_PACKAGE_PHP_EXT_GETTEXT is not set
> # BR2_PACKAGE_PHP_EXT_ICONV is not set
> # BR2_PACKAGE_PHP_EXT_INTL is not set
> 
> #
> # Image processing
> #
> # BR2_PACKAGE_PHP_EXT_EXIF is not set
> 
> #
> # Mathematical extensions
> #
> # BR2_PACKAGE_PHP_EXT_BCMATH is not set
> # BR2_PACKAGE_PHP_EXT_GMP is not set
> 
> #
> # Other basic extensions
> #
> # BR2_PACKAGE_PHP_EXT_JSON is not set
> # BR2_PACKAGE_PHP_EXT_TOKENIZER is not set
> 
> #
> # Other services
> #
> # BR2_PACKAGE_PHP_EXT_CURL is not set
> # BR2_PACKAGE_PHP_EXT_FTP is not set
> # BR2_PACKAGE_PHP_EXT_SNMP is not set
> # BR2_PACKAGE_PHP_EXT_SOCKETS is not set
> 
> #
> # Process Control
> #
> # BR2_PACKAGE_PHP_EXT_PCNTL is not set
> BR2_PACKAGE_PHP_EXT_POSIX=y
> # BR2_PACKAGE_PHP_EXT_SHMOP is not set
> # BR2_PACKAGE_PHP_EXT_SYSVMSG is not set
> # BR2_PACKAGE_PHP_EXT_SYSVSEM is not set
> # BR2_PACKAGE_PHP_EXT_SYSVSHM is not set
> 
> #
> # Variable and Type related
> #
> # BR2_PACKAGE_PHP_EXT_CTYPE is not set
> # BR2_PACKAGE_PHP_EXT_FILTER is not set
> 
> #
> # Web services
> #
> # BR2_PACKAGE_PHP_EXT_SOAP is not set
> # BR2_PACKAGE_PHP_EXT_XMLRPC is not set
> 
> #
> # XML manipulation
> #
> # BR2_PACKAGE_PHP_EXT_DOM is not set
> # BR2_PACKAGE_PHP_EXT_LIBXML2 is not set
> # BR2_PACKAGE_PHP_EXT_SIMPLEXML is not set
> # BR2_PACKAGE_PHP_EXT_WDDX is not set
> # BR2_PACKAGE_PHP_EXT_XML is not set
> # BR2_PACKAGE_PHP_EXT_XMLREADER is not set
> # BR2_PACKAGE_PHP_EXT_XMLWRITER is not set
> # BR2_PACKAGE_PHP_EXT_XSL is not set
> BR2_PACKAGE_PHP_CGI=y
> BR2_PACKAGE_PHP_SAPI_CGI=y
> # BR2_PACKAGE_PHP_SAPI_CLI is not set
> # BR2_PACKAGE_PHP_SAPI_CLI_CGI is not set
> # BR2_PACKAGE_PYTHON is not set
> # BR2_PACKAGE_PYTHON3 is not set
> # BR2_PACKAGE_RUBY is not set
> # BR2_PACKAGE_TCL is not set
> 
> #
> # Libraries
> #
> 
> #
> # Audio/Sound
> #
> # BR2_PACKAGE_ALSA_LIB is not set
> # BR2_PACKAGE_AUDIOFILE is not set
> # BR2_PACKAGE_CELT051 is not set
> # BR2_PACKAGE_FDK_AAC is not set
> # BR2_PACKAGE_LIBAO is not set
> # BR2_PACKAGE_LIBCDAUDIO is not set
> # BR2_PACKAGE_LIBCDIO is not set
> # BR2_PACKAGE_LIBCUE is not set
> # BR2_PACKAGE_LIBCUEFILE is not set
> # BR2_PACKAGE_LIBID3TAG is not set
> # BR2_PACKAGE_LIBLO is not set
> # BR2_PACKAGE_LIBMAD is not set
> # BR2_PACKAGE_LIBMODPLUG is not set
> # BR2_PACKAGE_LIBMPD is not set
> # BR2_PACKAGE_LIBREPLAYGAIN is not set
> # BR2_PACKAGE_LIBSAMPLERATE is not set
> # BR2_PACKAGE_LIBSNDFILE is not set
> # BR2_PACKAGE_LIBVORBIS is not set
> # BR2_PACKAGE_OPUS is not set
> # BR2_PACKAGE_PORTAUDIO is not set
> # BR2_PACKAGE_SPEEX is not set
> # BR2_PACKAGE_TAGLIB is not set
> # BR2_PACKAGE_TREMOR is not set
> # BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING is not set
> 
> #
> # Compression and decompression
> #
> # BR2_PACKAGE_LIBARCHIVE is not set
> BR2_PACKAGE_LZO=y
> # BR2_PACKAGE_SNAPPY is not set
> BR2_PACKAGE_ZLIB=y
> 
> #
> # Crypto
> #
> # BR2_PACKAGE_BEECRYPT is not set
> # BR2_PACKAGE_CA_CERTIFICATES is not set
> 
> #
> # cryptodev needs a Linux kernel to be built
> #
> # BR2_PACKAGE_GNUTLS is not set
> BR2_PACKAGE_LIBASSUAN=y
> BR2_PACKAGE_LIBGCRYPT=y
> BR2_PACKAGE_LIBGPG_ERROR=y
> BR2_PACKAGE_LIBGPGME=y
> # BR2_PACKAGE_LIBMCRYPT is not set
> # BR2_PACKAGE_LIBMHASH is not set
> # BR2_PACKAGE_LIBNSS is not set
> # BR2_PACKAGE_LIBSECRET is not set
> # BR2_PACKAGE_LIBSHA1 is not set
> # BR2_PACKAGE_LIBSSH2 is not set
> # BR2_PACKAGE_NETTLE is not set
> BR2_PACKAGE_OPENSSL=y
> # BR2_PACKAGE_OPENSSL_BIN is not set
> # BR2_PACKAGE_OPENSSL_ENGINES is not set
> # BR2_PACKAGE_POLARSSL is not set
> 
> #
> # Database
> #
> # BR2_PACKAGE_BERKELEYDB is not set
> BR2_PACKAGE_CPPDB=y
> # BR2_PACKAGE_GDBM is not set
> BR2_PACKAGE_MYSQL=y
> # BR2_PACKAGE_REDIS is not set
> # BR2_PACKAGE_SQLCIPHER is not set
> # BR2_PACKAGE_SQLITE is not set
> 
> #
> # Filesystem
> #
> # BR2_PACKAGE_GAMIN is not set
> # BR2_PACKAGE_LIBCONFIG is not set
> # BR2_PACKAGE_LIBCONFUSE is not set
> # BR2_PACKAGE_LIBFUSE is not set
> # BR2_PACKAGE_LIBLOCKFILE is not set
> 
> #
> # libnfs needs a toolchain w/ RPC and LARGEFILE
> #
> # BR2_PACKAGE_LIBSYSFS is not set
> # BR2_PACKAGE_LOCKDEV is not set
> 
> #
> # Graphics
> #
> # BR2_PACKAGE_ATK is not set
> # BR2_PACKAGE_CAIRO is not set
> # BR2_PACKAGE_FONTCONFIG is not set
> # BR2_PACKAGE_FREETYPE is not set
> # BR2_PACKAGE_GD is not set
> # BR2_PACKAGE_GDK_PIXBUF is not set
> # BR2_PACKAGE_HARFBUZZ is not set
> # BR2_PACKAGE_IMLIB2 is not set
> # BR2_PACKAGE_JASPER is not set
> # BR2_PACKAGE_JPEG is not set
> # BR2_PACKAGE_LCMS2 is not set
> # BR2_PACKAGE_LIBART is not set
> # BR2_PACKAGE_LIBDMTX is not set
> # BR2_PACKAGE_LIBEXIF is not set
> # BR2_PACKAGE_LIBGEOTIFF is not set
> # BR2_PACKAGE_LIBPNG is not set
> # BR2_PACKAGE_LIBQRENCODE is not set
> # BR2_PACKAGE_LIBRAW is not set
> # BR2_PACKAGE_LIBRSVG is not set
> # BR2_PACKAGE_LIBSVG is not set
> # BR2_PACKAGE_LIBSVG_CAIRO is not set
> # BR2_PACKAGE_LIBSVGTINY is not set
> # BR2_PACKAGE_LIBUNGIF is not set
> # BR2_PACKAGE_OPENCV is not set
> # BR2_PACKAGE_PANGO is not set
> # BR2_PACKAGE_PIXMAN is not set
> # BR2_PACKAGE_POPPLER is not set
> # BR2_PACKAGE_TIFF is not set
> # BR2_PACKAGE_WAYLAND is not set
> BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS=y
> 
> #
> # webkit needs libgtk2 and a toolchain w/ C++, wchar, threads
> #
> # BR2_PACKAGE_WEBP is not set
> # BR2_PACKAGE_ZXING is not set
> 
> #
> # Hardware handling
> #
> # BR2_PACKAGE_CCID is not set
> # BR2_PACKAGE_DTC is not set
> # BR2_PACKAGE_LCDAPI is not set
> # BR2_PACKAGE_LIBAIO is not set
> 
> #
> # libatasmart requires udev to be enabled
> #
> # BR2_PACKAGE_LIBCEC is not set
> # BR2_PACKAGE_LIBFREEFARE is not set
> # BR2_PACKAGE_LIBFTDI is not set
> # BR2_PACKAGE_LIBHID is not set
> # BR2_PACKAGE_LIBIQRF is not set
> # BR2_PACKAGE_LIBLLCP is not set
> 
> #
> # libmbim needs udev /dev management and a toolchain w/ wchar, threads
> #
> # BR2_PACKAGE_LIBNFC is not set
> # BR2_PACKAGE_LIBQMI is not set
> # BR2_PACKAGE_LIBRAW1394 is not set
> # BR2_PACKAGE_LIBSERIAL is not set
> # BR2_PACKAGE_LIBSOC is not set
> BR2_PACKAGE_LIBUSB=y
> # BR2_PACKAGE_LIBUSB_COMPAT is not set
> # BR2_PACKAGE_LIBV4L is not set
> # BR2_PACKAGE_LIBXKBCOMMON is not set
> # BR2_PACKAGE_MTDEV is not set
> # BR2_PACKAGE_NEARDAL is not set
> # BR2_PACKAGE_PCSC_LITE is not set
> # BR2_PACKAGE_TSLIB is not set
> # BR2_PACKAGE_URG is not set
> 
> #
> # Javascript
> #
> # BR2_PACKAGE_EXPLORERCANVAS is not set
> # BR2_PACKAGE_FLOT is not set
> BR2_PACKAGE_JQUERY=y
> # BR2_PACKAGE_JQUERY_KEYBOARD is not set
> # BR2_PACKAGE_JQUERY_SPARKLINE is not set
> BR2_PACKAGE_JQUERY_UI=y
> BR2_PACKAGE_JQUERY_UI_THEMES=y
> BR2_PACKAGE_JQUERY_UI_THEME_BLACK_TIE=y
> # BR2_PACKAGE_JQUERY_UI_THEME_BLITZER is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_CUPERTINO is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_DARK_HIVE is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_DOT_LUV is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_EGGPLANT is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_EXCITE_BIKE is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_FLICK is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_HOT_SNEAKS is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_HUMANITY is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_LE_FROG is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_MINT_CHOC is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_OVERCAST is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_PEPPER_GRINDER is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_REDMOND is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_SMOOTHNESS is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_SOUTH_STREET is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_START is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_SUNNY is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_SWANKY_PURSE is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_TRONTASTIC is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_UI_DARKNESS is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_UI_LIGHTNESS is not set
> # BR2_PACKAGE_JQUERY_UI_THEME_VADER is not set
> BR2_PACKAGE_JQUERY_UI_THEMES_THEME="black-tie"
> # BR2_PACKAGE_JQUERY_VALIDATION is not set
> # BR2_PACKAGE_JSMIN is not set
> # BR2_PACKAGE_JSON_JAVASCRIPT is not set
> 
> #
> # JSON/XML
> #
> # BR2_PACKAGE_CJSON is not set
> BR2_PACKAGE_EXPAT=y
> # BR2_PACKAGE_EZXML is not set
> BR2_PACKAGE_JANSSON=y
> # BR2_PACKAGE_JSON_C is not set
> BR2_PACKAGE_JSON_GLIB=y
> # BR2_PACKAGE_LIBJSON is not set
> # BR2_PACKAGE_LIBROXML is not set
> BR2_PACKAGE_LIBXML2=y
> # BR2_PACKAGE_LIBXMLPP is not set
> # BR2_PACKAGE_LIBXSLT is not set
> # BR2_PACKAGE_LIBYAML is not set
> # BR2_PACKAGE_MXML is not set
> # BR2_PACKAGE_RAPIDJSON is not set
> # BR2_PACKAGE_TINYXML is not set
> # BR2_PACKAGE_XERCES is not set
> # BR2_PACKAGE_YAJL is not set
> 
> #
> # Multimedia
> #
> # BR2_PACKAGE_LIBASS is not set
> # BR2_PACKAGE_LIBBLURAY is not set
> # BR2_PACKAGE_LIBDVBSI is not set
> # BR2_PACKAGE_LIBDVDNAV is not set
> # BR2_PACKAGE_LIBDVDREAD is not set
> # BR2_PACKAGE_LIBEBML is not set
> # BR2_PACKAGE_LIBMATROSKA is not set
> # BR2_PACKAGE_LIBMMS is not set
> # BR2_PACKAGE_LIBMPEG2 is not set
> # BR2_PACKAGE_LIBOGG is not set
> # BR2_PACKAGE_LIBPLAYER is not set
> # BR2_PACKAGE_LIBTHEORA is not set
> # BR2_PACKAGE_LIVE555 is not set
> # BR2_PACKAGE_MEDIASTREAMER is not set
> 
> #
> # Networking
> #
> # BR2_PACKAGE_C_ARES is not set
> # BR2_PACKAGE_CPPZMQ is not set
> # BR2_PACKAGE_CZMQ is not set
> # BR2_PACKAGE_FILEMQ is not set
> # BR2_PACKAGE_GLIB_NETWORKING is not set
> # BR2_PACKAGE_LIBCGI is not set
> # BR2_PACKAGE_LIBCGICC is not set
> # BR2_PACKAGE_LIBCURL is not set
> # BR2_PACKAGE_LIBDNET is not set
> # BR2_PACKAGE_LIBESMTP is not set
> # BR2_PACKAGE_LIBEXOSIP2 is not set
> # BR2_PACKAGE_LIBFCGI is not set
> # BR2_PACKAGE_LIBGSASL is not set
> # BR2_PACKAGE_LIBIDN is not set
> # BR2_PACKAGE_LIBISCSI is not set
> # BR2_PACKAGE_LIBMBUS is not set
> # BR2_PACKAGE_LIBMICROHTTPD is not set
> BR2_PACKAGE_LIBMNL=y
> # BR2_PACKAGE_LIBMODBUS is not set
> # BR2_PACKAGE_LIBNETFILTER_ACCT is not set
> BR2_PACKAGE_LIBNETFILTER_CONNTRACK=y
> BR2_PACKAGE_LIBNETFILTER_CTHELPER=y
> BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT=y
> # BR2_PACKAGE_LIBNETFILTER_LOG is not set
> BR2_PACKAGE_LIBNETFILTER_QUEUE=y
> BR2_PACKAGE_LIBNFNETLINK=y
> # BR2_PACKAGE_LIBNFTNL is not set
> BR2_PACKAGE_LIBNL=y
> # BR2_PACKAGE_LIBNL_TOOLS is not set
> # BR2_PACKAGE_LIBOAUTH is not set
> # BR2_PACKAGE_LIBOPING is not set
> # BR2_PACKAGE_LIBOSIP2 is not set
> BR2_PACKAGE_LIBPCAP=y
> # BR2_PACKAGE_LIBRSYNC is not set
> # BR2_PACKAGE_LIBSOCKETCAN is not set
> # BR2_PACKAGE_LIBSHAIRPLAY is not set
> # BR2_PACKAGE_LIBSOUP is not set
> BR2_PACKAGE_LIBTIRPC=y
> # BR2_PACKAGE_LIBTORRENT is not set
> # BR2_PACKAGE_LIBUPNP is not set
> # BR2_PACKAGE_LIBVNCSERVER is not set
> # BR2_PACKAGE_LIBWEBSOCKETS is not set
> # BR2_PACKAGE_NEON is not set
> # BR2_PACKAGE_OMNIORB is not set
> # BR2_PACKAGE_OPENPGM is not set
> # BR2_PACKAGE_ORTP is not set
> # BR2_PACKAGE_RTMPDUMP is not set
> # BR2_PACKAGE_SLIRP is not set
> # BR2_PACKAGE_SNMPPP is not set
> # BR2_PACKAGE_THRIFT is not set
> # BR2_PACKAGE_USBREDIR is not set
> # BR2_PACKAGE_WVSTREAMS is not set
> # BR2_PACKAGE_ZEROMQ is not set
> # BR2_PACKAGE_ZMQPP is not set
> # BR2_PACKAGE_ZYRE is not set
> 
> #
> # Other
> #
> # BR2_PACKAGE_APR is not set
> # BR2_PACKAGE_APR_UTIL is not set
> # BR2_PACKAGE_ARGP_STANDALONE is not set
> # BR2_PACKAGE_BOOST is not set
> 
> #
> # cppcms needs an (e)glibc toolchain w/ C++
> #
> # BR2_PACKAGE_EIGEN is not set
> # BR2_PACKAGE_ELFUTILS is not set
> # BR2_PACKAGE_FFTW is not set
> # BR2_PACKAGE_GLIBMM is not set
> # BR2_PACKAGE_GMP is not set
> # BR2_PACKAGE_GSL is not set
> # BR2_PACKAGE_GTEST is not set
> # BR2_PACKAGE_LIBARGTABLE2 is not set
> # BR2_PACKAGE_LIBATOMIC_OPS is not set
> # BR2_PACKAGE_LIBBSD is not set
> # BR2_PACKAGE_LIBCAP is not set
> # BR2_PACKAGE_LIBCAP_NG is not set
> 
> #
> # libcgroup needs an (e)glibc toolchain w/ C++
> #
> # BR2_PACKAGE_LIBDAEMON is not set
> # BR2_PACKAGE_LIBELF is not set
> # BR2_PACKAGE_LIBEV is not set
> # BR2_PACKAGE_LIBEVDEV is not set
> # BR2_PACKAGE_LIBEVENT is not set
> BR2_PACKAGE_LIBFFI=y
> BR2_PACKAGE_LIBGLIB2=y
> # BR2_PACKAGE_LIBICAL is not set
> # BR2_PACKAGE_LIBLOG4C_LOCALTIME is not set
> BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT=y
> # BR2_PACKAGE_LIBNSPR is not set
> # BR2_PACKAGE_LIBPFM4 is not set
> # BR2_PACKAGE_LIBPLIST is not set
> # BR2_PACKAGE_LIBPTHSEM is not set
> # BR2_PACKAGE_LIBSECCOMP is not set
> # BR2_PACKAGE_LIBSIGC is not set
> # BR2_PACKAGE_LIBSIGSEGV is not set
> # BR2_PACKAGE_LIBTASN1 is not set
> # BR2_PACKAGE_LIBTPL is not set
> # BR2_PACKAGE_LIBUNWIND is not set
> # BR2_PACKAGE_LIBURCU is not set
> 
> #
> # linux-pam needs a toolchain w/ wchar, locale
> #
> # BR2_PACKAGE_LOG4CPLUS is not set
> # BR2_PACKAGE_LOG4CXX is not set
> # BR2_PACKAGE_LTTNG_LIBUST is not set
> # BR2_PACKAGE_MPC is not set
> # BR2_PACKAGE_MPFR is not set
> # BR2_PACKAGE_MSGPACK is not set
> # BR2_PACKAGE_MTDEV2TUIO is not set
> # BR2_PACKAGE_ORC is not set
> # BR2_PACKAGE_P11_KIT is not set
> # BR2_PACKAGE_POCO is not set
> # BR2_PACKAGE_PROTOBUF is not set
> # BR2_PACKAGE_PROTOBUF_C is not set
> # BR2_PACKAGE_SCHIFRA is not set
> 
> #
> # tzdata needs an (e)glibc toolchain
> #
> 
> #
> # Security
> #
> # BR2_PACKAGE_LIBSEPOL is not set
> 
> #
> # Text and terminal handling
> #
> # BR2_PACKAGE_ENCHANT is not set
> # BR2_PACKAGE_ICU is not set
> # BR2_PACKAGE_LIBEDIT is not set
> # BR2_PACKAGE_LIBENCA is not set
> # BR2_PACKAGE_LIBFRIBIDI is not set
> BR2_PACKAGE_LIBICONV=y
> # BR2_PACKAGE_LINENOISE is not set
> BR2_PACKAGE_NCURSES=y
> # BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
> # BR2_PACKAGE_NCURSES_TARGET_FORM is not set
> # BR2_PACKAGE_NCURSES_TARGET_MENU is not set
> # BR2_PACKAGE_NCURSES_TARGET_PROGS is not set
> # BR2_PACKAGE_NEWT is not set
> # BR2_PACKAGE_PCRE is not set
> # BR2_PACKAGE_POPT is not set
> BR2_PACKAGE_READLINE=y
> # BR2_PACKAGE_SLANG is not set
> 
> #
> # Miscellaneous
> #
> # BR2_PACKAGE_AESPIPE is not set
> # BR2_PACKAGE_BC is not set
> BR2_PACKAGE_COLLECTD=y
> 
> #
> # match plugins
> #
> # BR2_PACKAGE_COLLECTD_EMPTY_COUNTER is not set
> # BR2_PACKAGE_COLLECTD_HASHED is not set
> # BR2_PACKAGE_COLLECTD_REGEX is not set
> # BR2_PACKAGE_COLLECTD_TIMEDIFF is not set
> # BR2_PACKAGE_COLLECTD_VALUE is not set
> 
> #
> # misc plugins
> #
> # BR2_PACKAGE_COLLECTD_AGGREGATION is not set
> BR2_PACKAGE_COLLECTD_LOGFILE=y
> # BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL is not set
> BR2_PACKAGE_COLLECTD_SYSLOG=y
> # BR2_PACKAGE_THRESHOLD is not set
> 
> #
> # read plugins
> #
> 
> #
> # Select at least one for collectd to be useful
> #
> # BR2_PACKAGE_COLLECTD_APACHE is not set
> # BR2_PACKAGE_COLLECTD_APCUPS is not set
> # BR2_PACKAGE_COLLECTD_BATTERY is not set
> # BR2_PACKAGE_COLLECTD_BIND is not set
> # BR2_PACKAGE_COLLECTD_CGROUPS is not set
> # BR2_PACKAGE_COLLECTD_CONNTRACK is not set
> # BR2_PACKAGE_COLLECTD_CONTEXTSWITCH is not set
> # BR2_PACKAGE_COLLECTD_CPU is not set
> # BR2_PACKAGE_COLLECTD_CPUFREQ is not set
> # BR2_PACKAGE_COLLECTD_CURL is not set
> # BR2_PACKAGE_COLLECTD_CURL_JSON is not set
> # BR2_PACKAGE_COLLECTD_CURL_XML is not set
> # BR2_PACKAGE_COLLECTD_DF is not set
> # BR2_PACKAGE_COLLECTD_DISK is not set
> # BR2_PACKAGE_COLLECTD_DNS is not set
> # BR2_PACKAGE_COLLECTD_ENTROPY is not set
> # BR2_PACKAGE_COLLECTD_ETHSTAT is not set
> # BR2_PACKAGE_COLLECTD_EXEC is not set
> # BR2_PACKAGE_COLLECTD_FILECOUNT is not set
> # BR2_PACKAGE_COLLECTD_FSCACHE is not set
> # BR2_PACKAGE_COLLECTD_INTERFACE is not set
> # BR2_PACKAGE_COLLECTD_IPTABLES is not set
> # BR2_PACKAGE_COLLECTD_IRQ is not set
> # BR2_PACKAGE_COLLECTD_LOAD is not set
> # BR2_PACKAGE_COLLECTD_MD is not set
> # BR2_PACKAGE_COLLECTD_MEMCACHED is not set
> # BR2_PACKAGE_COLLECTD_MEMORY is not set
> # BR2_PACKAGE_COLLECTD_MYSQL is not set
> # BR2_PACKAGE_COLLECTD_NFS is not set
> # BR2_PACKAGE_COLLECTD_NTPD is not set
> # BR2_PACKAGE_COLLECTD_OLSRD is not set
> # BR2_PACKAGE_COLLECTD_OPENVPN is not set
> # BR2_PACKAGE_COLLECTD_PING is not set
> # BR2_PACKAGE_COLLECTD_PROCESSES is not set
> # BR2_PACKAGE_COLLECTD_PROTOCOLS is not set
> # BR2_PACKAGE_COLLECTD_SENSORS is not set
> # BR2_PACKAGE_COLLECTD_SERIAL is not set
> # BR2_PACKAGE_COLLECTD_STATSD is not set
> # BR2_PACKAGE_COLLECTD_SNMP is not set
> # BR2_PACKAGE_COLLECTD_SWAP is not set
> # BR2_PACKAGE_COLLECTD_TABLE is not set
> # BR2_PACKAGE_COLLECTD_TAIL is not set
> # BR2_PACKAGE_COLLECTD_TAIL_CSV is not set
> # BR2_PACKAGE_COLLECTD_TCPCONNS is not set
> # BR2_PACKAGE_COLLECTD_THERMAL is not set
> # BR2_PACKAGE_COLLECTD_UPTIME is not set
> # BR2_PACKAGE_COLLECTD_USERS is not set
> # BR2_PACKAGE_COLLECTD_VMEM is not set
> # BR2_PACKAGE_COLLECTD_WIRELESS is not set
> 
> #
> # target plugins
> #
> # BR2_PACKAGE_COLLECTD_NOTIFICATION is not set
> # BR2_PACKAGE_COLLECTD_REPLACE is not set
> # BR2_PACKAGE_COLLECTD_SCALE is not set
> # BR2_PACKAGE_COLLECTD_SET is not set
> 
> #
> # write plugins
> #
> 
> #
> # Select at least one for collectd to be useful
> #
> # BR2_PACKAGE_COLLECTD_CSV is not set
> # BR2_PACKAGE_COLLECTD_GRAPHITE is not set
> # BR2_PACKAGE_COLLECTD_NETWORK is not set
> # BR2_PACKAGE_COLLECTD_RRDTOOL is not set
> # BR2_PACKAGE_COLLECTD_RIEMANN is not set
> # BR2_PACKAGE_COLLECTD_UNIXSOCK is not set
> # BR2_PACKAGE_COLLECTD_WRITEHTTP is not set
> # BR2_PACKAGE_EMPTY is not set
> # BR2_PACKAGE_GOOGLEFONTDIRECTORY is not set
> # BR2_PACKAGE_HAVEGED is not set
> # BR2_PACKAGE_MCRYPT is not set
> # BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO is not set
> # BR2_PACKAGE_SHARED_MIME_INFO is not set
> # BR2_PACKAGE_SNOWBALL_INIT is not set
> # BR2_PACKAGE_SOUND_THEME_BOREALIS is not set
> # BR2_PACKAGE_SOUND_THEME_FREEDESKTOP is not set
> 
> #
> # Networking applications
> #
> # BR2_PACKAGE_AICCU is not set
> BR2_PACKAGE_AIRCRACK_NG=y
> # BR2_PACKAGE_ARGUS is not set
> BR2_PACKAGE_ARPTABLES=y
> # BR2_PACKAGE_AUTOSSH is not set
> # BR2_PACKAGE_AVAHI is not set
> # BR2_PACKAGE_AXEL is not set
> # BR2_PACKAGE_BCUSDK is not set
> # BR2_PACKAGE_BIND is not set
> BR2_PACKAGE_BLUEZ_UTILS=y
> # BR2_PACKAGE_BLUEZ_UTILS_COMPAT is not set
> # BR2_PACKAGE_BLUEZ_UTILS_AUDIO is not set
> BR2_PACKAGE_BLUEZ_UTILS_USB=y
> # BR2_PACKAGE_BLUEZ_UTILS_GATT is not set
> BR2_PACKAGE_BMON=y
> # BR2_PACKAGE_BOA is not set
> BR2_PACKAGE_BRIDGE_UTILS=y
> # BR2_PACKAGE_BWM_NG is not set
> # BR2_PACKAGE_CAN_UTILS is not set
> # BR2_PACKAGE_CHRONY is not set
> # BR2_PACKAGE_CIVETWEB is not set
> # BR2_PACKAGE_CONNMAN is not set
> BR2_PACKAGE_CONNTRACK_TOOLS=y
> # BR2_PACKAGE_CRDA is not set
> # BR2_PACKAGE_CTORRENT is not set
> # BR2_PACKAGE_CUPS is not set
> BR2_PACKAGE_DHCP=y
> BR2_PACKAGE_DHCP_SERVER=y
> # BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK is not set
> BR2_PACKAGE_DHCP_RELAY=y
> BR2_PACKAGE_DHCP_CLIENT=y
> # BR2_PACKAGE_DHCPCD is not set
> # BR2_PACKAGE_DHCPDUMP is not set
> BR2_PACKAGE_DNSMASQ=y
> BR2_PACKAGE_DNSMASQ_TFTP=y
> BR2_PACKAGE_DNSMASQ_DHCP=y
> # BR2_PACKAGE_DNSMASQ_IDN is not set
> # BR2_PACKAGE_DNSMASQ_LUA is not set
> BR2_PACKAGE_DNSMASQ_CONNTRACK=y
> BR2_PACKAGE_DROPBEAR=y
> # BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS is not set
> BR2_PACKAGE_DROPBEAR_SMALL=y
> # BR2_PACKAGE_DROPBEAR_WTMP is not set
> # BR2_PACKAGE_DROPBEAR_LASTLOG is not set
> BR2_PACKAGE_EBTABLES=y
> # BR2_PACKAGE_ETHTOOL is not set
> # BR2_PACKAGE_FPING is not set
> # BR2_PACKAGE_GESFTPSERVER is not set
> # BR2_PACKAGE_HEIRLOOM_MAILX is not set
> # BR2_PACKAGE_HIAWATHA is not set
> BR2_PACKAGE_HOSTAPD=y
> BR2_PACKAGE_HOSTAPD_EAP=y
> # BR2_PACKAGE_HOSTAPD_WPS is not set
> # BR2_PACKAGE_HTTPING is not set
> # BR2_PACKAGE_IFPLUGD is not set
> BR2_PACKAGE_IFTOP=y
> 
> #
> # igh-ethercat needs a Linux kernel to be built
> #
> # BR2_PACKAGE_IGMPPROXY is not set
> # BR2_PACKAGE_INADYN is not set
> BR2_PACKAGE_IPERF=y
> BR2_PACKAGE_IPROUTE2=y
> # BR2_PACKAGE_IPSEC_TOOLS is not set
> # BR2_PACKAGE_IPSET is not set
> BR2_PACKAGE_IPTABLES=y
> BR2_PACKAGE_IPUTILS=y
> BR2_PACKAGE_IW=y
> # BR2_PACKAGE_KISMET is not set
> # BR2_PACKAGE_KNOCK is not set
> # BR2_PACKAGE_LFTP is not set
> # BR2_PACKAGE_LIGHTTPD is not set
> # BR2_PACKAGE_LINKNX is not set
> # BR2_PACKAGE_LINKS is not set
> # BR2_PACKAGE_LINPHONE is not set
> # BR2_PACKAGE_LRZSZ is not set
> # BR2_PACKAGE_MACCHANGER is not set
> # BR2_PACKAGE_MII_DIAG is not set
> # BR2_PACKAGE_MINIDLNA is not set
> 
> #
> # modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6
> #
> # BR2_PACKAGE_MONGOOSE is not set
> BR2_PACKAGE_MROUTED=y
> # BR2_PACKAGE_MSMTP is not set
> # BR2_PACKAGE_MTR is not set
> # BR2_PACKAGE_MUTT is not set
> # BR2_PACKAGE_NBD is not set
> # BR2_PACKAGE_NCFTP is not set
> # BR2_PACKAGE_NDISC6 is not set
> # BR2_PACKAGE_NETATALK is not set
> # BR2_PACKAGE_NETCAT is not set
> # BR2_PACKAGE_NETPLUG is not set
> BR2_PACKAGE_NETSNMP=y
> BR2_PACKAGE_NETSNMP_ENABLE_MIBS=y
> BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES="host ucd-snmp/dlmod agentx"
> BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES="disman/event disman/schedule utilities"
> # BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING is not set
> BR2_PACKAGE_NETSTAT_NAT=y
> BR2_PACKAGE_NET_TOOLS=y
> 
> #
> # NetworkManager needs udev /dev management and a toolchain w/ IPv6, largefile, wchar, threads
> #
> # BR2_PACKAGE_NFACCT is not set
> # BR2_PACKAGE_NGIRCD is not set
> # BR2_PACKAGE_NGREP is not set
> # BR2_PACKAGE_NMAP is not set
> # BR2_PACKAGE_NOIP is not set
> BR2_PACKAGE_NTP=y
> # BR2_PACKAGE_NTP_SNTP is not set
> # BR2_PACKAGE_NTP_NTP_KEYGEN is not set
> BR2_PACKAGE_NTP_NTPD=y
> # BR2_PACKAGE_NTP_NTPDATE is not set
> # BR2_PACKAGE_NTP_NTPDC is not set
> # BR2_PACKAGE_NTP_NTPQ is not set
> # BR2_PACKAGE_NTP_NTPSNMPD is not set
> # BR2_PACKAGE_NTP_TICKADJ is not set
> # BR2_PACKAGE_NUTTCP is not set
> # BR2_PACKAGE_OLSR is not set
> # BR2_PACKAGE_OPENNTPD is not set
> # BR2_PACKAGE_OPENOBEX is not set
> BR2_PACKAGE_OPENSSH=y
> # BR2_PACKAGE_OPENSWAN is not set
> BR2_PACKAGE_OPENVPN=y
> BR2_PACKAGE_OPENVPN_LZO=y
> # BR2_PACKAGE_OPENVPN_SMALL is not set
> BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL=y
> # BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL is not set
> # BR2_PACKAGE_P910ND is not set
> 
> #
> # portmap needs a toolchain w/ RPC
> #
> BR2_PACKAGE_PPPD=y
> BR2_PACKAGE_PPPD_FILTER=y
> BR2_PACKAGE_PPPD_RADIUS=y
> # BR2_PACKAGE_PPTP_LINUX is not set
> # BR2_PACKAGE_PROFTPD is not set
> # BR2_PACKAGE_PROXYCHAINS_NG is not set
> # BR2_PACKAGE_PTPD is not set
> # BR2_PACKAGE_PTPD2 is not set
> # BR2_PACKAGE_QUAGGA is not set
> # BR2_PACKAGE_RADVD is not set
> # BR2_PACKAGE_RP_PPPOE is not set
> # BR2_PACKAGE_RPCBIND is not set
> # BR2_PACKAGE_RSH_REDONE is not set
> # BR2_PACKAGE_RSYNC is not set
> # BR2_PACKAGE_RTORRENT is not set
> # BR2_PACKAGE_RTPTOOLS is not set
> # BR2_PACKAGE_SAMBA is not set
> # BR2_PACKAGE_SCONESERVER is not set
> # BR2_PACKAGE_SER2NET is not set
> # BR2_PACKAGE_SMCROUTE is not set
> # BR2_PACKAGE_SOCAT is not set
> # BR2_PACKAGE_SOCKETCAND is not set
> # BR2_PACKAGE_SPAWN_FCGI is not set
> 
> #
> # spice server depends on python (for pyparsing)
> #
> # BR2_PACKAGE_SPICE_PROTOCOL is not set
> # BR2_PACKAGE_SQUID is not set
> # BR2_PACKAGE_STRONGSWAN is not set
> # BR2_PACKAGE_STUNNEL is not set
> BR2_PACKAGE_TCPDUMP=y
> # BR2_PACKAGE_TCPDUMP_SMB is not set
> # BR2_PACKAGE_TCPING is not set
> # BR2_PACKAGE_TCPREPLAY is not set
> BR2_PACKAGE_TFTPD=y
> # BR2_PACKAGE_THTTPD is not set
> # BR2_PACKAGE_TINYHTTPD is not set
> # BR2_PACKAGE_TN5250 is not set
> # BR2_PACKAGE_TRANSMISSION is not set
> # BR2_PACKAGE_TVHEADEND is not set
> # BR2_PACKAGE_UDPCAST is not set
> # BR2_PACKAGE_ULOGD is not set
> # BR2_PACKAGE_USHARE is not set
> # BR2_PACKAGE_USSP_PUSH is not set
> # BR2_PACKAGE_VDE2 is not set
> BR2_PACKAGE_VPNC=y
> # BR2_PACKAGE_VSFTPD is not set
> BR2_PACKAGE_VTUN=y
> # BR2_PACKAGE_WGET is not set
> # BR2_PACKAGE_WIRELESS_REGDB is not set
> BR2_PACKAGE_WIRELESS_TOOLS=y
> # BR2_PACKAGE_WIRELESS_TOOLS_LIB is not set
> # BR2_PACKAGE_WIRESHARK is not set
> BR2_PACKAGE_WPA_SUPPLICANT=y
> BR2_PACKAGE_WPA_SUPPLICANT_EAP=y
> # BR2_PACKAGE_WPA_SUPPLICANT_CLI is not set
> BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
> # BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT is not set
> # BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD is not set
> # BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW is not set
> # BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG is not set
> # BR2_PACKAGE_WPA_SUPPLICANT_WPS is not set
> # BR2_PACKAGE_WVDIAL is not set
> # BR2_PACKAGE_XINETD is not set
> # BR2_PACKAGE_XL2TP is not set
> 
> #
> # Package managers
> #
> # BR2_PACKAGE_IPKG is not set
> BR2_PACKAGE_OPKG=y
> BR2_PACKAGE_OPKG_GPG_SIGN=y
> # BR2_PACKAGE_RPM is not set
> 
> #
> # Real-Time
> #
> # BR2_PACKAGE_XENOMAI is not set
> 
> #
> # Shell and utilities
> #
> 
> #
> # Shells
> #
> # BR2_PACKAGE_BASH is not set
> # BR2_PACKAGE_DASH is not set
> # BR2_PACKAGE_ZSH is not set
> 
> #
> # Utilities
> #
> # BR2_PACKAGE_AT is not set
> # BR2_PACKAGE_DIALOG is not set
> # BR2_PACKAGE_DTACH is not set
> # BR2_PACKAGE_FILE is not set
> BR2_PACKAGE_GNUPG=y
> # BR2_PACKAGE_GNUPG_RSA is not set
> # BR2_PACKAGE_GNUPG_GPGV is not set
> # BR2_PACKAGE_GNUPG_GPGSPLIT is not set
> # BR2_PACKAGE_INOTIFY_TOOLS is not set
> # BR2_PACKAGE_LOCKFILE_PROGS is not set
> # BR2_PACKAGE_LOGROTATE is not set
> # BR2_PACKAGE_LOGSURFER is not set
> # BR2_PACKAGE_SCREEN is not set
> # BR2_PACKAGE_SUDO is not set
> # BR2_PACKAGE_TIME is not set
> # BR2_PACKAGE_TMUX is not set
> # BR2_PACKAGE_WHICH is not set
> # BR2_PACKAGE_XMLSTARLET is not set
> 
> #
> # System tools
> #
> # BR2_PACKAGE_ACL is not set
> # BR2_PACKAGE_ATTR is not set
> # BR2_PACKAGE_BOOTUTILS is not set
> # BR2_PACKAGE_COREUTILS is not set
> # BR2_PACKAGE_CPULOAD is not set
> # BR2_PACKAGE_HTOP is not set
> # BR2_PACKAGE_KEYUTILS is not set
> # BR2_PACKAGE_KMOD is not set
> # BR2_PACKAGE_LXC is not set
> # BR2_PACKAGE_MONIT is not set
> # BR2_PACKAGE_NCDU is not set
> # BR2_PACKAGE_NUMACTL is not set
> # BR2_PACKAGE_NUT is not set
> # BR2_PACKAGE_POLKIT is not set
> # BR2_PACKAGE_PROCPS is not set
> # BR2_PACKAGE_PSMISC is not set
> # BR2_PACKAGE_QUOTA is not set
> # BR2_PACKAGE_RSYSLOG is not set
> 
> #
> # supervisor needs the python interpreter
> #
> # BR2_PACKAGE_SYSKLOGD is not set
> 
> #
> # systemd needs udev /dev management and a toolchain w/ IPv6, threads
> #
> # BR2_PACKAGE_UTIL_LINUX is not set
> 
> #
> # Text editors and viewers
> #
> # BR2_PACKAGE_ED is not set
> # BR2_PACKAGE_JOE is not set
> # BR2_PACKAGE_LESS is not set
> # BR2_PACKAGE_NANO is not set
> # BR2_PACKAGE_UEMACS is not set
> # BR2_PACKAGE_VIM is not set
> 
> #
> # Others
> #
> BR2_PACKAGE_INTFD=y
> BR2_PACKAGE_NICMONITOR=y
> 
> #
> # Filesystem images
> #
> # BR2_TARGET_ROOTFS_CLOOP is not set
> BR2_TARGET_ROOTFS_CPIO=y
> BR2_TARGET_ROOTFS_CPIO_NONE=y
> # BR2_TARGET_ROOTFS_CPIO_GZIP is not set
> # BR2_TARGET_ROOTFS_CPIO_BZIP2 is not set
> # BR2_TARGET_ROOTFS_CPIO_LZMA is not set
> # BR2_TARGET_ROOTFS_CPIO_LZO is not set
> # BR2_TARGET_ROOTFS_CPIO_XZ is not set
> # BR2_TARGET_ROOTFS_CPIO_UIMAGE is not set
> # BR2_TARGET_ROOTFS_CRAMFS is not set
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_2=y
> BR2_TARGET_ROOTFS_EXT2_2r0=y
> # BR2_TARGET_ROOTFS_EXT2_2r1 is not set
> # BR2_TARGET_ROOTFS_EXT2_3 is not set
> # BR2_TARGET_ROOTFS_EXT2_4 is not set
> BR2_TARGET_ROOTFS_EXT2_GEN=2
> BR2_TARGET_ROOTFS_EXT2_REV=0
> BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
> BR2_TARGET_ROOTFS_EXT2_INODES=0
> BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
> BR2_TARGET_ROOTFS_EXT2_NONE=y
> # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
> # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
> # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
> # BR2_TARGET_ROOTFS_EXT2_LZO is not set
> # BR2_TARGET_ROOTFS_EXT2_XZ is not set
> 
> #
> # initramfs needs a Linux kernel to be built
> #
> 
> #
> # iso image needs a Linux kernel to be built
> #
> # BR2_TARGET_ROOTFS_JFFS2 is not set
> # BR2_TARGET_ROOTFS_ROMFS is not set
> # BR2_TARGET_ROOTFS_SQUASHFS is not set
> BR2_TARGET_ROOTFS_TAR=y
> BR2_TARGET_ROOTFS_TAR_NONE=y
> # BR2_TARGET_ROOTFS_TAR_GZIP is not set
> # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
> # BR2_TARGET_ROOTFS_TAR_LZMA is not set
> # BR2_TARGET_ROOTFS_TAR_LZO is not set
> # BR2_TARGET_ROOTFS_TAR_XZ is not set
> BR2_TARGET_ROOTFS_TAR_OPTIONS=""
> # BR2_TARGET_ROOTFS_UBIFS is not set
> 
> #
> # Bootloaders
> #
> # BR2_TARGET_BAREBOX is not set
> BR2_TARGET_GRUB=y
> # BR2_TARGET_GRUB_SPLASH is not set
> # BR2_TARGET_GRUB_DISKLESS is not set
> 
> #
> # filesystem drivers
> #
> BR2_TARGET_GRUB_FS_EXT2=y
> BR2_TARGET_GRUB_FS_FAT=y
> # BR2_TARGET_GRUB_FS_ISO9660 is not set
> # BR2_TARGET_GRUB_FS_JFS is not set
> # BR2_TARGET_GRUB_FS_REISERFS is not set
> # BR2_TARGET_GRUB_FS_XFS is not set
> 
> #
> # network drivers
> #
> # BR2_TARGET_GRUB_3c595 is not set
> # BR2_TARGET_GRUB_3c90x is not set
> # BR2_TARGET_GRUB_davicom is not set
> # BR2_TARGET_GRUB_e1000 is not set
> # BR2_TARGET_GRUB_eepro100 is not set
> # BR2_TARGET_GRUB_epic100 is not set
> # BR2_TARGET_GRUB_forcedeth is not set
> # BR2_TARGET_GRUB_natsemi is not set
> # BR2_TARGET_GRUB_ns83820 is not set
> # BR2_TARGET_GRUB_ns8390 is not set
> # BR2_TARGET_GRUB_pcnet32 is not set
> # BR2_TARGET_GRUB_pnic is not set
> # BR2_TARGET_GRUB_rtl8139 is not set
> # BR2_TARGET_GRUB_r8169 is not set
> # BR2_TARGET_GRUB_sis900 is not set
> # BR2_TARGET_GRUB_tg3 is not set
> # BR2_TARGET_GRUB_tulip is not set
> # BR2_TARGET_GRUB_tlan is not set
> # BR2_TARGET_GRUB_undi is not set
> # BR2_TARGET_GRUB_via_rhine is not set
> # BR2_TARGET_GRUB_w89c840 is not set
> # BR2_TARGET_SYSLINUX is not set
> # BR2_TARGET_UBOOT is not set
> 
> #
> # Host utilities
> #
> # BR2_PACKAGE_HOST_DFU_UTIL is not set
> # BR2_PACKAGE_HOST_DOSFSTOOLS is not set
> BR2_PACKAGE_HOST_E2FSPROGS=y
> BR2_PACKAGE_HOST_GENEXT2FS=y
> # BR2_PACKAGE_HOST_GENIMAGE is not set
> # BR2_PACKAGE_HOST_GENPART is not set
> # BR2_PACKAGE_HOST_LPC3250LOADER is not set
> # BR2_PACKAGE_HOST_MTD is not set
> # BR2_PACKAGE_HOST_MTOOLS is not set
> # BR2_PACKAGE_HOST_OPENOCD is not set
> # BR2_PACKAGE_HOST_PARTED is not set
> # BR2_PACKAGE_HOST_SAM_BA is not set
> # BR2_PACKAGE_HOST_SQUASHFS is not set
> # BR2_PACKAGE_HOST_UBOOT_TOOLS is not set
> # BR2_PACKAGE_HOST_UTIL_LINUX is not set
> 
> #
> # Legacy config options
> #
> 
> #
> # Legacy options removed in 2014.02
> #
> # BR2_sh2 is not set
> # BR2_sh3 is not set
> # BR2_sh3eb is not set
> # BR2_KERNEL_HEADERS_3_1 is not set
> # BR2_KERNEL_HEADERS_3_3 is not set
> # BR2_KERNEL_HEADERS_3_5 is not set
> # BR2_GDB_VERSION_7_2 is not set
> # BR2_GDB_VERSION_7_3 is not set
> # BR2_PACKAGE_CCACHE is not set
> # BR2_HAVE_DOCUMENTATION is not set
> # BR2_PACKAGE_AUTOMAKE is not set
> # BR2_PACKAGE_AUTOCONF is not set
> # BR2_PACKAGE_XSTROKE is not set
> # BR2_PACKAGE_LZMA is not set
> # BR2_PACKAGE_TTCP is not set
> # BR2_PACKAGE_LIBNFC_LLCP is not set
> # BR2_PACKAGE_MYSQL_CLIENT is not set
> # BR2_PACKAGE_SQUASHFS3 is not set
> # BR2_TARGET_ROOTFS_SQUASHFS3 is not set
> # BR2_PACKAGE_NETKITBASE is not set
> # BR2_PACKAGE_NETKITTELNET is not set
> # BR2_PACKAGE_LUASQL is not set
> # BR2_PACKAGE_LUACJSON is not set
> 
> #
> # Legacy options removed in 2013.11
> #
> # BR2_PACKAGE_LVM2_DMSETUP_ONLY is not set
> # BR2_PACKAGE_QT_JAVASCRIPTCORE is not set
> # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
> BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL=""
> BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION=""
> BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL=""
> BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION=""
> 
> #
> # Legacy options removed in 2013.08
> #
> # BR2_ARM_OABI is not set
> # BR2_PACKAGE_DOSFSTOOLS_DOSFSCK is not set
> # BR2_PACKAGE_DOSFSTOOLS_DOSFSLABEL is not set
> # BR2_PACKAGE_DOSFSTOOLS_MKDOSFS is not set
> # BR2_ELF2FLT is not set
> # BR2_VFP_FLOAT is not set
> # BR2_PACKAGE_GCC_TARGET is not set
> # BR2_HAVE_DEVFILES is not set
> 
> #
> # Legacy options removed in 2013.05
> #
> # BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192 is not set
> # BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712 is not set
> 
> #
> # Legacy options removed in 2013.02
> #
> # BR2_sa110 is not set
> # BR2_sa1100 is not set
> # BR2_PACKAGE_GDISK is not set
> # BR2_PACKAGE_GDISK_GDISK is not set
> # BR2_PACKAGE_GDISK_SGDISK is not set
> # BR2_PACKAGE_GDB_HOST is not set
> # BR2_PACKAGE_DIRECTB_DITHER_RGB16 is not set
> # BR2_PACKAGE_DIRECTB_TESTS is not set
> 
> #
> # Legacy options removed in 2012.11
> #
> # BR2_PACKAGE_CUSTOMIZE is not set
> # BR2_PACKAGE_XSERVER_xorg is not set
> # BR2_PACKAGE_XSERVER_tinyx is not set
> 
> #
> # Legacy options removed in 2012.08
> #
> # BR2_PACKAGE_GETTEXT_STATIC is not set
> # BR2_PACKAGE_LIBINTL is not set
> # BR2_PACKAGE_INPUT_TOOLS_EVTEST is not set
> # BR2_BFIN_FDPIC is not set
> # BR2_BFIN_FLAT is not set
> 
> 
> =====================================
> 
> 
> Thanks
> Cem
> 
>> Dear cem akpolat,
>> 
>> On Mon, 19 May 2014 23:48:21 +0200, cem akpolat wrote:
>> 
>>>> Since many days I have been trying to compile build root, however,  I encounter nearly each time the sanity check failure due to the misinterpretation of cpp. cpp is pretended as c++, however this is of course not true. When I compile through make command, I see also in the make parameters that cpp 
>>>> refers to g++ under /host/usr/bin/?. There is clearly something wrong. I wanted to compile only the related packet, bridge-utils, under output/built/bridge-utils by providing the accurate CPP path, there is no problem while configuring and compiling the file. Briefly, how can I say the accurate path of CPP to build root such as make CPP=/path/to/file.
>>>> 
>>>> One remark, the name of the packet isn?t significant here, since I saw a lot of different packets which gave the same ?sanity check? error.
>> 
>> Could you post: the Buildroot version you're using, the
>> Buildroot .config file you're using, and the last ~200 lines of the
>> build output showing the error you're seeing?
>> 
>> Thanks,
>> 
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
> 
