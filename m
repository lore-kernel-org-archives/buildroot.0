From: Holger <ltsp@webers-web.net>
Date: Tue, 01 Jun 2010 17:44:01 +0200
Subject: [Buildroot] libxml2 / gzopen64
Message-ID: <1275407041.2737.13.camel@HellDesk.zuhause.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I use the latest GIT version of buildroot and get the follwing
error.


>>> host-xlib_libXfont 1.4.1 Building
.....
.....
.....

make[3]: Entering directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
  GEN    doc/fontlib.html
  GEN    doc/fontlib.txt
xmlto: /home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/./doc/fontlib.xml does not validate (status 127)
xmlto: Fix document syntax or use --skip-validation option
/usr/bin/xmllint: /home/holger/src/buildroot/output/host/usr/lib/libz.so.1: no version information available (required by /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2)
/usr/bin/xmllint: symbol lookup
error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
undefined symbol: gzopen64
make[3]: *** [doc/fontlib.txt] Fehler 137
make[3]: *** Warte auf noch nicht beendete Prozesse...
xmlto: /home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/./doc/fontlib.xml does not validate (status 127)
xmlto: Fix document syntax or use --skip-validation option
/usr/bin/xmllint: /home/holger/src/buildroot/output/host/usr/lib/libz.so.1: no version information available (required by /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2)
/usr/bin/xmllint: symbol lookup
error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
undefined symbol: gzopen64
make[3]: *** [doc/fontlib.html] Fehler 137
make[3]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make: ***
[/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/.stamp_built] Fehler 2



Any ideas?

thx Holger

------------ .config ----------------------------------------

#
# Automatically generated make config: don't edit
# Mon May 31 20:17:45 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.05"
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
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_x86_i386 is not set
# BR2_x86_i486 is not set
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
BR2_x86_geode=y
# BR2_x86_c3 is not set
# BR2_x86_winchip_c6 is not set
# BR2_x86_winchip2 is not set
BR2_ARCH="i586"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="geode"
BR2_GCC_TARGET_ARCH="geode"

#
# Target options
#

#
# Preset Devices
#
# BR2_TARGET_X86 is not set
BR2_TARGET_GENERIC_HOSTNAME="TinyHell"
BR2_TARGET_GENERIC_ISSUE="Welcome to Embedded Hell!"
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

#
# Commands
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
BR2_STAGING_DIR="$(BASE_DIR)/staging"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
# BR2_DEPRECATED is not set
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
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set

#
# Advanced
#
BR2_CONFIG_CACHE=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
# BR2_KERNEL_HEADERS_2_6_30 is not set
# BR2_KERNEL_HEADERS_2_6_31 is not set
# BR2_KERNEL_HEADERS_2_6_32 is not set
BR2_KERNEL_HEADERS_2_6_33=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.33.5"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_31=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
# BR2_BINUTILS_VERSION_2_19_1 is not set
# BR2_BINUTILS_VERSION_2_20 is not set
BR2_BINUTILS_VERSION_2_20_1=y
BR2_BINUTILS_VERSION="2.20.1"
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
BR2_GCC_VERSION_4_3_4=y
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_SYSROOT=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.4"
BR2_TOOLCHAIN_SYSROOT=y
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_LIBGCJ is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_SHARED_LIBGCC=y
BR2_GCC_ENABLE_TLS=y

#
# Ccache Options
#
# BR2_CCACHE is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set

#
# Gdb debugger for the target needs WCHAR support in toolchain
#
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
BR2_USE_WCHAR=y
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
BR2_BUSYBOX_VERSION="1.16.1"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_BUSYBOX_SKELETON is not set
# BR2_PACKAGE_CUSTOMIZE is not set

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
# BR2_PACKAGE_FESTIVAL is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_LZMA is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set

#
# lmbench requires a toolchain with RPC support
#

#
# lsof requires a toolchain with RPC support
#
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_VALGRIND is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FLEX is not set

