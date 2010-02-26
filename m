From: Nuno Pereira <fxss@iol.pt>
Date: Fri, 26 Feb 2010 10:05:31 +0000
Subject: [Buildroot] Reduce rootfs size
In-Reply-To: <87wry13yhs.fsf@macbook.be.48ers.dk>
References: <13abadeb1002250943r17888defs4976934b3718d5d9@mail.gmail.com>
	<87wry13yhs.fsf@macbook.be.48ers.dk>
Message-ID: <13abadeb1002260205t514e1150wc23e4ba75a427e53@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using a PPC architecture and the maximum size available for the
rootfs is 1.114.111 bytes.

My config is:

#
# Automatically generated make config: don't edit
# Mon Feb 22 19:01:36 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.02-git"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
BR2_powerpc=y
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
BR2_generic_powerpc=y
# BR2_powerpc_401 is not set
# BR2_powerpc_403 is not set
# BR2_powerpc_405 is not set
# BR2_powerpc_405fp is not set
# BR2_powerpc_440 is not set
# BR2_powerpc_440fp is not set
# BR2_powerpc_505 is not set
# BR2_powerpc_601 is not set
# BR2_powerpc_602 is not set
# BR2_powerpc_603 is not set
# BR2_powerpc_603e is not set
# BR2_powerpc_604 is not set
# BR2_powerpc_604e is not set
# BR2_powerpc_620 is not set
# BR2_powerpc_630 is not set
# BR2_powerpc_740 is not set
# BR2_powerpc_7400 is not set
# BR2_powerpc_7450 is not set
# BR2_powerpc_750 is not set
# BR2_powerpc_801 is not set
# BR2_powerpc_821 is not set
# BR2_powerpc_823 is not set
# BR2_powerpc_860 is not set
# BR2_powerpc_970 is not set
# BR2_powerpc_8540 is not set
BR2_ARCH="powerpc"
BR2_ENDIAN="BIG"

#
# Target options
#

#
# Preset Devices
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_BZR_CO="bzr co"
BR2_BZR_UP="bzr up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_COPYTO=""

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_STAGING_DIR="$(BASE_DIR)/staging"
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=2
# BR2_PREFER_IMA is not set
BR2_DEPRECATED=y
BR2_RECENT=y
BR2_CONFIG_CACHE=y
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_26 is not set
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
# BR2_KERNEL_HEADERS_2_6_30 is not set
# BR2_KERNEL_HEADERS_2_6_31 is not set
BR2_KERNEL_HEADERS_2_6_32=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.32.7"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
# BR2_UCLIBC_VERSION_0_9_30_1 is not set
BR2_UCLIBC_VERSION_0_9_30_2=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.30.2"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
# BR2_BINUTILS_VERSION_2_19_1 is not set
BR2_BINUTILS_VERSION_2_20=y
BR2_BINUTILS_VERSION="2.20"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_1_2 is not set
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
# BR2_GCC_VERSION_4_3_2 is not set
# BR2_GCC_VERSION_4_3_3 is not set
# BR2_GCC_VERSION_4_3_4 is not set
BR2_GCC_VERSION_4_4_X=y
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.4.3"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_LIBGCJ is not set
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
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_6_4 is not set
# BR2_GDB_VERSION_6_5 is not set
# BR2_GDB_VERSION_6_6 is not set
# BR2_GDB_VERSION_6_7_1 is not set
# BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 is not set
BR2_GDB_VERSION_6_8=y
BR2_GDB_VERSION="6.8"

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_USE_WCHAR is not set
BR2_SOFT_FLOAT=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PROGRAM_INVOCATION is not set
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
# BR2_MKLIBS is not set
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
BR2_ENABLE_MULTILIB=y
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_12_X is not set
# BR2_BUSYBOX_VERSION_1_13_X is not set
# BR2_BUSYBOX_VERSION_1_14_X is not set
# BR2_BUSYBOX_VERSION_1_15_X is not set
BR2_BUSYBOX_VERSION_1_16_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.16.0"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
# BR2_PACKAGE_FLEX is not set

#
# native toolchain needs development files in target filesystem
#
# BR2_PACKAGE_MAKE is not set

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBFLOAT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set

#
# logrotate     - disabled (requires wchar support)
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set

#
# Database
#
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLITE is not set

#
# Text editors
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_HOSTAP is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IPERF is not set

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Hardware handling / blockdevices and filesystem maintenance
#

#
# dbus not available (need expat or libxml2)
#
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_LIBUSB is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set

#
# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
#

#
# ntfsprogs requires a toolchain with WCHAR support
#
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# asterisk	- disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBDVDREAD is not set
# BR2_PACKAGE_LIBDVDNAV is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_SWFDEC is not set
# BR2_PACKAGE_FESTIVAL is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# text rendering libraries
#
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_SLANG is not set

#
# text rendering applications
#
# BR2_PACKAGE_DIALOG is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_TIFF is not set

#
# busybox graphic applications
#

#
# --> May be broken in busybox
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#
# BR2_PACKAGE_QT is not set

#
# X.org requires a toolchain with WCHAR support
#

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBDRM is not set
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_OPENMOTIF is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_TSLIB is not set

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# X Window managers
#

#
# X applications
#
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_XPDF is not set

#
# Compressors / decompressors
#

#
# libarchive requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set
# BR2_PACKAGE_ZLIB is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set

#
# ruby requires a toolchain with WCHAR support
#
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_XERCES is not set

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# filesystem for target device
#
BR2_TARGET_ROOTFS_CRAMFS=y
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_YABOOT is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set


Concerning libstdc++ I prefer to link dynamically.

Thanks + Regards,
Nuno


On 25 February 2010 19:29, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:
>
> ?Nuno> Hi,
> ?Nuno> Is there a way of reduce rootfs size? My device doesn't have space for
> ?Nuno> the resulting rootfs done by buildroot (I'm so using a snapshot from
> ?Nuno> the beginning of the month)
>
> Possible, but we'll need to know some more details - What is the maximum
> size you have, your current config, what functionality do you need?
>
> ?Nuno> Alternatively, a way of reduce libstdc++ size?
>
> Not easily. Depending on how many applications needs libstdc++ and how
> much functionality from it you need, it might be smaller to link
> statically against it.
>
> --
> Bye, Peter Korsgaard
>
