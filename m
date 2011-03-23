From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 23 Mar 2011 19:27:35 +0000
Subject: [Buildroot] proc not mouning
In-Reply-To: <1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
	<4D88FFC6.1010404@michaelburghart.de>
	<20110322200337.GB8662@tarshish>
	<4D8904BF.5060503@michaelburghart.de>
	<4D898F3C.8010603@michaelburghart.de>
	<20110323171608.GC3225@nataf.siach.name>
	<1D6034426110564DA0DEA9EE9793B383581774296C@NBE-MBX01.americas.swk.pri>
Message-ID: <AANLkTinJnfoOiYiC2bS-u5TCVvRniZsNbT36NJfTkpg-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Could it be something you changed in:
<package selection for the target>
------------<tick> show packages provided by busybox
--------------System tools ?




This is my attempt to run a "empty but functional" build whilst trouble
shooting a python "readline" issue.....dunno if it'll help to compare it.


BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm926t=y
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=2
BR2_STRIP_strip=y
BR2_OPTIMIZE_0=y
BR2_HAVE_DEVFILES=y
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="2.6.38-rc5"
BR2_DEFAULT_KERNEL_HEADERS="2.6.38-rc5"
BR2_UCLIBC_VERSION_0_9_31=y
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.32.config"
BR2_BINUTILS_VERSION_2_21=y
BR2_BINUTILS_VERSION="2.21"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_5_X=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.5.2"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_CROSS_OBJC=y
BR2_INSTALL_OBJC=y
BR2_GCC_SHARED_LIBGCC=y
BR2_PACKAGE_GDB_SERVER=y
BR2_GDB_VERSION_6_8=y
BR2_GDB_VERSION="6.8"
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_ENABLE_LOCALE=y
BR2_PROGRAM_INVOCATION=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_NEEDS_GETTEXT=y
BR2_NEEDS_GETTEXT_IF_LOCALE=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
BR2_PTHREADS_OLD=y
BR2_MKLIBS=y
BR2_TARGET_GENERIC_HOSTNAME="vx-200"
BR2_TARGET_GENERIC_ISSUE="Veritrack Fleet Management (2011)"
BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_18_X=y
BR2_BUSYBOX_VERSION="1.18.4"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.18.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_GREP=y
BR2_PACKAGE_DBUS=y
BR2_DBUS_EXPAT=y
BR2_PACKAGE_DBUS_GLIB=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_LIBUUID=y
BR2_PACKAGE_E2FSPROGS_LIBBLKID=y
BR2_PACKAGE_GPSD=y
BR2_PACKAGE_GPSD_DEVICES="/dev/ttyS4"
BR2_PACKAGE_GPSD_NTP_SHM=y
BR2_PACKAGE_GPSD_PPS=y
BR2_PACKAGE_GPSD_PPS_ON_CTS=y
BR2_PACKAGE_GPSD_RECONFIGURE=y
BR2_PACKAGE_GPSD_CONTROLSEND=y
BR2_PACKAGE_GPSD_RAW=y
BR2_PACKAGE_GPSD_SQUELCH=y
BR2_PACKAGE_GPSD_NMEA=y
BR2_PACKAGE_GPSD_SIRF=y
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_I2C_TOOLS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDTEST=y
BR2_PACKAGE_MTD_NANDWRITE=y
BR2_PACKAGE_MTD_MTDINFO=y
BR2_PACKAGE_MTD_UBIATTACH=y
BR2_PACKAGE_MTD_UBICRC32=y
BR2_PACKAGE_MTD_UBIDETACH=y
BR2_PACKAGE_MTD_UBIFORMAT=y
BR2_PACKAGE_MTD_UBIMKVOL=y
BR2_PACKAGE_MTD_UBINFO=y
BR2_PACKAGE_MTD_UBINIZE=y
BR2_PACKAGE_MTD_UBIRENAME=y
BR2_PACKAGE_MTD_UBIRMVOL=y
BR2_PACKAGE_MTD_UBIRSVOL=y
BR2_PACKAGE_MTD_UBIUPDATEVOL=y
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_UDEV_UTILS=y
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PYC_ONLY=y
BR2_PACKAGE_PYTHON_READLINE=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBLOCKFILE=y
BR2_PACKAGE_LIBPCAP=y
BR2_PACKAGE_LIBFFI=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_POPT=y
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_EXPAT=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_FILE=y
BR2_PACKAGE_LOCKFILE_PROGS=y
BR2_PACKAGE_WHICH=y
BR2_PACKAGE_BOOTUTILS=y
BR2_PACKAGE_MODULE_INIT_TOOLS=y
BR2_PACKAGE_PSMISC=y
BR2_PACKAGE_SYSKLOGD=y
BR2_PACKAGE_SYSVINIT=y
BR2_PACKAGE_UTIL-LINUX=y
BR2_PACKAGE_LESS=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_NONE=y
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_ROOTFS_ROMFS=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.38-rc5"
BR2_LINUX_KERNEL_VERSION="2.6.38-rc5"
BR2_LINUX_KERNEL_PATCH="linux/kernel-patches/linux-2.6.38-rc5-0001.patch
linux/kernel-patches/linux-2.6.38-rc5-0002.patch
linux/kernel-patches/linux-2.6.38-rc5-0003.patch
linux/kernel-patches/linux-2.6.38-rc5-0004.patch
linux/kernel-patches/linux-2.6.38-rc5-0005.patch
linux/kernel-patches/linux-2.6.38-rc5-0006.patch
linux/kernel-patches/linux-2.6.38-rc5-0007.patch"
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
BR2_LINUX_KERNEL_DEFCONFIG="telit_ge863"
BR2_LINUX_KERNEL_UIMAGE=y





