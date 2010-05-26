From: Barry Bridges <barry@disignconsultants.com>
Date: Wed, 26 May 2010 08:16:39 +0100
Subject: [Buildroot] Build fails aound host-mtd-1.3.1
Message-ID: <000001cafca3$627b5880$27720980$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a build error towards the end of the build process, not 100% sure
where the failure lies but the error and few preceding lines are below with
my .config.  If I type make again it finishes the build, but I'm not sure if
the build is correct or complete.

 

Any help would be greatly received.

 

 

 

make[3]: Leaving directory
`/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi
-utils/old-utils'

rm
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubirename.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubimkvol.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubiattach.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubiupdatevol.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/mtdinfo.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubidetach.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubirmvol.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubinfo.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi-
utils/ubirsvol.o

make[2]: Leaving directory
`/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ubi
-utils'

rm
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_lock.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/nftl
_format.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/doc_
loadbios.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_erase.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/rfdd
ump.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ftl_
format.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/nand
test.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
hcp.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/nand
dump.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/ftl_
check.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_otp_info.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/nand
write.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/docf
disk.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/mtd_
debug.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_otp_dump.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/rfdf
ormat.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/nftl
dump.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_unlock.o
/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/flas
h_info.o

make[1]: Leaving directory
`/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1'

make: ***
[/home/ubi-vm/Projects/buildroot-2010.05-rc2/output/build/host-mtd-1.3.1/.st
amp_built] Error 2

 

My Config is as follows:

 

#

# Automatically generated make config: don't edit

# Tue May 25 08:09:04 2010

#

BR2_HAVE_DOT_CONFIG=y

BR2_VERSION="2010.05-rc2"

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

# BR2_arm920t is not set

# BR2_arm922t is not set

BR2_arm926t=y

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

BR2_ARM_TYPE="ARM926T"

BR2_ARM_EABI=y

# BR2_ARM_OABI is not set

BR2_ARCH="arm"

BR2_ENDIAN="LITTLE"

BR2_GCC_TARGET_TUNE="arm9tdmi"

BR2_GCC_TARGET_ARCH="armv5te"

BR2_GCC_TARGET_ABI="aapcs-linux"

 

#

# Target options

#

 

#

# Preset Devices

#

# BR2_TARGET_ARMLTD is not set

BR2_BOARD_NAME="at91sam9g45ekes"

BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"

BR2_TARGET_ATMEL=y

 

#

# Atmel AT91 Specific Device Support

#

BR2_TARGET_AT91=y

 

#

# Selection criteria

#

BR2_TARGET_ATMEL_ALL=y

 

#

# Device Selection

#

# BR2_TARGET_AT91RM9200 is not set

# BR2_TARGET_AT91SAM9260 is not set

# BR2_TARGET_AT91SAM9G20 is not set

# BR2_TARGET_AT91SAM9261 is not set

# BR2_TARGET_AT91SAM9261S is not set

# BR2_TARGET_AT91SAM9RL64 is not set

# BR2_TARGET_AT91SAM9263 is not set

# BR2_TARGET_AT91SAM9G40 is not set

BR2_TARGET_AT91SAM9G45=y

# BR2_TARGET_AT91SAM9M10 is not set

# BR2_TARGET_AT91SAM9M11 is not set

# BR2_TARGET_AT91SAM9XE is not set

# BR2_TARGET_AT572D940HF is not set

# BR2_TARGET_AT91CAP9 is not set

 

#

# Development Board Selection

#

# BR2_TARGET_AT91RM9200DF is not set

# BR2_TARGET_AT91RM9200EK is not set

# BR2_TARGET_AT91RM9200DK is not set

# BR2_TARGET_AT91SAM9260DFC is not set

# BR2_TARGET_AT91SAM9260EK is not set

# BR2_TARGET_AT91SAM9G20DFC is not set

# BR2_TARGET_AT91SAM9G20EK is not set

# BR2_TARGET_AT91SAM9XEEK is not set

# BR2_TARGET_AT91SAM9261EK is not set

# BR2_TARGET_AT91SAM9RL64EK is not set

# BR2_TARGET_AT91SAM9263EK is not set

BR2_TARGET_AT91SAM9G45EKES=y

# BR2_TARGET_AT572D940DCM is not set

# BR2_TARGET_AT91CAP9DK is not set

# BR2_TARGET_AT91CAP9ADK is not set

# BR2_TARGET_AT91_ADVANCED_INFO is not set

 

#

# Package support

#

 

#

# Secondary locations

#

BR2_AT91_LINUXPATCH_SITE="http://maxim.org.za/AT91RM9200/2.6"

BR2_TARGET_ATMEL_COPYTO="/tftpboot"

# BR2_TARGET_KWIKBYTE is not set

 

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

BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"

BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"

BR2_JLEVEL=2

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

BR2_DEFAULT_KERNEL_HEADERS="2.6.33.3"

 

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

BR2_PACKAGE_GDB=y

 

#

# Gdb debugger for the target needs WCHAR support in toolchain

#

BR2_PACKAGE_GDB_SERVER=y

BR2_PACKAGE_GDB_HOST=y

# BR2_GDB_VERSION_6_6 is not set

# BR2_GDB_VERSION_6_7_1 is not set

# BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 is not set

BR2_GDB_VERSION_6_8=y

# BR2_GDB_VERSION_7_0_1 is not set

# BR2_GDB_VERSION_7_1 is not set

BR2_GDB_VERSION="6.8"

 

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

# BR2_ELF2FLT is not set

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

# BR2_PACKAGE_LMBENCH is not set

# BR2_PACKAGE_LSOF is not set

# BR2_PACKAGE_LTRACE is not set

# BR2_PACKAGE_MEMSTAT is not set

# BR2_PACKAGE_NETPERF is not set

# BR2_PACKAGE_OPROFILE is not set

# BR2_PACKAGE_STRACE is not set

 

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

BR2_PACKAGE_GETTEXT=y

# BR2_PACKAGE_GETTEXT_STATIC is not set

BR2_PACKAGE_LIBINTL=y

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

# BR2_PACKAGE_PRBOOM is not set

 

#

# Graphic libraries and applications (graphic/text)

#

 

#

# graphic libraries

#

BR2_PACKAGE_DIRECTFB=y

BR2_PACKAGE_DIRECTFB_DEBUG=y

# BR2_PACKAGE_DIRECTFB_TRACE is not set

# BR2_PACKAGE_DIRECTFB_PXA3XX is not set

BR2_PACKAGE_DIRECTFB_LINUXINPUT=y

BR2_PACKAGE_DIRECTFB_KEYBOARD=y

# BR2_PACKAGE_DIRECTFB_PS2MOUSE is not set

# BR2_PACKAGE_DIRECTFB_SERIALMOUSE is not set

BR2_PACKAGE_DIRECTFB_TSLIB=y

BR2_PACKAGE_DIRECTFB_GIF=y

BR2_PACKAGE_DIRECTFB_JPEG=y

BR2_PACKAGE_DIRECTFB_PNG=y

# BR2_PACKAGE_DIRECTB_DITHER_RGB16 is not set

# BR2_PACKAGE_DIRECTB_TESTS is not set

BR2_PACKAGE_DIRECTFB_EXAMPLES=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE=y

BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW=y

# BR2_PACKAGE_DIVINE is not set

# BR2_PACKAGE_FBDUMP is not set

# BR2_PACKAGE_FBV is not set

# BR2_PACKAGE_IMAGEMAGICK is not set

BR2_PACKAGE_LITE=y

# BR2_PACKAGE_SAWMAN is not set

# BR2_PACKAGE_SDL is not set

 

#

# other GUIs

#

# BR2_PACKAGE_QT is not set

# BR2_PACKAGE_XORG7 is not set

 

#

# X libraries and helper libraries

#

# BR2_PACKAGE_LIBERATION is not set

 

#

# X Window managers

#

 

#

# X applications

#

# BR2_PACKAGE_GOB2 is not set

# BR2_PACKAGE_SYLPHEED is not set

 

#

# Hardware handling

#

# BR2_PACKAGE_CDRKIT is not set

# BR2_PACKAGE_CRAMFS is not set

BR2_PACKAGE_DBUS=y

BR2_DBUS_EXPAT=y

# BR2_DBUS_LIBXML2 is not set

BR2_PACKAGE_DBUS_GLIB=y

# BR2_PACKAGE_DMRAID is not set

# BR2_PACKAGE_DOSFSTOOLS is not set

BR2_PACKAGE_E2FSPROGS=y

# BR2_PACKAGE_E2FSPROGS_UTILS is not set

 

#

# e2fsprogs libraries

#

# BR2_PACKAGE_E2FSPROGS_LIBUUID is not set

# BR2_PACKAGE_E2FSPROGS_LIBBLKID is not set

# BR2_PACKAGE_EEPROG is not set

# BR2_PACKAGE_FCONFIG is not set

# BR2_PACKAGE_FIS is not set

# BR2_PACKAGE_GADGETFS_TEST is not set

# BR2_PACKAGE_GENEXT2FS is not set

# BR2_PACKAGE_GENROMFS is not set

# BR2_PACKAGE_GVFS is not set

BR2_PACKAGE_HAL=y

BR2_PACKAGE_HWDATA=y

# BR2_PACKAGE_I2C_TOOLS is not set

# BR2_PACKAGE_INPUT_TOOLS is not set

# BR2_PACKAGE_IOSTAT is not set

# BR2_PACKAGE_LM_SENSORS is not set

# BR2_PACKAGE_LVM2 is not set

# BR2_PACKAGE_MAKEDEVS is not set

# BR2_PACKAGE_MDADM is not set

# BR2_PACKAGE_MEMTESTER is not set

# BR2_PACKAGE_MTD is not set

BR2_PACKAGE_NTFS_3G=y

# BR2_PACKAGE_NTFSPROGS is not set

# BR2_PACKAGE_PCIUTILS is not set

# BR2_PACKAGE_SETSERIAL is not set

# BR2_PACKAGE_SMARTMONTOOLS is not set

# BR2_PACKAGE_SQUASHFS is not set

# BR2_PACKAGE_SYSSTAT is not set

BR2_PACKAGE_UDEV=y

BR2_PACKAGE_UDEV_VOLUME_ID=y

BR2_PACKAGE_UDEV_SCSI_ID=y

BR2_PACKAGE_USB_MODESWITCH=y

BR2_PACKAGE_USBMOUNT=y

BR2_PACKAGE_USBUTILS=y

BR2_PACKAGE_USBUTILS_ZLIB=y

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

# BR2_PACKAGE_OPENSSL is not set

 

#

# Database

#

# BR2_PACKAGE_BERKELEYDB is not set

# BR2_PACKAGE_MYSQL_CLIENT is not set

BR2_PACKAGE_SQLITE=y

# BR2_PACKAGE_SQLITE_READLINE is not set

 

#

# Filesystem

#

# BR2_PACKAGE_GAMIN is not set

# BR2_PACKAGE_LIBCONFIG is not set

# BR2_PACKAGE_LIBCONFUSE is not set

# BR2_PACKAGE_LIBFUSE is not set

BR2_PACKAGE_LIBLOCKFILE=y

# BR2_PACKAGE_LIBSYSFS is not set

 

#

# Graphics

#

# BR2_PACKAGE_ATK is not set

# BR2_PACKAGE_CAIRO is not set

# BR2_PACKAGE_FONTCONFIG is not set

BR2_PACKAGE_FREETYPE=y

BR2_PACKAGE_JPEG=y

# BR2_PACKAGE_LIBART is not set

# BR2_PACKAGE_LIBGTK2 is not set

BR2_PACKAGE_LIBPNG=y

BR2_PACKAGE_LIBUNGIF=y

# BR2_PACKAGE_PANGO is not set

# BR2_PACKAGE_PIXMAN is not set

# BR2_PACKAGE_TIFF is not set

# BR2_PACKAGE_WEBKIT is not set

 

#

# Hardware handling

#

# BR2_PACKAGE_LIBAIO is not set

# BR2_PACKAGE_LIBRAW1394 is not set

BR2_PACKAGE_TSLIB=y

BR2_PACKAGE_LIBUSB=y

BR2_PACKAGE_LIBUSB_COMPAT=y

 

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

# BR2_PACKAGE_LIBDAEMON is not set

# BR2_PACKAGE_LIBELF is not set

BR2_PACKAGE_LIBEVENT=y

# BR2_PACKAGE_LIBGLIB12 is not set

BR2_PACKAGE_LIBGLIB2=y

# BR2_PACKAGE_LIBOIL is not set

# BR2_PACKAGE_STARTUP_NOTIFICATION is not set

 

#

# Text and terminal handling

#

# BR2_PACKAGE_ENCHANT is not set

# BR2_PACKAGE_ICU is not set

BR2_PACKAGE_LIBICONV=y

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

# BR2_PACKAGE_SHARED_MIME_INFO is not set

 

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

# BR2_PACKAGE_CUPS is not set

# BR2_PACKAGE_DNSMASQ is not set

# BR2_PACKAGE_DROPBEAR is not set

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

# BR2_PACKAGE_NFS_UTILS is not set

# BR2_PACKAGE_NTP is not set

# BR2_PACKAGE_OLSR is not set

# BR2_PACKAGE_OPENNTPD is not set

# BR2_PACKAGE_OPENSSH is not set

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

BR2_PACKAGE_LOCKFILE_PROGS=y

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

# BR2_TARGET_ROOTFS_EXT2 is not set

# BR2_TARGET_ROOTFS_EXT2_NONE is not set

# BR2_TARGET_ROOTFS_EXT2_GZIP is not set

# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set

# BR2_TARGET_ROOTFS_EXT2_LZMA is not set

BR2_TARGET_ROOTFS_JFFS2=y

# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set

# BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set

# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not set

# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K is not set

BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y

# BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set

# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set

BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000

BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000

BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y

# BR2_JFFS2_TARGET_SREC is not set

# BR2_TARGET_ROOTFS_JFFS2_PAD is not set

BR2_TARGET_ROOTFS_JFFS2_LE=y

# BR2_TARGET_ROOTFS_JFFS2_BE is not set

# BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set

# BR2_TARGET_ROOTFS_UBIFS is not set

# BR2_TARGET_ROOTFS_SQUASHFS is not set

BR2_TARGET_ROOTFS_TAR=y

# BR2_TARGET_ROOTFS_TAR_NONE is not set

# BR2_TARGET_ROOTFS_TAR_GZIP is not set

BR2_TARGET_ROOTFS_TAR_BZIP2=y

# BR2_TARGET_ROOTFS_TAR_LZMA is not set

BR2_TARGET_ROOTFS_TAR_OPTIONS=""

# BR2_TARGET_ROOTFS_CPIO is not set

# BR2_TARGET_ROOTFS_INITRAMFS is not set

# BR2_TARGET_ROOTFS_ROMFS is not set

 

#

# Bootloaders

#

# BR2_TARGET_UBOOT is not set

BR2_BOOTSOURCE_DATAFLASHCARD=y

BR2_BOOTSOURCE_NANDFLASH=y

BR2_BOOTSOURCE=y

 

#

# Kernel

#

BR2_KERNEL_none=y

# BR2_KERNEL_LINUX_ADVANCED is not set

# BR2_KERNEL_LINUX is not set

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100526/f496affa/attachment-0001.html>