#
# native toolchain needs development files in target filesystem
#
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_INTLTOOL is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
# BR2_PACKAGE_PKG_CONFIG is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_LXDOOM is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
BR2_PACKAGE_QT=y
# BR2_PACKAGE_QT_DEBUG is not set
BR2_PACKAGE_QT_SHARED=y
# BR2_PACKAGE_QT_STATIC is not set
BR2_PACKAGE_QT_LICENSE_APPROVED=y
# BR2_PACKAGE_QT_QT3SUPPORT is not set
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
# BR2_PACKAGE_QT_FONT_UNIFONT is not set
BR2_PACKAGE_QT_NOFREETYPE=y
# BR2_PACKAGE_QT_QTFREETYPE is not set
# BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
BR2_PACKAGE_QT_GIF=y
BR2_PACKAGE_QT_LIBMNG=y
# BR2_PACKAGE_QT_NOJPEG is not set
# BR2_PACKAGE_QT_SYSTEMJPEG is not set
BR2_PACKAGE_QT_QTJPEG=y
# BR2_PACKAGE_QT_NOPNG is not set
# BR2_PACKAGE_QT_SYSTEMPNG is not set
BR2_PACKAGE_QT_QTPNG=y
BR2_PACKAGE_QT_NOTIFF=y
# BR2_PACKAGE_QT_SYSTEMTIFF is not set
# BR2_PACKAGE_QT_QTTIFF is not set
BR2_PACKAGE_QT_QTZLIB=y
# BR2_PACKAGE_QT_SYSTEMZLIB is not set
BR2_PACKAGE_QT_EMB_PLATFORM="x86"
# BR2_PACKAGE_QT_SQL_MODULE is not set

#
# Graphics drivers
#
BR2_PACKAGE_QT_GFX_LINUXFB=y
# BR2_PACKAGE_QT_GFX_TRANSFORMED is not set
BR2_PACKAGE_QT_GFX_QVFB=y
# BR2_PACKAGE_QT_GFX_VNC is not set
# BR2_PACKAGE_QT_GFX_MULTISCREEN is not set

#
# directfb Qt driver not available (need directfb)
#

#
# Mouse drivers
#
BR2_PACKAGE_QT_MOUSE_PC=y
# BR2_PACKAGE_QT_MOUSE_LINUXTP is not set
# BR2_PACKAGE_QT_MOUSE_LINUXINPUT is not set
# BR2_PACKAGE_QT_MOUSE_TSLIB is not set
BR2_PACKAGE_QT_MOUSE_QVFB=y

#
# Keyboard drivers
#
# BR2_PACKAGE_QT_KEYBOARD_TTY is not set
BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
# BR2_PACKAGE_QT_KEYBOARD_QVFB is not set

#
# Phonon module needs gstreamer
#

#
# Qt DBbus module not available (need dbus)
#
# BR2_PACKAGE_QT_XML is not set
# BR2_PACKAGE_QT_MULTIMEDIA is not set
# BR2_PACKAGE_QT_SVG is not set
BR2_PACKAGE_QT_NETWORK=y
# BR2_PACKAGE_QT_WEBKIT is not set
# BR2_PACKAGE_QT_JAVASCRIPTCORE is not set
# BR2_PACKAGE_QT_STL is not set
# BR2_PACKAGE_QT_OPENSSL is not set
# BR2_PACKAGE_QT_SCRIPT is not set
BR2_PACKAGE_XORG7=y
# BR2_PACKAGE_XSERVER_xorg is not set
BR2_PACKAGE_XSERVER_tinyx=y
BR2_X11_PREFIX="/usr"

#
# X11R7 Servers
#
BR2_PACKAGE_XSERVER_XORG_SERVER=y
# BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR is not set
# BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX is not set

