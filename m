From: JNY <jny0@hotmail.com>
Date: Wed, 21 Jul 2010 00:32:51 -0700 (PDT)
Subject: [Buildroot] Build failed with Error 1 and Error 2
In-Reply-To: <20100721085235.7f682c11@surf>
References: <29222293.post@talk.nabble.com> <20100721085235.7f682c11@surf>
Message-ID: <29222695.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Can you please post your .config so that we know which version of the kernel
headers you're using ?

>Thanks,
>Thomas

---------------------------------------------------------------------------------------------------------------
Please see below for the contents of the .config file.
NB. I am also using busybox, uclibc and kernel .config files.
---------------------------------------------------------------------------------------------------------------
#
# Automatically generated make config: don't edit
# Wed Jun  2 11:43:02 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.02"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
BR2_i386=y
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_nios2 is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_x86_i386 is not set
BR2_x86_i486=y
# BR2_x86_i586 is not set
# BR2_x86_i686 is not set
# BR2_x86_pentiumpro is not set
# BR2_x86_pentium_mmx is not set
# BR2_x86_pentium_m is not set
# BR2_x86_pentium2 is not set
# BR2_x86_pentium3 is not set
# BR2_x86_pentium4 is not set
# BR2_x86_prescott is not set
# BR2_x86_nocona is not set
# BR2_x86_core2 is not set
# BR2_x86_k6 is not set
# BR2_x86_k6_2 is not set
# BR2_x86_athlon is not set
# BR2_x86_athlon_4 is not set
# BR2_x86_opteron is not set
# BR2_x86_opteron_sse3 is not set
# BR2_x86_barcelona is not set
# BR2_x86_geode is not set
# BR2_x86_c3 is not set
# BR2_x86_winchip_c6 is not set
# BR2_x86_winchip2 is not set
BR2_ARCH="i486"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="i486"
BR2_GCC_TARGET_ARCH="i486"

#
# Target options
#

#
# Preset Devices
#
# BR2_TARGET_X86 is not set
BR2_TARGET_GENERIC_HOSTNAME="monitor"
BR2_TARGET_GENERIC_ISSUE="Welcome to Monitoring"
BR2_TARGET_GENERIC_GETTY=y
# BR2_TARGET_GENERIC_GETTY_NONE is not set
# BR2_TARGET_GENERIC_GETTY_TTYS0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
BR2_TARGET_GENERIC_GETTY_TTYS3=y
# BR2_TARGET_GENERIC_GETTY_TTYAMA0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYAMA1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYAMA2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYAMA3 is not set
# BR2_TARGET_GENERIC_GETTY_TTYSAC0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYSAC1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYSAC2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYSAC3 is not set
# BR2_TARGET_GENERIC_GETTY_TTYMXC0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYMXC1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYMXC2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYUL0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYUL1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYUL2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYUL3 is not set
# BR2_TARGET_GENERIC_GETTY_TTYPSC0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYPSC1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYPSC2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYPSC3 is not set
# BR2_TARGET_GENERIC_GETTY_TTYCPM0 is not set
# BR2_TARGET_GENERIC_GETTY_TTYCPM1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYCPM2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYCPM3 is not set
BR2_TARGET_GENERIC_GETTY_PORT="ttyS3"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"

#
# Build options
#
BR2_WGET="wget --passive-ftp"
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
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_CONFIG_CACHE is not set
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
BR2_DEFAULT_KERNEL_HEADERS="2.6.32.9"

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
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
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
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
BR2_INET_RPC=y
# BR2_ENABLE_LOCALE is not set
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US en_GB"
BR2_USE_WCHAR=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
BR2_PROGRAM_INVOCATION=y
# BR2_INSTALL_LIBSTDCPP is not set
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_MKLIBS=y
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
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
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
BR2_PACKAGE_BZIP2=y
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set

#
# native toolchain needs development files in target filesystem
#
BR2_PACKAGE_GREP=y
# BR2_PACKAGE_MAKE is not set
BR2_PACKAGE_PATCH=y
BR2_PACKAGE_SED=y
BR2_PACKAGE_TAR=y

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
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set

#
# gperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_VALGRIND is not set
BR2_PACKAGE_PCRE=y
# BR2_PACKAGE_INTLTOOL is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_KEXEC is not set
BR2_PACKAGE_LESS=y
BR2_PACKAGE_LIBCONFIG=y
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_LIBICONV is not set
# BR2_PACKAGE_LIBIDN is not set
BR2_PACKAGE_LIBLOCKFILE=y
# BR2_PACKAGE_LIBOIL is not set
BR2_PACKAGE_LIBSYSFS=y
BR2_PACKAGE_LOCKFILE_PROGS=y
BR2_PACKAGE_LOGROTATE=y
BR2_PACKAGE_LSOF=y
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
BR2_PACKAGE_POPT=y
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
BR2_PACKAGE_SCREEN=y
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
BR2_PACKAGE_UTIL-LINUX=y
BR2_PACKAGE_WHICH=y

