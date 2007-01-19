From: Claus Klein <claus.klein@arcormail.de>
Date: Fri, 19 Jan 2007 22:49:57 +0100
Subject: [Buildroot]
	buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info:
	build error
Message-ID: <200701192249.57232.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I got a Warning: `makeinfo' is missing on your system. 
	and the make failed?

Is this a known problem?

Best Regards,

Claus


PS: This is my configuration based on the current defconfig file:

claus at P3linux:~/src/buildroot> LANG=C svn info
Path: .
URL: svn://uclibc.org/trunk/buildroot
Repository Root: svn://uclibc.org
Repository UUID: 69ca8d6d-28ef-0310-b511-8ec308f3f277
Revision: 17384
Node Kind: directory
Schedule: normal
Last Changed Author: aldot
Last Changed Rev: 17384
Last Changed Date: 2007-01-19 19:00:49 +0100 (Fri, 19 Jan 2007)
Properties Last Updated: 2007-01-16 23:06:55 +0100 (Tue, 16 Jan 2007)

claus at P3linux:~/src/buildroot> uname -a
Linux P3linux 2.6.16.21-0.25-default #1 Tue Sep 19 07:26:15 UTC 2006 i686 i686 i386 GNU/Linux
claus at P3linux:~/src/buildroot>

claus at P3linux:~/src/buildroot> grep '^[^#]' .config
BR2_HAVE_DOT_CONFIG=y
BR2_i386=y
BR2_x86_i686=y
BR2_ARCH="i686"
BR2_ENDIAN="LITTLE"
BR2_WGET="wget --passive-ftp"
BR2_SVN="svn co"
BR2_ZCAT="zcat"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_STAGING_DIR="/tools/Linuxi386CDK"
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_2_6_11=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.11"
BR2_UCLIBC_VERSION_SNAPSHOT=y
BR2_USE_UCLIBC_SNAPSHOT="snapshot"
BR2_PTHREADS_OLD=y
BR2_BINUTILS_VERSION_2_16_91_0_7=y
BR2_BINUTILS_VERSION="2.16.91.0.7"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
BR2_GCC_VERSION_3_4_2=y
BR2_GCC_VERSION="3.4.2"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_CCACHE=y
BR2_ENABLE_MULTILIB=y
BR2_LARGEFILE=y
BR2_TARGET_OPTIMIZATION="-Os -pipe"
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_2_2_1=y
BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
BR2_PACKAGE_BUSYBOX_CONFIG="target/device/x86/i386/busybox.config"
BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_CUSTOMIZE=y
BR2_PACKAGE_FILE=y
BR2_PACKAGE_IOSTAT=y
BR2_PACKAGE_LSOF=y
BR2_PACKAGE_LZO=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_SUDO=y
BR2_NETWORK_SUPPORT=y
BR2_PACKAGE_BIND=y
BR2_PACKAGE_BRIDGE=y
BR2_PACKAGE_IPROUTE2=y
BR2_PACKAGE_IPTABLES=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_PORTMAP=y
BR2_PACKAGE_RSYNC=y
BR2_PACKAGE_VTUN=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
BR2_TARGET_ROOTFS_EXT2_NONE=y
BR2_TARGET_ROOTFS_EXT2_COPYTO=""
claus at P3linux:~/src/buildroot>   

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .errors.log
Type: text/x-log
Size: 5138 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070119/34925cdc/attachment.bin 