#
# X11R7 Libraries
#
BR2_PACKAGE_LIBXCB=y
# BR2_PACKAGE_MESA3D is not set
BR2_PACKAGE_PTHREAD_STUBS=y
# BR2_PACKAGE_XCB_UTIL is not set
# BR2_PACKAGE_XLIB_LIBFS is not set
BR2_PACKAGE_XLIB_LIBICE=y
BR2_PACKAGE_XLIB_LIBSM=y
BR2_PACKAGE_XLIB_LIBX11=y
# BR2_PACKAGE_XLIB_LIBXSCRNSAVER is not set
BR2_PACKAGE_XLIB_LIBXAU=y
# BR2_PACKAGE_XLIB_LIBXAW is not set
# BR2_PACKAGE_XLIB_LIBXCOMPOSITE is not set
BR2_PACKAGE_XLIB_LIBXCURSOR=y
BR2_PACKAGE_XLIB_LIBXDAMAGE=y
BR2_PACKAGE_XLIB_LIBXDMCP=y
BR2_PACKAGE_XLIB_LIBXEXT=y
BR2_PACKAGE_XLIB_LIBXFIXES=y
BR2_PACKAGE_XLIB_LIBXFONT=y
# BR2_PACKAGE_XLIB_LIBXFONTCACHE is not set
BR2_PACKAGE_XLIB_LIBXFT=y
BR2_PACKAGE_XLIB_LIBXI=y
BR2_PACKAGE_XLIB_LIBXINERAMA=y
BR2_PACKAGE_XLIB_LIBXMU=y
# BR2_PACKAGE_XLIB_LIBXP is not set
# BR2_PACKAGE_XLIB_LIBXPM is not set
# BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL is not set
# BR2_PACKAGE_XLIB_LIBXPRINTUTIL is not set
BR2_PACKAGE_XLIB_LIBXRANDR=y
BR2_PACKAGE_XLIB_LIBXRENDER=y
BR2_PACKAGE_XLIB_LIBXRES=y
BR2_PACKAGE_XLIB_LIBXT=y
# BR2_PACKAGE_XLIB_LIBXTST is not set
# BR2_PACKAGE_XLIB_LIBXV is not set
# BR2_PACKAGE_XLIB_LIBXVMC is not set
# BR2_PACKAGE_XLIB_LIBXXF86DGA is not set
BR2_PACKAGE_XLIB_LIBXXF86VM=y
# BR2_PACKAGE_XLIB_LIBDMX is not set
BR2_PACKAGE_XLIB_LIBFONTENC=y
# BR2_PACKAGE_XLIB_LIBOLDX is not set
BR2_PACKAGE_XLIB_LIBXKBFILE=y
# BR2_PACKAGE_XLIB_LIBXKBUI is not set
BR2_PACKAGE_XLIB_XTRANS=y
BR2_PACKAGE_XLIB_LIBPCIACCESS=y