#
# Database
#

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

#
# Text editors
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set
BR2_PACKAGE_VIM=y
BR2_PACKAGE_VIM_RUNTIME=y

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BMON is not set
# BR2_PACKAGE_BRIDGE is not set

#
# ctorrent requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_HASERL=y
# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
BR2_PACKAGE_HASERL_VERSION_0_9_X=y
BR2_PACKAGE_HASERL_VERSION="0.9.26"
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
BR2_PACKAGE_IPTABLES=y
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
BR2_PACKAGE_LIBNL=y
# BR2_PACKAGE_LIBOSIP2 is not set
BR2_PACKAGE_LIBPCAP=y
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
BR2_PACKAGE_LIGHTTPD=y

#
# lighttpd packages
#
BR2_PACKAGE_LIGHTTPD_OPENSSL=y
BR2_PACKAGE_LIGHTTPD_ZLIB=y
BR2_PACKAGE_LIGHTTPD_BZIP2=y
BR2_PACKAGE_LIGHTTPD_PCRE=y
BR2_PACKAGE_LINKS=y
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set
BR2_PACKAGE_NETCAT=y
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENVPN is not set
BR2_PACKAGE_PORTMAP=y
BR2_PACKAGE_PPPD=y
# BR2_PACKAGE_PPPD_FILTER is not set
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
BR2_PACKAGE_TCPDUMP=y
# BR2_PACKAGE_TCPDUMP_SMB is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
BR2_PACKAGE_WEBIF=y
BR2_PACKAGE_WEBIF_INSTALL_INDEX_HTML=y
# BR2_PACKAGE_WEBIF_LANGUAGES is not set
BR2_PACKAGE_WGET=y
BR2_PACKAGE_WIRELESS_TOOLS=y
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Hardware handling / blockdevices and filesystem maintenance
#
# BR2_PACKAGE_ACPID is not set

#
# dbus not available (need expat or libxml2)
#
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_UTILS=y
BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
BR2_PACKAGE_E2FSPROGS_BLKID=y
BR2_PACKAGE_E2FSPROGS_CHATTR=y
BR2_PACKAGE_E2FSPROGS_DUMPE2FS=y
BR2_PACKAGE_E2FSPROGS_E2FREEFRAG=y
BR2_PACKAGE_E2FSPROGS_E2FSCK=y
BR2_PACKAGE_E2FSPROGS_E2LABEL=y
BR2_PACKAGE_E2FSPROGS_E2UNDO=y
BR2_PACKAGE_E2FSPROGS_FILEFRAG=y
BR2_PACKAGE_E2FSPROGS_FINDFS=y
BR2_PACKAGE_E2FSPROGS_FSCK=y
BR2_PACKAGE_E2FSPROGS_LOGSAVE=y
BR2_PACKAGE_E2FSPROGS_LSATTR=y
BR2_PACKAGE_E2FSPROGS_MKE2FS=y
BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND=y
BR2_PACKAGE_E2FSPROGS_TUNE2FS=y
BR2_PACKAGE_E2FSPROGS_UUIDGEN=y
BR2_PACKAGE_E2FSPROGS_UUIDD=y

#
# e2fsprogs libraries
#
BR2_PACKAGE_E2FSPROGS_LIBUUID=y
BR2_PACKAGE_E2FSPROGS_LIBBLKID=y
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HOTPLUG is not set
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_I2C_TOOLS=y
# BR2_PACKAGE_INPUT_TOOLS is not set
BR2_PACKAGE_IOSTAT=y
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LM_SENSORS=y
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
BR2_PACKAGE_PCIUTILS=y
# BR2_PACKAGE_PCMCIA is not set
BR2_PACKAGE_SETSERIAL=y
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SSHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_UDEV_UTILS=y

#
# Extra udev tools
#
# BR2_PACKAGE_UDEV_VOLUME_ID is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
BR2_PACKAGE_USBUTILS=y
BR2_PACKAGE_USBUTILS_ZLIB=y
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set
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

#
# festival requires a toolchain with C++ support enabled
#

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_TREMOR is not set
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# text rendering libraries
#
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
BR2_PACKAGE_NCURSES_TARGET_MENU=y
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

#
# qt requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_XORG7 is not set

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

#
# Compressors / decompressors
#
BR2_PACKAGE_GZIP=y
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set

#
# lzma requires a toolchain with C++ support
#
BR2_PACKAGE_ZLIB=y

#
# Package managers
#
BR2_PACKAGE_IPKG=y
# BR2_PACKAGE_PORTAGE is not set

#
# rpm requires libneon with SSL, XML and ZLIB support
#

#
# xz payload support requires a toolchain with c++ support
#

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
BR2_PACKAGE_PYTHON=y
# BR2_PACKAGE_PYTHON_DEV is not set
BR2_PACKAGE_PYTHON_PY_ONLY=y
# BR2_PACKAGE_PYTHON_PYC_ONLY is not set
# BR2_PACKAGE_PYTHON_PY_PYC is not set

