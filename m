From: Sky Ryan <ryan.flyer@gmail.com>
Date: Wed, 23 May 2007 13:44:55 +0800
Subject: [Buildroot] buildroot on ARMnommu
Message-ID: <eb2399170705222244pf3eaf26p858f986dfeab5c3d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all
Have anyone test the buildroot on ARM7 nommu platform?

I using buildroot to compile the app on my S3C4510B board.
My kernel is linux-2.6.14.

I can compile my app successfully. But when run  it , the system hang
always.

Does buildroot support arm7tdmi cpu in current release?  How to enable it.

My config is as follows

#
# Automatically generated make config: don't edit
#
BR2_HAVE_DOT_CONFIG=y
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
BR2_generic_arm=y
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="GENERIC_ARM"
BR2_ARM_OABI=y
# BR2_ARM_EABI is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
# BR2_x86_i586 is not set
# BR2_x86_i686 is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_ATMEL_MIRROR="
ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/
"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Toolchain Options
#

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_4_25 is not set
# BR2_KERNEL_HEADERS_2_4_27 is not set
# BR2_KERNEL_HEADERS_2_4_29 is not set
# BR2_KERNEL_HEADERS_2_4_31 is not set
# BR2_KERNEL_HEADERS_2_6_9 is not set
# BR2_KERNEL_HEADERS_2_6_11 is not set
# BR2_KERNEL_HEADERS_2_6_12 is not set
# BR2_KERNEL_HEADERS_2_6_19_2 is not set
BR2_KERNEL_HEADERS_2_6_20=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28 is not set
BR2_UCLIBC_VERSION_0_9_28_3=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
# BR2_ENABLE_LOCALE is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PTHREAD_DEBUG is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
# BR2_BINUTILS_VERSION_2_15 is not set
# BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
BR2_BINUTILS_VERSION_2_16_1=y
# BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
# BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
BR2_BINUTILS_VERSION="2.16.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# Gcc Options
#
# BR2_GCC_VERSION_3_3_5 is not set
# BR2_GCC_VERSION_3_3_6 is not set
# BR2_GCC_VERSION_3_4_2 is not set
# BR2_GCC_VERSION_3_4_3 is not set
# BR2_GCC_VERSION_3_4_4 is not set
# BR2_GCC_VERSION_3_4_5 is not set
BR2_GCC_VERSION_3_4_6=y
# BR2_GCC_VERSION_4_0_0 is not set
# BR2_GCC_VERSION_4_0_1 is not set
# BR2_GCC_VERSION_4_0_2 is not set
# BR2_GCC_VERSION_4_0_3 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_0 is not set
# BR2_GCC_VERSION_4_1_1 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2 is not set
# BR2_GCC_IS_SNAP is not set
BR2_GCC_VERSION="3.4.6"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
# BR2_GCC_SHARED_LIBGCC is not set

#
# Ccache Options
#
# BR2_CCACHE is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# elf2flt
#
BR2_ELF2FLT=y
# BR2_MKLIBS is not set

#
# Common Toolchain Options
#
# BR2_PACKAGE_SSTRIP_TARGET is not set
BR2_PACKAGE_SSTRIP_HOST=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not set

#
# Package Selection for the target
#

#
# The default minimal system
#
# BR2_PACKAGE_BUSYBOX is not set
# BR2_BUSYBOX_VERSION_1_0_1 is not set
# BR2_BUSYBOX_VERSION_1_1_3 is not set
# BR2_BUSYBOX_VERSION_1_2_2_1 is not set
# BR2_BUSYBOX_VERSION_1_4_0 is not set
# BR2_BUSYBOX_VERSION_1_4_1 is not set
# BR2_BUSYBOX_VERSION_1_4_2 is not set
# BR2_BUSYBOX_VERSION_1_5_0 is not set
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set
# BR2_PACKAGE_GCC_TARGET is not set
BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set
# BR2_PACKAGE_TAR is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_HOST_FAKEROOT is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_MPATROL is not set
# BR2_PACKAGE_PKGCONFIG is not set
# BR2_READLINE is not set
# BR2_PACKAGE_XERCES is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTT is not set
# BR2_PACKAGE_MICROCOM is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_MODUTILS is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_PORTAGE is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SQLITE is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_TINYLOGIN is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_WHICH is not set
# BR2_NETWORK_SUPPORT is not set
# BR2_BLOCKDEV_SUPPORT is not set
# BR2_AUDIO_SUPPORT is not set
# BR2_GRAPHIC_SUPPORT is not set
# BR2_COMPRESSOR_SUPPORT is not set
# BR2_SCRIPTING_SUPPORT is not set

#
# Target Options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_EXT2_NONE is not set
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set