#
# X11R7 Applications
#
# BR2_PACKAGE_XAPP_APPRES is not set
# BR2_PACKAGE_XAPP_BDFTOPCF is not set
# BR2_PACKAGE_XAPP_BEFORELIGHT is not set
# BR2_PACKAGE_XAPP_BITMAP is not set
# BR2_PACKAGE_XAPP_EDITRES is not set
# BR2_PACKAGE_XAPP_FONTTOSFNT is not set
# BR2_PACKAGE_XAPP_FSLSFONTS is not set
# BR2_PACKAGE_XAPP_FSTOBDF is not set
# BR2_PACKAGE_XAPP_ICEAUTH is not set
# BR2_PACKAGE_XAPP_ICO is not set
# BR2_PACKAGE_XAPP_LISTRES is not set
# BR2_PACKAGE_XAPP_LUIT is not set
# BR2_PACKAGE_XAPP_MKFONTDIR is not set
# BR2_PACKAGE_XAPP_MKFONTSCALE is not set
# BR2_PACKAGE_XAPP_OCLOCK is not set
# BR2_PACKAGE_XAPP_RGB is not set
# BR2_PACKAGE_XAPP_RSTART is not set
# BR2_PACKAGE_XAPP_SCRIPTS is not set
# BR2_PACKAGE_XAPP_SESSREG is not set
# BR2_PACKAGE_XAPP_SETXKBMAP is not set
# BR2_PACKAGE_XAPP_SHOWFONT is not set
# BR2_PACKAGE_XAPP_SMPROXY is not set
# BR2_PACKAGE_XAPP_TWM is not set
# BR2_PACKAGE_XAPP_VIEWRES is not set
# BR2_PACKAGE_XAPP_X11PERF is not set
# BR2_PACKAGE_XAPP_XAUTH is not set
# BR2_PACKAGE_XAPP_XBACKLIGHT is not set
# BR2_PACKAGE_XAPP_XBIFF is not set
# BR2_PACKAGE_XAPP_XCALC is not set
# BR2_PACKAGE_XAPP_XCLIPBOARD is not set
# BR2_PACKAGE_XAPP_XCLOCK is not set
# BR2_PACKAGE_XAPP_XCMSDB is not set
# BR2_PACKAGE_XAPP_XCURSORGEN is not set
# BR2_PACKAGE_XAPP_XDBEDIZZY is not set
# BR2_PACKAGE_XAPP_XDITVIEW is not set
# BR2_PACKAGE_XAPP_XDM is not set
# BR2_PACKAGE_XAPP_XDPYINFO is not set
# BR2_PACKAGE_XAPP_XEDIT is not set
# BR2_PACKAGE_XAPP_XEV is not set
# BR2_PACKAGE_XAPP_XEYES is not set
# BR2_PACKAGE_XAPP_XF86DGA is not set
# BR2_PACKAGE_XAPP_XFD is not set
# BR2_PACKAGE_XAPP_XFONTSEL is not set
# BR2_PACKAGE_XAPP_XFS is not set
# BR2_PACKAGE_XAPP_XFSINFO is not set
# BR2_PACKAGE_XAPP_XGAMMA is not set
# BR2_PACKAGE_XAPP_XGC is not set
# BR2_PACKAGE_XAPP_XHOST is not set
# BR2_PACKAGE_XAPP_XINIT is not set
# BR2_PACKAGE_XAPP_XINPUT is not set
# BR2_PACKAGE_XAPP_XKBCOMP is not set
# BR2_PACKAGE_XAPP_XKBEVD is not set
# BR2_PACKAGE_XAPP_XKBPRINT is not set
# BR2_PACKAGE_XAPP_XKBUTILS is not set
# BR2_PACKAGE_XAPP_XKILL is not set
# BR2_PACKAGE_XAPP_XLOAD is not set
# BR2_PACKAGE_XAPP_XLOGO is not set
# BR2_PACKAGE_XAPP_XLSATOMS is not set
# BR2_PACKAGE_XAPP_XLSCLIENTS is not set
# BR2_PACKAGE_XAPP_XLSFONTS is not set
# BR2_PACKAGE_XAPP_XMAG is not set
# BR2_PACKAGE_XAPP_XMAN is not set
# BR2_PACKAGE_XAPP_XMESSAGE is not set
# BR2_PACKAGE_XAPP_XMH is not set
# BR2_PACKAGE_XAPP_XMODMAP is not set
# BR2_PACKAGE_XAPP_XMORE is not set
# BR2_PACKAGE_XAPP_XPLSPRINTERS is not set
# BR2_PACKAGE_XAPP_XPR is not set
# BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST is not set
# BR2_PACKAGE_XAPP_XPROP is not set
# BR2_PACKAGE_XAPP_XRANDR is not set
# BR2_PACKAGE_XAPP_XRDB is not set
# BR2_PACKAGE_XAPP_XREFRESH is not set
# BR2_PACKAGE_XAPP_XSET is not set
# BR2_PACKAGE_XAPP_XSETMODE is not set
# BR2_PACKAGE_XAPP_XSETPOINTER is not set
# BR2_PACKAGE_XAPP_XSETROOT is not set
# BR2_PACKAGE_XAPP_XSM is not set
# BR2_PACKAGE_XAPP_XSTDCMAP is not set
# BR2_PACKAGE_XAPP_XVIDTUNE is not set
# BR2_PACKAGE_XAPP_XVINFO is not set
# BR2_PACKAGE_XAPP_XWD is not set
# BR2_PACKAGE_XAPP_XWININFO is not set
# BR2_PACKAGE_XAPP_XWUD is not set

