From: =?ISO-8859-1?Q?Kim_Str=F8ger?= <ks@sfktech.com>
Date: Mon, 22 Oct 2007 12:12:40 +0200
Subject: [Buildroot] Can not build toolchain for arm.
In-Reply-To: <471C9104.5000005@promwad.com>
References: <20071021120218.1C89BA4A39@busybox.net>
	<471C7307.1020204@sfktech.com> <471C9104.5000005@promwad.com>
Message-ID: <471C7798.3030005@sfktech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net





Kuten Ivan wrote:
> Kim Str?ger wrote:
>   
>> Hi
>>
>> I am trying to build just the toolchain for the arm processor,  using
>> buildroot:  At revision 20315
>> but I am stock with this error ??
>>
>>
>>
>> /home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1/libmudflap/mf-runtime.c:2124:
>> error: '__mf_biglock' undeclared (first use in this function)
>> make[5]: *** [pth/mf-runtime.lo] Error 1
>> make[5]: Leaving directory
>> `/home/cz2/Crossdev/buildroot/toolchain_build_arm/gcc-4.2.1-final/arm-linux-uclibc/libmudflap'
>>
>>
>>     
>
> Please provide your .config
> I have built 4.2.1 armv4 920t  with soft-float and without soft-float successfully.
>
> Best regards,
> Ivan
>   

my .config


#
# Automatically generated make config: don't edit
# Mon Oct 22 10:57:39 2007
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="0.10.0-svn"
# BR2_alpha is not set
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_s390 is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
BR2_generic_arm=y
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
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
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to the Erik's uClibc development environment."

#
# Preset Devices
#
# BR2_TARGET_ARM is not set
# BR2_TARGET_ATMEL is not set
# BR2_TARGET_SHARP is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set
# BR2_TARGET_GENERIC_DEV_SYSTEM is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"

#
# Mirrors and Download locations
#
BR2_SOURCEFORGE_MIRROR="easynews"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
BR2_TOOLCHAIN_SOURCE=y
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y

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
# BR2_KERNEL_HEADERS_2_6_20_4 is not set
# BR2_KERNEL_HEADERS_2_6_20 is not set
# BR2_KERNEL_HEADERS_2_6_21_5 is not set
# BR2_KERNEL_HEADERS_2_6_21 is not set
# BR2_KERNEL_HEADERS_2_6_22_1 is not set
# BR2_KERNEL_HEADERS_2_6_22_10 is not set
BR2_KERNEL_HEADERS_2_6_22=y
# BR2_KERNEL_HEADERS_2_6_23 is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.22.10"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
BR2_UCLIBC_VERSION_0_9_29=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
# BR2_ENABLE_LOCALE is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_PROGRAM_INVOCATION is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
BR2_BINUTILS_VERSION_2_18=y
# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
BR2_BINUTILS_VERSION="2.18"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_3_4_6 is not set
# BR2_GCC_VERSION_4_0_4 is not set
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_0 is not set
BR2_GCC_VERSION_4_2_1=y
# BR2_GCC_IS_SNAP is not set
BR2_GCC_SUPPORTS_SYSROOT=y
# BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
BR2_GCC_VERSION="4.2.1"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_CXX is not set
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_LIBSTDCPP is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y

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
# BR2_ELF2FLT is not set
# BR2_MKLIBS is not set

#
# Common Toolchain Options
#
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
# BR2_LARGEFILE is not set
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_USE_WCHAR is not set
# BR2_SOFT_FLOAT is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
# BR2_PACKAGE_BUSYBOX is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_BASH is not set
# BR2_PACKAGE_BZIP2 is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
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
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_LTT is not set
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
# Target filesystem options
#

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set

#
# bootloader for target device
#

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
# BR2_KERNEL_HURD is not set
# BR2_PACKAGE_LINUX is not set