#
# bootloader for target device
#

#
# Board Support Options
#
# BR2_PACKAGE_LINUX is not set

#
# Arm based Device Support
#
# BR2_TARGET_ARM_INTEGRATOR_926 is not set

#
# Atmel Target
#

#
# Add Atmel Target here
#

#
# Sharp Specific Device Support
#
# BR2_TARGET_SHARP_LNODE80 is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set





My uClibc config is as follows

#
# Automatically generated make config: don't edit
#
# TARGET_alpha is not set
TARGET_arm=y
# TARGET_bfin is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_i386 is not set
# TARGET_i960 is not set
# TARGET_m68k is not set
# TARGET_microblaze is not set
# TARGET_mips is not set
# TARGET_nios is not set
# TARGET_nios2 is not set
# TARGET_powerpc is not set
# TARGET_sh is not set
# TARGET_sh64 is not set
# TARGET_sparc is not set
# TARGET_v850 is not set
# TARGET_x86_64 is not set

#
# Target Architecture Features and Options
#
HAVE_ELF=y
ARCH_SUPPORTS_LITTLE_ENDIAN=y
TARGET_ARCH="arm"
ARCH_SUPPORTS_BIG_ENDIAN=y
CONFIG_GENERIC_ARM=y
# CONFIG_ARM610 is not set
# CONFIG_ARM710 is not set
# CONFIG_ARM720T is not set
# CONFIG_ARM920T is not set
# CONFIG_ARM922T is not set
# CONFIG_ARM926T is not set
# CONFIG_ARM1136JF_S is not set
# CONFIG_ARM_SA110 is not set
# CONFIG_ARM_SA1100 is not set
# CONFIG_ARM_XSCALE is not set
# CONFIG_GENERIC_386 is not set
# CONFIG_386 is not set
# CONFIG_486 is not set
# CONFIG_586 is not set
# CONFIG_586MMX is not set
# CONFIG_686 is not set
# CONFIG_PENTIUMII is not set
# CONFIG_PENTIUMIII is not set
# CONFIG_PENTIUM4 is not set
# CONFIG_K6 is not set
# CONFIG_K7 is not set
# CONFIG_ELAN is not set
# CONFIG_CRUSOE is not set
# CONFIG_WINCHIPC6 is not set
# CONFIG_WINCHIP2 is not set
# CONFIG_CYRIXIII is not set
# CONFIG_NEHEMIAH is not set
ARCH_LITTLE_ENDIAN=y
# ARCH_BIG_ENDIAN is not set
# ARCH_HAS_NO_MMU is not set
# ARCH_HAS_MMU is not set
UCLIBC_HAS_FLOATS=y
# HAS_FPU is not set
UCLIBC_HAS_SOFT_FLOAT=y
DO_C99_MATH=y
KERNEL_SOURCE="/usr/src/linux"
UCLIBC_UCLINUX_BROKEN_MUNMAP=y
EXCLUDE_BRK=y
C_SYMBOL_PREFIX=""
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
# HAVE_NO_PIC is not set
DOPIC=y
# HAVE_NO_SHARED is not set
# HAVE_SHARED is not set
# ARCH_HAS_NO_LDSO is not set
DL_FINI_CRT_COMPAT=y
UCLIBC_CTOR_DTOR=y
# HAS_NO_THREADS is not set
UCLIBC_HAS_THREADS=y
PTHREADS_DEBUG_SUPPORT=y
UCLIBC_HAS_LFS=y
# UCLIBC_STATIC_LDCONFIG is not set
MALLOC=y
# MALLOC_SIMPLE is not set
# MALLOC_STANDARD is not set
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
HAS_SHADOW=y
# UNIX98PTY_ONLY is not set
ASSUME_DEVPTS=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"

#
# Networking Support
#
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y

#
# String and Stdio Support
#
UCLIBC_HAS_STRING_GENERIC_OPT=y
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_WCHAR=y
# UCLIBC_HAS_LOCALE is not set
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
UCLIBC_HAS_STDIO_BUFSIZ_4096=y
# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
UCLIBC_HAS_STDIO_GETC_MACRO=y
UCLIBC_HAS_STDIO_PUTC_MACRO=y
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_FTW=y
UCLIBC_HAS_GLOB=y

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"

#
# uClibc security related options
#
# UCLIBC_SECURITY is not set

#
# uClibc development/debugging options
#
CROSS_COMPILER_PREFIX=""
# DODEBUG is not set
# DODEBUG_PT is not set
# DOASSERTS is not set
# UCLIBC_MALLOC_DEBUGGING is not set
WARNINGS="-Wall"
# UCLIBC_MJN3_ONLY is not set
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070523/70e54b22/attachment-0001.htm 