#
# X11R7 Fonts
#
# BR2_PACKAGE_XFONT_FONT_UTIL is not set
BR2_PACKAGE_XFONT_ENCODINGS=y
BR2_PACKAGE_XFONT_FONT_ADOBE_100DPI=y
BR2_PACKAGE_XFONT_FONT_ADOBE_75DPI=y
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_ADOBE_UTOPIA_TYPE1 is not set
BR2_PACKAGE_XFONT_FONT_ALIAS=y
# BR2_PACKAGE_XFONT_FONT_ARABIC_MISC is not set
# BR2_PACKAGE_XFONT_FONT_BH_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BH_TTF is not set
# BR2_PACKAGE_XFONT_FONT_BH_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_100DPI is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_75DPI is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_SPEEDO is not set
# BR2_PACKAGE_XFONT_FONT_BITSTREAM_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_CRONYX_CYRILLIC is not set
BR2_PACKAGE_XFONT_FONT_CURSOR_MISC=y
# BR2_PACKAGE_XFONT_FONT_DAEWOO_MISC is not set
# BR2_PACKAGE_XFONT_FONT_DEC_MISC is not set
# BR2_PACKAGE_XFONT_FONT_IBM_TYPE1 is not set
# BR2_PACKAGE_XFONT_FONT_ISAS_MISC is not set
# BR2_PACKAGE_XFONT_FONT_JIS_MISC is not set
# BR2_PACKAGE_XFONT_FONT_MICRO_MISC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_ETHIOPIC is not set
# BR2_PACKAGE_XFONT_FONT_MISC_MELTHO is not set
BR2_PACKAGE_XFONT_FONT_MISC_MISC=y
# BR2_PACKAGE_XFONT_FONT_MUTT_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SCHUMACHER_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SCREEN_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_SONY_MISC is not set
# BR2_PACKAGE_XFONT_FONT_SUN_MISC is not set
# BR2_PACKAGE_XFONT_FONT_WINITZKI_CYRILLIC is not set
# BR2_PACKAGE_XFONT_FONT_XFREE86_TYPE1 is not set

#
# X11R7 X protocols
#
BR2_PACKAGE_XCB_PROTO=y
# BR2_PACKAGE_XPROTO_APPLEWMPROTO is not set
BR2_PACKAGE_XPROTO_BIGREQSPROTO=y
BR2_PACKAGE_XPROTO_COMPOSITEPROTO=y
BR2_PACKAGE_XPROTO_DAMAGEPROTO=y
# BR2_PACKAGE_XPROTO_DMXPROTO is not set
BR2_PACKAGE_XPROTO_DRI2PROTO=y
BR2_PACKAGE_XPROTO_FIXESPROTO=y
BR2_PACKAGE_XPROTO_FONTCACHEPROTO=y
BR2_PACKAGE_XPROTO_FONTSPROTO=y
BR2_PACKAGE_XPROTO_GLPROTO=y
BR2_PACKAGE_XPROTO_INPUTPROTO=y
BR2_PACKAGE_XPROTO_KBPROTO=y
# BR2_PACKAGE_XPROTO_PRINTPROTO is not set
BR2_PACKAGE_XPROTO_RANDRPROTO=y
# BR2_PACKAGE_XPROTO_RECORDPROTO is not set
BR2_PACKAGE_XPROTO_RENDERPROTO=y
BR2_PACKAGE_XPROTO_RESOURCEPROTO=y
# BR2_PACKAGE_XPROTO_SCRNSAVERPROTO is not set
BR2_PACKAGE_XPROTO_VIDEOPROTO=y
# BR2_PACKAGE_XPROTO_WINDOWSWMPROTO is not set
BR2_PACKAGE_XPROTO_XCMISCPROTO=y
BR2_PACKAGE_XPROTO_XEXTPROTO=y
BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO=y
BR2_PACKAGE_XPROTO_XF86DGAPROTO=y
# BR2_PACKAGE_XPROTO_XF86DRIPROTO is not set
BR2_PACKAGE_XPROTO_XF86RUSHPROTO=y
BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO=y
BR2_PACKAGE_XPROTO_XINERAMAPROTO=y
BR2_PACKAGE_XPROTO_XPROTO=y

