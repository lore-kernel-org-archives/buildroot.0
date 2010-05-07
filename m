From: mohamed mohamed nour eldin <eng.mohamed.nour.eldin@gmail.com>
Date: Fri, 7 May 2010 11:27:07 +0300
Subject: [Buildroot] serial console and wpa_supplicant
In-Reply-To: <878w7w86uw.fsf@macbook.be.48ers.dk>
References: <j2kc72f6b301005061540yb1d26da4gb3d5383b4fa4f476@mail.gmail.com> 
	<878w7w86uw.fsf@macbook.be.48ers.dk>
Message-ID: <r2kc72f6b301005070127z129a32d7u6de7a4245281fbc8@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks a lot Peter,

i'm using buildroot-2010.02 with an external toolchain built by
crosstool-ng-1.4.2

here's the .config

#
# Automatically generated make config: don't edit
# Thu May  6 23:16:49 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.02"
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
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
BR2_arm920t=y
# BR2_arm922t is not set
# BR2_arm926t is not set
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set

#
# cortex-A8 needs gcc >= 4.4.x
#
# BR2_cortex_a8 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Target options
#

#
# Preset Devices
#
# BR2_TARGET_ARMLTD is not set
# BR2_TARGET_ATMEL is not set
# BR2_TARGET_KWIKBYTE is not set
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Ebook Reader"
BR2_TARGET_GENERIC_GETTY=y
# BR2_TARGET_GENERIC_GETTY_NONE is not set
BR2_TARGET_GENERIC_GETTY_TTYS0=y
# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
# BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
# BR2_TARGET_GENERIC_GETTY_TTYS3 is not set
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
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
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
BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
BR2_JLEVEL=2
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
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
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_UCLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_GLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_STRIP=y

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
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_USE_WCHAR=y
BR2_PREFER_SOFT_FLOAT=y
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
BR2_TOOLCHAIN_EXTERNAL_PATH="/usr/local/xtools/arm-unknown-linux-uclibcgnueabi"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_12_X is not set
BR2_BUSYBOX_VERSION_1_13_X=y
# BR2_BUSYBOX_VERSION_1_14_X is not set
# BR2_BUSYBOX_VERSION_1_15_X is not set
# BR2_BUSYBOX_VERSION_1_16_X is not set
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.13.4"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="/media/E/Mini2440/busybox-1.13.3/.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_BUSYBOX_SKELETON is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_BZIP2 is not set

#
# coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set

#
# native toolchain needs development files in target filesystem
#
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set

#
# tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#

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
BR2_PACKAGE_GETTEXT=y
# BR2_PACKAGE_GETTEXT_STATIC is not set
BR2_PACKAGE_LIBINTL=y
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_PCRE is not set
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
# BR2_PACKAGE_ENCHANT is not set
BR2_PACKAGE_FILE=y
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_LIBICONV=y
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
BR2_PACKAGE_LIBOIL=y
# BR2_PACKAGE_LIBSYSFS is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
BR2_PACKAGE_MEMSTAT=y
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_WHICH is not set

#
# Database
#
# BR2_PACKAGE_MYSQL_CLIENT is not set
BR2_PACKAGE_SQLITE=y
# BR2_PACKAGE_SQLITE_READLINE is not set

#
# Text editors
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_VIM is not set

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
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IPERF is not set

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set
# BR2_PACKAGE_IPTABLES is not set
BR2_PACKAGE_IW=y
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_CURL=y
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
BR2_PACKAGE_LIBNL=y
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_NETCAT is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
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
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WGET is not set
BR2_PACKAGE_WIRELESS_TOOLS=y
BR2_PACKAGE_WPA_SUPPLICANT=y
# BR2_PACKAGE_WPA_SUPPLICANT_EAP is not set
# BR2_PACKAGE_WPA_SUPPLICANT_CLI is not set
# BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE is not set

#
# Hardware handling / blockdevices and filesystem maintenance
#
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set
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
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HOTPLUG is not set
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
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_UDEV is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GSTREAMER_LIBXML2=y
BR2_PACKAGE_GST_PLUGINS_BASE=y

#
# dependency-less plugins
#
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT=y
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE=y
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE=y
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK=y
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND=y
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE is not set
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE=y
BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME=y

#
# plugins with external dependencies (there may be more available)
#
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA is not set
# BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS is not set
# BR2_PACKAGE_GST_PLUGINS_GOOD is not set
# BR2_PACKAGE_GST_PLUGINS_BAD is not set
# BR2_PACKAGE_GST_PLUGINS_UGLY is not set
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
BR2_PACKAGE_JPEG=y
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBUNGIF=y
# BR2_PACKAGE_LINUX_FUSION is not set
BR2_PACKAGE_PIXMAN=y
# BR2_PACKAGE_SDL is not set
BR2_PACKAGE_TIFF=y

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
BR2_PACKAGE_QT=y
# BR2_PACKAGE_QT_DEBUG is not set
BR2_PACKAGE_QT_SHARED=y
# BR2_PACKAGE_QT_STATIC is not set
BR2_PACKAGE_QT_LICENSE_APPROVED=y
BR2_PACKAGE_QT_QT3SUPPORT=y
BR2_PACKAGE_QT_GUI_MODULE=y

#
# Pixel depths
#

