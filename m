From: Jorge Ventura <jorge.araujo.ventura@gmail.com>
Date: Fri, 15 Mar 2013 08:51:03 -0500
Subject: [Buildroot]
	=?windows-1252?q?=91=5F=5Fctype=5Ftouplow=5Ft=92_and_?=
	=?windows-1252?q?=91=5F=5Fctype=5Fmask=5Ft=92_does_not_name_a_type?=
In-Reply-To: <20130315105421.675ecf61@skate>
References: <CAJEG_NdqCrS=ny=BMgF4n8ui5kavmOxtWyzMvxe-_97e=wRPTg@mail.gmail.com>
 <20130315105421.675ecf61@skate>
Message-ID: <CAJEG_NfYFc782e3iy+z_gwitxQT60BPJkX-2R0Ho5CAu9pxL6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi T. Petazzoni,
Thank you for your attention to my problem.
Yes, after clean all cycle. No matter what I do, I have always the same
error. The program I am trying to compile is firewall builder that is based
on qt4. Buildroot has all libraries required by the package (it's not too
many).

To avoid problems trying to fix that I always do a complete clean when I
make change in the configuration. Here is the buildroot config and next the
uClibc config with no change made by me.

Please, at uClibc config take a look in the options UCLIBC_HAS_CTYPE_xxxx,
maybe what I am having is related with those parameters.

Cheers,
Ventura

//-------------------- Buildroot ---------------------

#
# Automatically generated make config: don't edit
# Version: 0.9.33.2
# Thu Mar 14 20:46:25 2013
#
# TARGET_alpha is not set
# TARGET_arm is not set
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_c6x is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
TARGET_i386=y
# TARGET_i960 is not set
# TARGET_ia64 is not set
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
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="i386"
FORCE_OPTIONS_FOR_ARCH=y
# CONFIG_GENERIC_386 is not set
# CONFIG_386 is not set
# CONFIG_486 is not set
CONFIG_586=y
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
TARGET_SUBARCH="i586"

#
# Using ELF file format
#
ARCH_LITTLE_ENDIAN=y

#
# Using Little Endian
#
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
# UCLIBC_HAS_FENV is not set
UCLIBC_HAS_LONG_DOUBLE_MATH=y
KERNEL_HEADERS="/home/arduino/router/buildroot-2013.02/output/toolchain/linux/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
DOPIC=y
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
# LDSO_CACHE_SUPPORT is not set
LDSO_PRELOAD_ENV_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
# LDSO_STANDALONE_SUPPORT is not set
# LDSO_PRELINK_SUPPORT is not set
# UCLIBC_STATIC_LDCONFIG is not set
LDSO_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
LDSO_LD_LIBRARY_PATH=y
# LDSO_NO_CLEANUP is not set
UCLIBC_CTOR_DTOR=y
# LDSO_GNU_HASH_SUPPORT is not set
# HAS_NO_THREADS is not set
# LINUXTHREADS_OLD is not set
# LINUXTHREADS_NEW is not set
UCLIBC_HAS_THREADS_NATIVE=y
UCLIBC_HAS_THREADS=y
UCLIBC_HAS_TLS=y
# PTHREADS_DEBUG_SUPPORT is not set
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_SUSV3_LEGACY=y
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_STRICT_HEADERS is not set
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
UCLIBC_HAS___PROGNAME=y
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
UCLIBC_HAS_GETPT=y
UCLIBC_HAS_LIBUTIL=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

#
# String and Stdio Support
#
# UCLIBC_HAS_STRING_GENERIC_OPT is not set
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_LOCALE=y
# UCLIBC_BUILD_ALL_LOCALE is not set
UCLIBC_BUILD_MINIMAL_LOCALE=y
# UCLIBC_PREGENERATED_LOCALE_DATA is not set
UCLIBC_BUILD_MINIMAL_LOCALES=" en_US"
UCLIBC_HAS_XLOCALE=y
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
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
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_STDIO_FUTEXES=y
# UCLIBC_HAS_GNU_GETSUBOPT is not set

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
# UCLIBC_HAS_FNMATCH_OLD is not set
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_NFTW=y
UCLIBC_HAS_FTW=y
# UCLIBC_HAS_FTS is not set
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y
UCLIBC_HAS_UTMPX=y

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
UCLIBC_HAS_SSP=y
# UCLIBC_HAS_SSP_COMPAT is not set
# SSP_QUICK_CANARY is not set
PROPOLICE_BLOCK_ABRT=y
# PROPOLICE_BLOCK_SEGV is not set
# UCLIBC_BUILD_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

#
# Development/debugging options
#
CROSS_COMPILER_PREFIX="/home/arduino/router/buildroot-2013.02/output/host/usr/bin/i586-buildroot-linux-uclibc-"
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
# UCLIBC_HAS_BACKTRACE is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
# UCLIBC_MJN3_ONLY is not set

// -------------------  uClibc ------------------