On Wed, Mar 23, 2011 at 7:02 PM, Heyendal, Carl
<CHeyendal@stanleyworks.com>wrote:

> Hi,
>
> I've done something bad to my Buildroot platform, but I can't figure out
> what the problem is.
>
> When the initramfs system switches over to the root filesystem on an SD
> Card created by Buildroot,
> it can't find /dev/null, and can't mount /proc.
>
> When I login the /proc directory is not mounted, but I can manually mount
> it however from the command
> line.
>
> My inittab contains a statement to mount proc as well as another statement
> to do a 'mount -a'.
> I verified that fstab contains an entry for proc. I know something is
> processing inittab because
> the boot scripts that inittab calls do run.
>
> I even added an entry in inittab to 'mknod' /dev/null.
>
> I'm really stumped by this. I even did a clean rebuild without any luck.
>
> Output below. Appreciate any help.
>
> thanx
> /carl h.
>
>
> mmc0: host does not support reading read-only switch. assuming
> write-enable.
> mmc0: new SD card at address aaaa
> mmcblk0: mmc0:aaaa SD02G 1.84 GiB
>  mmcblk0: p1
> EXT3-fs: barriers not enabled
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs (mmcblk0p1): using internal journal
> EXT3-fs (mmcblk0p1): recovery complete
> EXT3-fs (mmcblk0p1): mounted filesystem with ordered data mode
> Switching to filesystem on SD card....
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> grep: /proc/mounts: No such file or directory
> grep: /proc/mounts: No such file or directory
> Populating /dev using udev: /etc/init.d/S10udev: line 82: can't create
> /proc/sys/kernel/hotplug: nonexistent directory
> done
> Starting portmap: done
> Initializing random number generator... done.
> Starting network...
> ifup: interface lo already configured
> ifup: interface eth0 already configured
> Starting ProFTPD: warning: `proftpd' uses 32-bit capabilities (legacy
> support in use)
>  - warning: unable to determine IP address of '_none_'
>  - error: no valid servers configured
>  - Fatal: error processing configuration file '/etc/proftpd.conf'
> FAILED
> Starting sshd: OK
>
> Welcome to Buildroot
> (none) login:
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110323/ce0f197e/attachment-0001.html>