#
# X11R7 Utilities
#
# BR2_PACKAGE_XUTIL_MAKEDEPEND is not set
BR2_PACKAGE_XUTIL_UTIL_MACROS=y
BR2_PACKAGE_MCOOKIE=y

#
# X11R7 Other data
#
BR2_PACKAGE_XDATA_XBITMAPS=y
# BR2_PACKAGE_XDATA_XCURSOR_THEMES is not set
# BR2_PACKAGE_XKEYBOARD_CONFIG is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_LIBERATION is not set

#
# X Window managers
#
# BR2_PACKAGE_MATCHBOX is not set
# BR2_PACKAGE_BLACKBOX is not set

#
# X applications
#
# BR2_PACKAGE_DILLO is not set
# BR2_PACKAGE_DOCKER is not set
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_MIDORI is not set
# BR2_PACKAGE_RDESKTOP is not set
# BR2_PACKAGE_RXVT is not set
# BR2_PACKAGE_SYNERGY is not set
# BR2_PACKAGE_TORSMO is not set
# BR2_PACKAGE_X11VNC is not set
# BR2_PACKAGE_XSTROKE is not set
# BR2_PACKAGE_XVKBD is not set

#
# Hardware handling
#
# BR2_PACKAGE_ACPID is not set
# BR2_PACKAGE_CDRKIT is not set
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DMRAID is not set
# BR2_PACKAGE_DOSFSTOOLS is not set
# BR2_PACKAGE_E2FSPROGS is not set
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GVFS is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set
# BR2_PACKAGE_NTFS_3G is not set
# BR2_PACKAGE_NTFSPROGS is not set
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PCMCIA is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_SQUASHFS is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PHP is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FLTK is not set
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBDRM=y
# BR2_PACKAGE_LIBGTK12 is not set
# BR2_PACKAGE_LIBGTK2 is not set
BR2_PACKAGE_LIBPNG=y
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_PANGO is not set
BR2_PACKAGE_PIXMAN=y
# BR2_PACKAGE_TIFF is not set

#
# Hardware handling
#
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBUSB is not set

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set

#
# Other
#
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
BR2_PACKAGE_LIBDAEMON=y
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGLIB12 is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_LIBICONV is not set
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# XML
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_XERCES is not set

#
# Miscellaneous
#
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BIND is not set

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_ETHTOOL is not set
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
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
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
# BR2_PACKAGE_SQUID is not set
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
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_WHICH is not set

#
# System tools
#

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_ISO9660 is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
BR2_TARGET_GRUB=y
# BR2_TARGET_GRUB_SPLASH is not set
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
# BR2_KERNEL_LINUX_ADVANCED is not set
BR2_KERNEL_LINUX=y
BR2_PACKAGE_LINUX=y
BR2_PACKAGE_LINUX_KCONFIG="kernel.config"
BR2_PACKAGE_LINUX_FORMAT=""

Am Montag, den 31.05.2010, 23:24 +0200 schrieb Thomas Petazzoni:
> On Mon, 31 May 2010 20:48:45 +0200
> Holger <ltsp@webers-web.net> wrote:
> 
> > Any ideas?
> 
> Which version of Buildroot ? Can you post your .config ?
> 
> Thomas