#
# Automatically generated make config: don't edit
# Version: 0.9.33.2
# Thu Mar 14 20:46:25 2013
#
# TARGET_alpha is not set
# TARGET_arm is not set
# TARGET_avr32 is not set
# TARGET_bfin is not set
# TARGET_c6x is not set
# TARGET_cris is not set
# TARGET_e1 is not set
# TARGET_frv is not set
# TARGET_h8300 is not set
# TARGET_hppa is not set
TARGET_i386=y
# TARGET_i960 is not set
# TARGET_ia64 is not set
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
# TARGET_vax is not set
# TARGET_x86_64 is not set
# TARGET_xtensa is not set

#
# Target Architecture Features and Options
#
TARGET_ARCH="i386"
FORCE_OPTIONS_FOR_ARCH=y
# CONFIG_GENERIC_386 is not set
# CONFIG_386 is not set
# CONFIG_486 is not set
CONFIG_586=y
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
TARGET_SUBARCH="i586"

#
# Using ELF file format
#
ARCH_LITTLE_ENDIAN=y

#
# Using Little Endian
#
ARCH_HAS_MMU=y
ARCH_USE_MMU=y
UCLIBC_HAS_FLOATS=y
UCLIBC_HAS_FPU=y
DO_C99_MATH=y
# DO_XSI_MATH is not set
# UCLIBC_HAS_FENV is not set
UCLIBC_HAS_LONG_DOUBLE_MATH=y
KERNEL_HEADERS="/home/arduino/router/buildroot-2013.02/output/toolchain/linux/include"
HAVE_DOT_CONFIG=y

#
# General Library Settings
#
DOPIC=y
HAVE_SHARED=y
# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
LDSO_LDD_SUPPORT=y
# LDSO_CACHE_SUPPORT is not set
LDSO_PRELOAD_ENV_SUPPORT=y
# LDSO_PRELOAD_FILE_SUPPORT is not set
# LDSO_STANDALONE_SUPPORT is not set
# LDSO_PRELINK_SUPPORT is not set
# UCLIBC_STATIC_LDCONFIG is not set
LDSO_RUNPATH=y
LDSO_SEARCH_INTERP_PATH=y
LDSO_LD_LIBRARY_PATH=y
# LDSO_NO_CLEANUP is not set
UCLIBC_CTOR_DTOR=y
# LDSO_GNU_HASH_SUPPORT is not set
# HAS_NO_THREADS is not set
# LINUXTHREADS_OLD is not set
# LINUXTHREADS_NEW is not set
UCLIBC_HAS_THREADS_NATIVE=y
UCLIBC_HAS_THREADS=y
UCLIBC_HAS_TLS=y
# PTHREADS_DEBUG_SUPPORT is not set
UCLIBC_HAS_SYSLOG=y
UCLIBC_HAS_LFS=y
# MALLOC is not set
# MALLOC_SIMPLE is not set
MALLOC_STANDARD=y
MALLOC_GLIBC_COMPAT=y
UCLIBC_DYNAMIC_ATEXIT=y
# COMPAT_ATEXIT is not set
UCLIBC_SUSV3_LEGACY=y
# UCLIBC_SUSV3_LEGACY_MACROS is not set
UCLIBC_SUSV4_LEGACY=y
# UCLIBC_STRICT_HEADERS is not set
# UCLIBC_HAS_STUBS is not set
UCLIBC_HAS_SHADOW=y
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
UCLIBC_HAS___PROGNAME=y
UCLIBC_HAS_PTY=y
ASSUME_DEVPTS=y
UNIX98PTY_ONLY=y
UCLIBC_HAS_GETPT=y
UCLIBC_HAS_LIBUTIL=y
UCLIBC_HAS_TM_EXTENSIONS=y
UCLIBC_HAS_TZ_CACHING=y
UCLIBC_HAS_TZ_FILE=y
UCLIBC_HAS_TZ_FILE_READ_MANY=y
UCLIBC_TZ_FILE_PATH="/etc/TZ"
UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y

#
# Advanced Library Settings
#
UCLIBC_PWD_BUFFER_SIZE=256
UCLIBC_GRP_BUFFER_SIZE=256

#
# Support various families of functions
#
UCLIBC_LINUX_MODULE_26=y
# UCLIBC_LINUX_MODULE_24 is not set
UCLIBC_LINUX_SPECIFIC=y
UCLIBC_HAS_GNU_ERROR=y
UCLIBC_BSD_SPECIFIC=y
UCLIBC_HAS_BSD_ERR=y
# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
# UCLIBC_NTP_LEGACY is not set
# UCLIBC_SV4_DEPRECATED is not set
UCLIBC_HAS_REALTIME=y
UCLIBC_HAS_ADVANCED_REALTIME=y
UCLIBC_HAS_EPOLL=y
UCLIBC_HAS_XATTR=y
UCLIBC_HAS_PROFILING=y
UCLIBC_HAS_CRYPT_IMPL=y
# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
UCLIBC_HAS_CRYPT=y
UCLIBC_HAS_NETWORK_SUPPORT=y
UCLIBC_HAS_SOCKET=y
UCLIBC_HAS_IPV4=y
UCLIBC_HAS_IPV6=y
UCLIBC_HAS_RPC=y
UCLIBC_HAS_FULL_RPC=y
UCLIBC_HAS_REENTRANT_RPC=y
UCLIBC_USE_NETLINK=y
UCLIBC_SUPPORT_AI_ADDRCONFIG=y
# UCLIBC_HAS_BSD_RES_CLOSE is not set
UCLIBC_HAS_COMPAT_RES_STATE=y
# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
UCLIBC_HAS_RESOLVER_SUPPORT=y
UCLIBC_HAS_LIBRESOLV_STUB=y
UCLIBC_HAS_LIBNSL_STUB=y