#
# Deselecting each option leads to Qt's default (8,16,32)
#
# BR2_PACKAGE_QT_PIXEL_DEPTH_1 is not set
# BR2_PACKAGE_QT_PIXEL_DEPTH_4 is not set
BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
# BR2_PACKAGE_QT_PIXEL_DEPTH_12 is not set
# BR2_PACKAGE_QT_PIXEL_DEPTH_15 is not set
BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
# BR2_PACKAGE_QT_PIXEL_DEPTH_18 is not set
# BR2_PACKAGE_QT_PIXEL_DEPTH_24 is not set
BR2_PACKAGE_QT_PIXEL_DEPTH_32=y

#
# Fonts
#
BR2_PACKAGE_QT_FONT_MICRO=y
BR2_PACKAGE_QT_FONT_FIXED=y
BR2_PACKAGE_QT_FONT_HELVETICA=y
# BR2_PACKAGE_QT_FONT_JAPANESE is not set
BR2_PACKAGE_QT_FONT_UNIFONT=y
# BR2_PACKAGE_QT_NOFREETYPE is not set
# BR2_PACKAGE_QT_QTFREETYPE is not set
BR2_PACKAGE_QT_SYSTEMFREETYPE=y
BR2_PACKAGE_QT_GIF=y
# BR2_PACKAGE_QT_LIBMNG is not set
# BR2_PACKAGE_QT_NOJPEG is not set
BR2_PACKAGE_QT_SYSTEMJPEG=y
# BR2_PACKAGE_QT_QTJPEG is not set
# BR2_PACKAGE_QT_NOPNG is not set
BR2_PACKAGE_QT_SYSTEMPNG=y
# BR2_PACKAGE_QT_QTPNG is not set
# BR2_PACKAGE_QT_NOTIFF is not set
BR2_PACKAGE_QT_SYSTEMTIFF=y
# BR2_PACKAGE_QT_QTTIFF is not set
BR2_PACKAGE_QT_QTZLIB=y
# BR2_PACKAGE_QT_SYSTEMZLIB is not set
BR2_PACKAGE_QT_EMB_PLATFORM="arm"
BR2_PACKAGE_QT_SQL_MODULE=y
# BR2_PACKAGE_QT_MYSQL is not set
# BR2_PACKAGE_QT_IBASE is not set
# BR2_PACKAGE_QT_ODBC is not set
# BR2_PACKAGE_QT_PSQL is not set
BR2_PACKAGE_QT_SQLITE=y
# BR2_PACKAGE_QT_SQLITE2 is not set

#
# Graphics drivers
#
BR2_PACKAGE_QT_GFX_LINUXFB=y
# BR2_PACKAGE_QT_GFX_TRANSFORMED is not set
# BR2_PACKAGE_QT_GFX_QVFB is not set
# BR2_PACKAGE_QT_GFX_VNC is not set
# BR2_PACKAGE_QT_GFX_MULTISCREEN is not set

#
# Mouse drivers
#
# BR2_PACKAGE_QT_MOUSE_PC is not set
# BR2_PACKAGE_QT_MOUSE_BUS is not set
# BR2_PACKAGE_QT_MOUSE_LINUXTP is not set
# BR2_PACKAGE_QT_MOUSE_YOPY is not set
# BR2_PACKAGE_QT_MOUSE_VR41XX is not set
BR2_PACKAGE_QT_MOUSE_TSLIB=y
# BR2_PACKAGE_QT_MOUSE_QVFB is not set

#
# Keyboard drivers
#
BR2_PACKAGE_QT_KEYBOARD_TTY=y
BR2_PACKAGE_QT_KEYBOARD_USB=y
# BR2_PACKAGE_QT_KEYBOARD_SL5000 is not set
# BR2_PACKAGE_QT_KEYBOARD_YOPY is not set
# BR2_PACKAGE_QT_KEYBOARD_VR41XX is not set
# BR2_PACKAGE_QT_KEYBOARD_QVFB is not set
BR2_PACKAGE_QT_PHONON=y
BR2_PACKAGE_QT_XML=y
BR2_PACKAGE_QT_XMLPATTERNS=y
BR2_PACKAGE_QT_SVG=y
BR2_PACKAGE_QT_NETWORK=y
BR2_PACKAGE_QT_WEBKIT=y
# BR2_PACKAGE_QT_STL is not set
# BR2_PACKAGE_QT_OPENSSL is not set
BR2_PACKAGE_QT_SCRIPT=y
BR2_PACKAGE_QT_SCRIPTTOOLS=y
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
BR2_PACKAGE_ATK=y
BR2_PACKAGE_CAIRO=y
BR2_PACKAGE_CAIRO_PS=y
BR2_PACKAGE_CAIRO_PDF=y
BR2_PACKAGE_CAIRO_PNG=y
BR2_PACKAGE_CAIRO_SVG=y
BR2_PACKAGE_PANGO=y
BR2_PACKAGE_LIBDRM=y
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLIB12 is not set
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_TSLIB=y
# BR2_PACKAGE_WEBKIT is not set

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
# BR2_PACKAGE_GZIP is not set
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set
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
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
BR2_PACKAGE_LIBXML2=y
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_XERCES is not set
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
BR2_TARGET_ROOTFS_TAR_NONE=y
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_ROOTFS_TAR_COPYTO=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100507/a5751f57/attachment-0001.htm>
