From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 09:06:13 +0000 (UTC)
Subject: [Buildroot] [Bug 4231] libneon.so: undefined reference to
	`SSL_SESSION_cmp'
In-Reply-To: <bug-4231-163@https.bugs.busybox.net/>
References: <bug-4231-163@https.bugs.busybox.net/>
Message-ID: <20110923090613.CB3278D9E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4231

--- Comment #3 from marco <marco_cantu_ranzani@libero.it>  ---
#
# Automatically generated make config: don't edit
# Buildroot 2011.11-git Configuration
# Fri Sep 23 10:54:57 2011
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm920t=y
# ...

BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=8
# BR2_CCACHE is not set
BR2_DEPRECATED=y
# BR2_ENABLE_DEBUG is not set
# BR2_STRIP_strip is not set
# BR2_STRIP_sstrip is not set
BR2_STRIP_none=y
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_CTNG is not set


#...

BR2_PACKAGE_QT_OPENSSL=y
BR2_PACKAGE_PHP_EXT_OPENSSL=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_OPENSSL_BIN=y
BR2_PACKAGE_OPENSSL_ENGINES=y
BR2_PACKAGE_OPENSSL_OCF=y
BR2_PACKAGE_NEON_SSL=y
BR2_PACKAGE_OPENVPN_OPENSSL=y
# rpm requires libneon with SSL, XML and ZLIB support

...

need other parts?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
