From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Wed, 11 Aug 2010 15:53:11 +0530
Subject: [Buildroot] BR:Hal compile problem
Message-ID: <AANLkTinXXgYvhBj8JUdBd6Mqmpd_cBCM=Ao5ujGj+ks9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Getting the following when I select  BR2_PACKAGE_HAL=y.


/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/buildroot/output/staging -pipe -Os -mtune=arm926ej-s
-march=armv5te -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/buildroot/output/staging/usr/include -I/buildroot/output/staging/include
-I/buildroot/output/staging/lib/glib-2.0/include -Wall -Wchar-subscripts
-Wmissing-declarations -Wnested-externs -Wpointer-arith -Wcast-align
-Wsign-compare /buildroot/output/staging/usr/lib/libdbus-1.so -o
.libs/hald-probe-hiddev probe-hiddev.o logger.o
-L/buildroot/output/staging/lib -L/buildroot/output/staging/usr/lib
-L/buildroot/output/staging/usr//lib ../../../libhal/.libs/libhal.so
../../../libhal/.libs/libhal.so: undefined reference to
`bind_textdomain_codeset'
collect2: ld returned 1 exit status
make[6]: *** [hald-probe-input] Error 1
make[6]: *** Waiting for unfinished jobs....
../../../libhal/.libs/libhal.so: undefined reference to
`bind_textdomain_codeset'
collect2: ld returned 1 exit status
make[6]: *** [hald-probe-hiddev] Error 1
make[6]: Leaving directory
`/home/noy/buildroot/output/build/hal-0.5.8/hald/linux/probing'
make[5]: *** [all-recursive] Error 1
make[5]: Leaving directory
`/home/noy/buildroot/output/build/hal-0.5.8/hald/linux'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory `/home/noy/buildroot/output/build/hal-0.5.8/hald'
make[3]: *** [all] Error 2
make[3]: Leaving directory `/home/noy/buildroot/output/build/hal-0.5.8/hald'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/noy/buildroot/output/build/hal-0.5.8'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/noy/buildroot/output/build/hal-0.5.8'
make: *** [/buildroot/output/build/hal-0.5.8/hald/hald] Error 2


regards

Nataraj

# Automatically generated make config: don't edit
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm926t=y
BR2_ARM_EABI=y
BR2_TARGET_ATMEL=y
BR2_TARGET_AT91=y
BR2_TARGET_ATMEL_ALL=y
BR2_TARGET_AT91SAM9263=y
BR2_TARGET_AT91SAM9263EK=y
BR2_TARGET_AT91_ADVANCED_INFO=y
# Secondary locations
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STRIP_strip=y
BR2_OPTIMIZE_S=y
BR2_CONFIG_CACHE=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_2_6_34=y
BR2_UCLIBC_VERSION_0_9_31=y
BR2_BINUTILS_VERSION_2_20_1=y
BR2_GCC_VERSION_4_3_X=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_SHARED_LIBGCC=y
BR2_LARGEFILE=y
BR2_INET_RPC=y
BR2_ENABLE_LOCALE=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_NEEDS_GETTEXT=y
BR2_NEEDS_GETTEXT_IF_LOCALE=y
BR2_USE_WCHAR=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_PTHREADS=y
BR2_GCC_CROSS_CXX=y
BR2_INSTALL_LIBSTDCPP=y
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_17_X=y
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.17.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_CUSTOMIZE=y
BR2_PACKAGE_ALSA_LIB=y
BR2_PACKAGE_ALSA_LIB_ALOAD=y
BR2_PACKAGE_ALSA_LIB_MIXER=y
BR2_PACKAGE_ALSA_LIB_PCM=y
BR2_PACKAGE_ALSA_LIB_RAWMIDI=y
BR2_PACKAGE_ALSA_LIB_HWDEP=y
BR2_PACKAGE_ALSA_LIB_SEQ=y
BR2_PACKAGE_ALSA_LIB_ALISP=y
BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
BR2_PACKAGE_ALSA_UTILS_ALSACTL=y
BR2_PACKAGE_ALSA_UTILS_ALSAMIXER=y
BR2_PACKAGE_ALSA_UTILS_AMIXER=y
BR2_PACKAGE_ALSA_UTILS_APLAY=y
BR2_PACKAGE_ALSA_UTILS_ARECORD=y
BR2_PACKAGE_LIBMAD=y
BR2_PACKAGE_MPG123=y
BR2_PACKAGE_MPLAYER=y
BR2_PACKAGE_STRACE=y
# native toolchain needs development files in target filesystem
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_SHARED=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
BR2_PACKAGE_QT_GUI_MODULE=y
BR2_PACKAGE_QT_PIXEL_DEPTH_1=y
BR2_PACKAGE_QT_PIXEL_DEPTH_4=y
BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
BR2_PACKAGE_QT_PIXEL_DEPTH_12=y
BR2_PACKAGE_QT_PIXEL_DEPTH_15=y
BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
BR2_PACKAGE_QT_PIXEL_DEPTH_18=y
BR2_PACKAGE_QT_PIXEL_DEPTH_24=y
BR2_PACKAGE_QT_PIXEL_DEPTH_32=y
BR2_PACKAGE_QT_FONT_MICRO=y
BR2_PACKAGE_QT_FONT_FIXED=y
BR2_PACKAGE_QT_FONT_HELVETICA=y
BR2_PACKAGE_QT_FONT_UNIFONT=y
BR2_PACKAGE_QT_QTFREETYPE=y
BR2_PACKAGE_QT_GIF=y
BR2_PACKAGE_QT_LIBMNG=y
BR2_PACKAGE_QT_QTJPEG=y
BR2_PACKAGE_QT_QTPNG=y
BR2_PACKAGE_QT_QTTIFF=y
BR2_PACKAGE_QT_QTZLIB=y
BR2_PACKAGE_QT_SQL_MODULE=y
BR2_PACKAGE_QT_MYSQL=y
BR2_PACKAGE_QT_SQLITE=y
BR2_PACKAGE_QT_GFX_LINUXFB=y
BR2_PACKAGE_QT_MOUSE_LINUXINPUT=y
BR2_PACKAGE_QT_MOUSE_TSLIB=y
# Keyboard drivers
BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
BR2_PACKAGE_QT_DBUS=y
BR2_PACKAGE_QT_XML=y
BR2_PACKAGE_QT_NETWORK=y
BR2_PACKAGE_QT_JAVASCRIPTCORE=y
BR2_PACKAGE_QT_OPENSSL=y
BR2_PACKAGE_QT_SCRIPT=y
BR2_PACKAGE_DBUS=y
BR2_DBUS_EXPAT=y
BR2_PACKAGE_DBUS_GLIB=y
BR2_PACKAGE_HAL=y
BR2_PACKAGE_HOTPLUG=y
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_QT_KEYBOARD_LINUXINPUT=y
BR2_PACKAGE_QT_DBUS=y
BR2_PACKAGE_QT_XML=y
BR2_PACKAGE_QT_NETWORK=y
BR2_PACKAGE_QT_JAVASCRIPTCORE=y
BR2_PACKAGE_QT_OPENSSL=y
BR2_PACKAGE_QT_SCRIPT=y
BR2_PACKAGE_DBUS=y
BR2_DBUS_EXPAT=y
BR2_PACKAGE_DBUS_GLIB=y
BR2_PACKAGE_HAL=y
BR2_PACKAGE_HOTPLUG=y
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_UDEV_UTILS=y
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_UDEV_SCSI_ID=y
BR2_PACKAGE_UDEV_PATH_ID=y
BR2_PACKAGE_UDEV_FIRMWARE_SH=y
BR2_PACKAGE_MICROPERL=y
BR2_PACKAGE_ZLIB=y
# Crypto
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_MYSQL_CLIENT=y
BR2_PACKAGE_SQLITE=y
# Filesystem
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_TSLIB=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y
BR2_PACKAGE_LIBPCAP=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
BR2_PACKAGE_NCURSES_TARGET_MENU=y
BR2_PACKAGE_PCRE=y
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_EXPAT=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_PORTMAP=y
BR2_PACKAGE_PPPD=y
BR2_PACKAGE_PPPD_FILTER=y
# System tools
# Target filesystem options
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_NONE=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
BR2_TARGET_ROOTFS_JFFS2_LE=y
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100811/ebcd05c5/attachment-0001.html>