#
# String and Stdio Support
#
# UCLIBC_HAS_STRING_GENERIC_OPT is not set
UCLIBC_HAS_STRING_ARCH_OPT=y
UCLIBC_HAS_CTYPE_TABLES=y
UCLIBC_HAS_CTYPE_SIGNED=y
# UCLIBC_HAS_CTYPE_UNSAFE is not set
UCLIBC_HAS_CTYPE_CHECKED=y
# UCLIBC_HAS_CTYPE_ENFORCED is not set
UCLIBC_HAS_WCHAR=y
UCLIBC_HAS_LOCALE=y
# UCLIBC_BUILD_ALL_LOCALE is not set
UCLIBC_BUILD_MINIMAL_LOCALE=y
# UCLIBC_PREGENERATED_LOCALE_DATA is not set
UCLIBC_BUILD_MINIMAL_LOCALES=" en_US"
UCLIBC_HAS_XLOCALE=y
UCLIBC_HAS_HEXADECIMAL_FLOATS=y
# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
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
# UCLIBC_HAS_STDIO_GETC_MACRO is not set
# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
UCLIBC_HAS_PRINTF_M_SPEC=y
UCLIBC_HAS_ERRNO_MESSAGES=y
# UCLIBC_HAS_SYS_ERRLIST is not set
UCLIBC_HAS_SIGNUM_MESSAGES=y
# UCLIBC_HAS_SYS_SIGLIST is not set
UCLIBC_HAS_GNU_GETOPT=y
UCLIBC_HAS_STDIO_FUTEXES=y
# UCLIBC_HAS_GNU_GETSUBOPT is not set

#
# Big and Tall
#
UCLIBC_HAS_REGEX=y
# UCLIBC_HAS_REGEX_OLD is not set
UCLIBC_HAS_FNMATCH=y
# UCLIBC_HAS_FNMATCH_OLD is not set
# UCLIBC_HAS_WORDEXP is not set
UCLIBC_HAS_NFTW=y
UCLIBC_HAS_FTW=y
# UCLIBC_HAS_FTS is not set
UCLIBC_HAS_GLOB=y
UCLIBC_HAS_GNU_GLOB=y
UCLIBC_HAS_UTMPX=y

#
# Library Installation Options
#
RUNTIME_PREFIX="/"
DEVEL_PREFIX="/usr/"
MULTILIB_DIR="lib"
HARDWIRED_ABSPATH=y

#
# Security options
#
# UCLIBC_BUILD_PIE is not set
# UCLIBC_HAS_ARC4RANDOM is not set
UCLIBC_HAS_SSP=y
# UCLIBC_HAS_SSP_COMPAT is not set
# SSP_QUICK_CANARY is not set
PROPOLICE_BLOCK_ABRT=y
# PROPOLICE_BLOCK_SEGV is not set
# UCLIBC_BUILD_SSP is not set
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

#
# Development/debugging options
#
CROSS_COMPILER_PREFIX="/home/arduino/router/buildroot-2013.02/output/host/usr/bin/i586-buildroot-linux-uclibc-"
UCLIBC_EXTRA_CFLAGS=""
# DODEBUG is not set
DOSTRIP=y
# DOASSERTS is not set
# SUPPORT_LD_DEBUG is not set
# SUPPORT_LD_DEBUG_EARLY is not set
# UCLIBC_MALLOC_DEBUGGING is not set
# UCLIBC_HAS_BACKTRACE is not set
WARNINGS="-Wall"
# EXTRA_WARNINGS is not set
# DOMULTI is not set
# UCLIBC_MJN3_ONLY is not set


On Fri, Mar 15, 2013 at 4:54 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Jorge Ventura,
>
> On Thu, 14 Mar 2013 14:07:48 -0500, Jorge Ventura wrote:
>
> > It seems that something is missing in my uClibc configuration that cause
> > the two types be undefined or another include is missing in the code
> that I
> > am trying to compile.
> >
> > Someone has any clue about this problem?
>
> Is this happening after a complete "make clean all" cycle? If so, could
> you post your Buildroot .config? Did you modify the uClibc
> configuration with "make uclibc-menuconfig" ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130315/d1059b79/attachment-0001.html>