#
# The following modules are unusual or require extra libraries
#
# BR2_PACKAGE_PYTHON_BSDDB is not set
BR2_PACKAGE_PYTHON_CODECSCJK=y
BR2_PACKAGE_PYTHON_CURSES=y
# BR2_PACKAGE_PYTHON_PYEXPAT is not set
# BR2_PACKAGE_PYTHON_READLINE is not set
# BR2_PACKAGE_PYTHON_SSL is not set
# BR2_PACKAGE_PYTHON_TKINTER is not set
BR2_PACKAGE_PYTHON_UNICODEDATA=y
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBXML_PARSER_PERL is not set

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
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
# BR2_TARGET_ROOTFS_TAR_NONE is not set
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
BR2_TARGET_ROOTFS_TAR_BZIP2=y
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_ROOTFS_TAR_COPYTO=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_ISO9660 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
BR2_TARGET_GRUB=y
BR2_TARGET_GRUB_SPLASH=y
# BR2_TARGET_GRUB_DISKLESS is not set
# BR2_TARGET_GRUB_3c595 is not set
# BR2_TARGET_GRUB_3c90x is not set
# BR2_TARGET_GRUB_davicom is not set
# BR2_TARGET_GRUB_e1000 is not set
# BR2_TARGET_GRUB_eepro100 is not set
# BR2_TARGET_GRUB_epic100 is not set
# BR2_TARGET_GRUB_forcedeth is not set
# BR2_TARGET_GRUB_natsemi is not set
# BR2_TARGET_GRUB_ns83820 is not set
# BR2_TARGET_GRUB_ns8390 is not set
# BR2_TARGET_GRUB_pcnet32 is not set
# BR2_TARGET_GRUB_pnic is not set
# BR2_TARGET_GRUB_rtl8139 is not set
# BR2_TARGET_GRUB_r8169 is not set
# BR2_TARGET_GRUB_sis900 is not set
# BR2_TARGET_GRUB_tg3 is not set
# BR2_TARGET_GRUB_tulip is not set
# BR2_TARGET_GRUB_tlan is not set
# BR2_TARGET_GRUB_undi is not set
# BR2_TARGET_GRUB_via_rhine is not set
# BR2_TARGET_GRUB_w89c840 is not set
# BR2_TARGET_SYSLINUX is not set
# BR2_TARGET_PXELINUX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
# BR2_KERNEL_none is not set
BR2_KERNEL_LINUX_ADVANCED=y
# BR2_KERNEL_LINUX is not set
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
BR2_PACKAGE_LINUX_FORMAT="bzImage"
BR2_KERNEL_CURRENT_VERSION="2.6.32.9"
BR2_KERNEL_LATEST_2_6_32="9"
BR2_KERNEL_LATEST_2_6_31="12"
BR2_KERNEL_LATEST_2_6_30="10"
BR2_KERNEL_LATEST_2_6_29="6"
BR2_KERNEL_LATEST_2_6_28="10"
BR2_KERNEL_LATEST_2_6_27="45"
BR2_KERNEL_LATEST_2_6_26="8"
BR2_KERNEL_LATEST_2_6_25="20"
BR2_KERNEL_LATEST_2_6_24="7"
BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
BR2_LINUX_2_6_STABLE=y
# BR2_LINUX_2_6_32 is not set
# BR2_LINUX_2_6_31 is not set
# BR2_LINUX_2_6_30 is not set
# BR2_LINUX_2_6_29 is not set
# BR2_LINUX_2_6_28 is not set
# BR2_LINUX_2_6_27 is not set
# BR2_LINUX_2_6_26 is not set
# BR2_LINUX_2_6_25 is not set
# BR2_LINUX_2_6_24 is not set
# BR2_LINUX26_CUSTOM is not set

#
# Patches
#
# BR2_KERNEL_ARCH_PATCH_ENABLED is not set
BR2_LINUX_BSP_PATCH=""
BR2_DOWNLOAD_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"
BR2_LINUX26_VERSION="$(BR2_KERNEL_CURRENT_VERSION)"

#
# Linux Kernel Configuration
#
BR2_PACKAGE_LINUX_USE_KCONFIG=y
# BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
BR2_LINUX_BIN_BZIMAGE=y
# BR2_LINUX_BIN_UIMAGE is not set
# BR2_LINUX_BIN_VMLINUX is not set
# BR2_LINUX_BIN_ZIMAGE is not set
# BR2_LINUX_BIN_CUSTOM is not set

#
# Destinations for linux kernel binaries
#
BR2_LINUX_COPYTO_ROOTFS=y
# BR2_LINUX_COPYTO_TFTPBOOT is not set
BR2_LINUX_COPYTO=""
BR2_LINUX_COPY_CONFIGURATION=y
-- 
View this message in context: http://old.nabble.com/Build-failed-with-Error-1-and-Error-2-tp29222293p29222695.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
